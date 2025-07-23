mod cli;

use std::path::{Path, PathBuf};

use clap::Parser;
use cli::{Cli, Commands};
use configurer::core::appimage::{cleanup_appimage, install_appimage, list_appimages};
use std::io;

pub fn home_dir() -> Result<PathBuf, io::Error> {
    dirs::home_dir().ok_or(io::Error::new(
        io::ErrorKind::NotFound,
        "Home directory not found",
    ))
}

fn main() {
    let args = Cli::parse();

    match args.command {
        Commands::Install {
            appimage_path,
            app_name,
            replace,
        } => {
            install_appimage(Path::new(&appimage_path), app_name.as_deref(), replace)
                .expect("Failed to install appimage");
        }
        Commands::Cleanup { app_name, full } => {
            cleanup_appimage(&app_name, full).expect("Failed to cleanup appimage")
        }
        Commands::List {} => {
            list_appimages().expect("Failed to list appimages");
        }
    }
}
