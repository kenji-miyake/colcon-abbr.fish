function colcon_abbr_register
    $COLCON_ABBR_USE_SYMLINK && set symlink " --symlink-install" || set symlink ""
    set -q COLCON_ABBR_ADDITIONAL_OPTIONS && set additional_options " $COLCON_ABBR_ADDITIONAL_OPTIONS" || set additional_options ""
    set -q COLCON_ABBR_CMAKE_ARGS && set cmake_args " $COLCON_ABBR_CMAKE_ARGS" || set cmake_args ""

    set -l debug "-DCMAKE_BUILD_TYPE=Debug"
    set -l release "-DCMAKE_BUILD_TYPE=Release"
    set -l relwithdebinfo "-DCMAKE_BUILD_TYPE=RelWithDebInfo"

    set -l cb "colcon build$symlink$additional_options --cmake-args"

    abbr -a cb "$cb"
    abbr -a cbd "$cb $debug$cmake_args"
    abbr -a cbr "$cb $release$cmake_args"
    abbr -a cbrd "$cb $relwithdebinfo$cmake_args"

    abbr -a cbp "$cb --packages-up-to"
    abbr -a cbdp "$cb $debug$cmake_args --packages-up-to"
    abbr -a cbrp "$cb $release$cmake_args --packages-up-to"
    abbr -a cbrdp "$cb $relwithdebinfo$cmake_args --packages-up-to"

    abbr -a cbps "$cb --packages-select"
    abbr -a cbdps "$cb $debug$cmake_args --packages-select"
    abbr -a cbrps "$cb $release$cmake_args --packages-select"
    abbr -a cbrdps "$cb $relwithdebinfo$cmake_args --packages-select"
end
