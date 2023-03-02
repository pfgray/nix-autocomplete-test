#/usr/bin/env fish
complete -c dothis -f
complete -c dothis -n "not __fish_seen_subcommand_from $commands" \
    -a "now tomorrow never"