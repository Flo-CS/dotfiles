use std::{
    fs::{self, DirEntry},
    io,
    path::Path,
};

pub fn walk_dir(dir: &Path) -> Vec<DirEntry> {
    let mut files = vec![];
    if let Ok(entries) = fs::read_dir(dir) {
        for entry in entries.flatten() {
            let path = entry.path();
            if path.is_dir() {
                files.extend(walk_dir(&path));
            } else {
                files.push(entry);
            }
        }
    }
    files
}

pub fn remove_file_if_exists(path: &Path) -> Result<bool, io::Error> {
    if path.exists() {
        fs::remove_file(path)?;
        return Ok(true);
    }
    Ok(false)
}

#[cfg(unix)]
pub fn symlink(src: &Path, dst: &Path, force: bool) -> Result<(), io::Error> {
    if let Some(parent) = dst.parent() {
        fs::create_dir_all(parent)?;
    }
    if force && dst.exists() {
        fs::remove_file(dst)?;
    }
    return std::os::unix::fs::symlink(src, dst);
}
