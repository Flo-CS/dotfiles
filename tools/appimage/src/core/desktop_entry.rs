use std::{
    fs::{self, Permissions},
    io,
    os::unix::fs::PermissionsExt,
    path::{Path, PathBuf},
};

use dirs::{data_local_dir, executable_dir};
use ini::Ini;
use thiserror::Error;

use super::fsutils::remove_file_if_exists;

#[derive(Error, Debug)]
pub enum DesktopEntryError {
    #[error("IO error: {0}")]
    Io(#[from] io::Error),
    #[error("Missing file extension for path: {0}")]
    MissingExtension(PathBuf),
    #[error("Desktop entry already exists")]
    EntryAlreadyExist,
    #[error("Invalid desktop entry format")]
    InvalidEntry,
}

#[derive(Debug)]
pub struct DesktopEntry {
    pub file_stem: String,
    pub app_name: String,
    pub exec: PathBuf,
    pub icon: PathBuf,
}

impl DesktopEntry {
    pub fn new(file_stem: &str, app_name: &str, exec: PathBuf, icon: PathBuf) -> Self {
        DesktopEntry {
            file_stem: file_stem.to_string(),
            app_name: app_name.to_string(),
            exec,
            icon,
        }
    }
}

pub fn copy_desktop_entry_exec(
    file_stem: &str,
    src_path: &Path,
) -> Result<PathBuf, DesktopEntryError> {
    let local_bin = executable_dir().expect("Failed to get executable directory");

    let src_extension = src_path
        .extension()
        .and_then(|ext| ext.to_str())
        .ok_or_else(|| DesktopEntryError::MissingExtension(src_path.to_path_buf()))?;

    let final_path = local_bin.join(format!("{}.{}", file_stem, src_extension));
    fs::copy(src_path, &final_path)?;
    fs::set_permissions(&final_path, Permissions::from_mode(0o755))?;

    Ok(final_path)
}

pub fn copy_desktop_entry_icon(
    file_stem: &str,
    src_path: &Path,
) -> Result<PathBuf, DesktopEntryError> {
    let icons_dir = data_local_dir()
        .expect("Failed to get data local directory")
        .join("applications-icons");
    fs::create_dir_all(&icons_dir)?;

    let src_extension = src_path
        .extension()
        .and_then(|ext| ext.to_str())
        .ok_or_else(|| DesktopEntryError::MissingExtension(src_path.to_path_buf()))?;

    let final_path = icons_dir.join(format!("{}.{}", file_stem, src_extension));
    fs::copy(&src_path, &final_path)?;

    Ok(final_path)
}

pub fn write_desktop_entry_file(
    desktop_entry: &DesktopEntry,
    replace: bool,
) -> Result<PathBuf, DesktopEntryError> {
    let desktop_file_path = desktop_file_path(&desktop_entry.file_stem)?;
    if desktop_file_path.exists() {
        if replace {
            cleanup_desktop_entry(desktop_entry)?;
        } else {
            return Err(DesktopEntryError::EntryAlreadyExist);
        }
    }

    let mut content = Ini::new();
    content
        .with_section(Some("Desktop Entry"))
        .set("Type", "Application")
        .set("Name", &desktop_entry.app_name)
        .set("Exec", desktop_entry.exec.to_string_lossy())
        .set("Icon", desktop_entry.icon.to_string_lossy())
        .set("Terminal", "false")
        .set("Categories", "Utility;");

    content
        .write_to_file(&desktop_file_path)
        .map_err(|_| DesktopEntryError::InvalidEntry)?;

    Ok(desktop_file_path)
}

pub fn read_desktop_entry_file(path: &Path) -> Result<DesktopEntry, DesktopEntryError> {
    let ini = Ini::load_from_file(path).map_err(|_| DesktopEntryError::InvalidEntry)?;

    let section = ini
        .section(Some("Desktop Entry"))
        .ok_or(DesktopEntryError::InvalidEntry)?;

    let name = section
        .get("Name")
        .ok_or(DesktopEntryError::InvalidEntry)?
        .to_string();

    let exec = section
        .get("Exec")
        .map(|s| Path::new(s))
        .ok_or(DesktopEntryError::InvalidEntry)?;

    let icon = section
        .get("Icon")
        .map(|s| Path::new(s))
        .ok_or(DesktopEntryError::InvalidEntry)?;

    return Ok(DesktopEntry {
        file_stem: path
            .file_stem()
            .ok_or(DesktopEntryError::InvalidEntry)?
            .to_string_lossy()
            .to_string(),
        app_name: name,
        exec: exec.to_path_buf(),
        icon: icon.to_path_buf(),
    });
}

pub fn cleanup_desktop_entry(desktop_entry: &DesktopEntry) -> Result<(), DesktopEntryError> {
    remove_file_if_exists(&desktop_entry.exec)?;
    remove_file_if_exists(&desktop_entry.icon)?;
    remove_file_if_exists(&desktop_file_path(&desktop_entry.file_stem)?)?;

    Ok(())
}

pub fn desktop_file_path(file_stem: &str) -> Result<PathBuf, DesktopEntryError> {
    Ok(data_local_dir()
        .expect("Failed to get data local directory")
        .join("applications")
        .join(format!("{}.desktop", file_stem)))
}

pub fn list_desktop_entries() -> Result<Vec<DesktopEntry>, DesktopEntryError> {
    let data_dir = data_local_dir().expect("Failed to get data local directory");

    let applications_dir = data_dir.join("applications");

    if !applications_dir.exists() {
        return Ok(vec![]);
    }

    let mut entries = Vec::new();
    for entry in fs::read_dir(applications_dir)? {
        let entry = entry?;
        if entry.path().extension().is_some_and(|ext| ext == "desktop") {
            let desktop_entry = read_desktop_entry_file(&entry.path())?;
            entries.push(desktop_entry)
        }
    }

    Ok(entries)
}
