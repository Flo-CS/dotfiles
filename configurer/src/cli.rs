use clap::{Parser, Subcommand, command};

#[derive(Debug, Parser)]
#[command(name = "configurer")]
#[command(about = "A CLI tool for installing, configuring and managing system settings")]
pub struct Cli {
    #[command(subcommand)]
    pub command: Commands,
}

#[derive(Debug, Subcommand)]
pub enum Commands {
    InstallFeatures { features: Vec<String> },
    SwitchTheme { theme: String },
}
