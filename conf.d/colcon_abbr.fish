# Set default values
set -q COLCON_ABBR_USE_SYMLINK || set -U COLCON_ABBR_USE_SYMLINK true
set -q COLCON_ABBR_CMAKE_ARGS || set -U COLCON_ABBR_CMAKE_ARGS "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON"

# Register abbreviations
colcon_abbr_register

# Use argcomplete if found
if command -v register-python-argcomplete >/dev/null 2>&1
    register-python-argcomplete --shell fish colcon | source
else
    echo "argcomplete was not found"
end
