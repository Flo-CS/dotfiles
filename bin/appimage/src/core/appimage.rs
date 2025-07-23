use std::fs::{self};
use std::path::{Path, PathBuf};
use std::process::{Command, Stdio};

use regex::Regex;
use std::io::{self};
use tempfile::tempdir;
use thiserror::Error;

use super::desktop_entry::{
    DesktopEntry, DesktopEntryError, cleanup_desktop_entry, copy_desktop_entry_exec,
    copy_desktop_entry_icon, desktop_file_path, list_desktop_entries, read_desktop_entry_file,
    write_desktop_entry_file,
};
use super::fsutils::walk_dir;

#[derive(Error, Debug)]
pub enum AppImageError {
    #[error("IO error: {0}")]
    Io(#[from] io::Error),
    #[error("Regex error: {0}")]
    Regex(regex::Error),
    #[error("Desktop entry error: {0:?}")]
    DesktopEntry(#[from] DesktopEntryError),
    #[error("Invalid AppImage path")]
    InvalidAppImagePath,
    #[error("Extraction failed")]
    ExtractionFailed,
    #[error("No icon found in the AppImage")]
    NoIconFound,
}

pub fn install_appimage(
    appimage_path: &Path,
    app_name: Option<&str>,
    replace: bool,
) -> Result<PathBuf, AppImageError> {
    if !appimage_path.exists() || !appimage_path.is_file() {
        return Err(AppImageError::InvalidAppImagePath);
    }

    let implicit_app_name = appimage_path
        .file_stem()
        .ok_or(AppImageError::InvalidAppImagePath)?
        .to_string_lossy()
        .to_string();
    let app_name = app_name.unwrap_or(&implicit_app_name);

    let tmp_dir = tempdir()?;
    let tmp_dir = tmp_dir.path();
    fs::create_dir_all(&tmp_dir)?;

    let extract_path = extract_appimage(appimage_path, &tmp_dir)?;
    let icon_path = find_icon_files_candidates(&extract_path)?
        .into_iter()
        .next()
        .expect("At least one icon file should be found");

    let dst_appimage_path = copy_desktop_entry_exec(&implicit_app_name, &appimage_path)?;
    let dst_icon_path = copy_desktop_entry_icon(&implicit_app_name, &icon_path)?;

    let desktop_entry = DesktopEntry::new(&app_name, app_name, dst_appimage_path, dst_icon_path);

    let desktop_entry_path = write_desktop_entry_file(&desktop_entry, replace)?;

    Ok(desktop_entry_path)
}

pub fn cleanup_appimage(app_name: &str, full: bool) -> Result<(), AppImageError> {
    let desktop_file_path = desktop_file_path(app_name)?;
    let desktop_entry = read_desktop_entry_file(&desktop_file_path)?;

    if full {
        cleanup_desktop_entry(&desktop_entry)?;
    } else {
        fs::remove_file(&desktop_file_path)?;
    }

    Ok(())
}

pub fn list_appimages() -> Result<(), AppImageError> {
    let desktop_entries = list_desktop_entries()?;

    for desktop_entry in desktop_entries {
        println!(
            "App: {:?}, Exec: {:?}",
            desktop_entry.app_name, desktop_entry.exec
        );
    }

    Ok(())
}

fn extract_appimage(path: &Path, dst_path: &Path) -> Result<PathBuf, AppImageError> {
    let status = Command::new(path)
        .arg("--appimage-extract")
        .current_dir(dst_path)
        .stderr(Stdio::null())
        .stdout(Stdio::null())
        .status()?;

    if !status.success() {
        return Err(AppImageError::ExtractionFailed);
    }

    Ok(dst_path.join("squashfs-root"))
}

fn find_icon_files_candidates(appimage_extract_dir: &Path) -> Result<Vec<PathBuf>, AppImageError> {
    let icon_regex = Regex::new("(?i)icon.*\\.(png|svg)$").unwrap();

    let icon_files = walk_dir(appimage_extract_dir)
        .into_iter()
        .map(|entry| entry.path())
        .filter(|p| icon_regex.is_match(&p.to_string_lossy()))
        .collect::<Vec<PathBuf>>();

    if icon_files.len() <= 0 {
        return Err(AppImageError::NoIconFound);
    }

    Ok(icon_files)
}
