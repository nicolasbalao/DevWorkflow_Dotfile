function ensure
    set -l cmd $argv[1]

    if not type -q $cmd
        set_color yellow
        echo "[warn] '$cmd' not installed config not loaded \n"
        set_color normal
        return 1
    end
    return 0
end
