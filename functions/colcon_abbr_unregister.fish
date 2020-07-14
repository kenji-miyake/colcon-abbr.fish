function colcon_abbr_unregister
    for name in (abbr --list | grep "^cb")
        echo "[colcon-abbr] unregister $name"
        abbr --erase $name
    end
end
