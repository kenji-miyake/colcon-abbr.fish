function colcon_abbr_register
    register_colcon_build
    register_colcon_test
end

function register_colcon_build
    $COLCON_ABBR_USE_SYMLINK && set symlink " --symlink-install" || set symlink ""
    set -q COLCON_ABBR_ADDITIONAL_OPTIONS && set additional_options " $COLCON_ABBR_ADDITIONAL_OPTIONS" || set additional_options ""
    set -q COLCON_ABBR_CMAKE_ARGS && set cmake_args " $COLCON_ABBR_CMAKE_ARGS" || set cmake_args ""

    set -l debug "-DCMAKE_BUILD_TYPE=Debug"
    set -l release "-DCMAKE_BUILD_TYPE=Release"
    set -l rel_with_deb_info "-DCMAKE_BUILD_TYPE=RelWithDebInfo"

    set -l cb "colcon build$symlink$additional_options --cmake-args$cmake_args"

    # colcon build
    abbr -a cbd "$cb $debug"
    abbr -a cbr "$cb $release"
    abbr -a cbrd "$cb $rel_with_deb_info"

    # colcon build --packages-up-to
    abbr -a cbdp "$cb $debug --packages-up-to"
    abbr -a cbrp "$cb $release --packages-up-to"
    abbr -a cbrdp "$cb $rel_with_deb_info --packages-up-to"

    # colcon build --packages-select
    abbr -a cbdps "$cb $debug --packages-select"
    abbr -a cbrps "$cb $release --packages-select"
    abbr -a cbrdps "$cb $rel_with_deb_info --packages-select"
end

function register_colcon_test
    set -q COLCON_ABBR_TEST_OPTIONS && set test_options " $COLCON_ABBR_TEST_OPTIONS" || set test_options ""

    set -l ct "colcon test$test_options"

    abbr -a ct "$ct"
    abbr -a ctp "$ct --packages-up-to"
    abbr -a ctps "$ct --packages-select"
end
