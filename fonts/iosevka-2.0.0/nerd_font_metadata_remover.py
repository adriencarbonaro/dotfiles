#-------------------------------------------------------------------------------
# Use this file for Nerd Font patched fonts to remove the occurences of Nerd Font
# and add custom metadata
#-------------------------------------------------------------------------------

from fontTools.ttLib import TTFont
from sys import argv

# --- USER SETTINGS ---
input_font_path = argv[1]
output_font_path = input_font_path.replace("NerdFont", "")

# Define the substring to remove from name fields
substrings_to_remove = [ " Nerd Font", "NF" ]

# Optionally, specify replacements per field (if needed)
# Leave empty if you just want to remove the substring
custom_replacements = {
    "Version": ("Version 33.3.3; ttfautohint (v1.8.3);Nerd Fonts 3.4.0", "Adrien 2.0.0; Nerd Fonts 3.4.0"),
    "Copyright": ("Copyright 2015-2025, Renzhi Li (aka. Belleve Invis, belleve@typeof.net).", "Copyright 2025, Adrien Carbonaro (carbonaro.adrien@gmail.com)"),
    "Manufacturer": ("Belleve Invis", "Adrien Carbonaro"),
    "Designer": ("Belleve Invis", "Adrien Carbonaro"),
}

def modify_font_names(input_path, output_path, substrings, replacements):
    font = TTFont(input_path)
    name_table = font["name"]

    for record in name_table.names:
        # Decode record string safely
        try:
            name_str = record.string.decode(record.getEncoding())
        except Exception:
            name_str = record.toUnicode()

        print(f"record: {record}")

        original_name = name_str

        # Remove the substring if present
        for substring in substrings:
            if substring and substring in name_str:
                print(f"  removing \"{substring}\"")
                name_str = name_str.replace(substring, "")

        # Apply custom replacements if defined
        for field, (old, new) in replacements.items():
            if old in name_str:
                print(f"  replacing {old} with {new}")
                name_str = name_str.replace(old, new)

        # If the name was modified, update the record
        if name_str != original_name:
            record.string = name_str.encode(record.getEncoding())
        print("")

    # Save the modified font
    font.save(output_path)
    print(f"✅ Modified font saved to: {output_path}")

modify_font_names(input_font_path, output_font_path, substrings_to_remove, custom_replacements)
