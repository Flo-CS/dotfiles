use std::process::Command;

enum ThemeError {
    ThemeDoesNotExist(String),
    CurrentThemeCannotBeDetermined,
}

trait ThemableConfig {
    fn current_theme(&self) -> Result<String, ThemeError>;
    fn set_theme(&mut self, theme: String) -> Result<(), ThemeError>;
    fn install_themes(&mut self, themes: Vec<String>) -> Result<(), ThemeError>;
}

struct BatPkgConfig {
    pub installed_themes: Vec<String>,
}

impl BatPkgConfig {
    pub fn new() -> Self {
        todo!()
    }
}

impl ThemableConfig for BatPkgConfig {
    fn current_theme(&self) -> Result<String, ThemeError> {
        return Err(ThemeError::CurrentThemeCannotBeDetermined);
    }

    fn set_theme(&mut self, theme: String) -> Result<(), ThemeError> {
        if !self.installed_themes.contains(&theme) {
            return Err(ThemeError::ThemeDoesNotExist(theme));
        }
        todo!()
    }

    fn install_themes(&mut self, themes: Vec<String>) -> Result<(), ThemeError> {
        todo!()
    }
}
