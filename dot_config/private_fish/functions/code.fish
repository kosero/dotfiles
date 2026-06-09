function code
    command code $argv > /dev/null 2>&1 &
    disown
end
