# Syntax highlighting

# Inspect TM Scopes

`Command Palette` > `Inspect TM Scopes` helps to get scopes name at cursor position. It is helpful if you want to change a specific scope color/fontStyle.

# Settings.json

The settings can be modified in `$HOME/.config/Code/User/settings.json`.

To change the python function name color/style :

```json
{
    "editor.tokenColorCustomizations": {
        "textMateRules": [
            {
                "scope": [
                    "entity.name.function.python"
                ],
                "settings": {
                    "fontStyle": "bold"
                }
            }
        ]
    }
}
```
