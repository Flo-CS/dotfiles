mod cli;

use clap::Parser;
use cli::{Cli, Commands};

fn main() {
    let args = Cli::parse();

    match args.command {
        Commands::InstallFeatures { features } => {
            println!("Installing features... {:?}", features);
        }
        Commands::SwitchTheme { theme } => {
            println!("Switching theme to: {}", theme);
        }
    }
}
