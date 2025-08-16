use clap::{Parser, Subcommand};

#[derive(Debug, Parser)]
#[command(name = "appimage-cli")]
pub struct Cli {
    #[command(subcommand)]
    pub command: Commands,
}

#[derive(Debug, Subcommand)]
pub enum Commands {
    Install {
        appimage_path: String,
        app_name: Option<String>,
        #[arg(short, long)]
        replace: bool,
    },
    Cleanup {
        app_name: String,
        #[arg(short, long)]
        #[arg(help = "Cleanup all resources (bin,icon) related to the appimage")]
        full: bool,
    },
    List {},
}
