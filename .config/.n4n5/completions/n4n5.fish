# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_n4n5_global_optspecs
	string join \n config= d/debug use-input h/help V/version
end

function __fish_n4n5_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_n4n5_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_n4n5_using_subcommand
	set -l cmd (__fish_n4n5_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c n4n5 -n "__fish_n4n5_needs_command" -l config -d 'Sets a custom config file' -r -F
complete -c n4n5 -n "__fish_n4n5_needs_command" -s d -l debug -d 'Turn debugging information on'
complete -c n4n5 -n "__fish_n4n5_needs_command" -l use-input -d 'whether to use input for configuration'
complete -c n4n5 -n "__fish_n4n5_needs_command" -s h -l help -d 'Print help'
complete -c n4n5 -n "__fish_n4n5_needs_command" -s V -l version -d 'Print version'
complete -c n4n5 -n "__fish_n4n5_needs_command" -f -a "config" -d 'config subcommand'
complete -c n4n5 -n "__fish_n4n5_needs_command" -f -a "gh" -d 'gh subcommand'
complete -c n4n5 -n "__fish_n4n5_needs_command" -f -a "movies" -d 'movies subcommand'
complete -c n4n5 -n "__fish_n4n5_needs_command" -f -a "completions" -d 'generate completions'
complete -c n4n5 -n "__fish_n4n5_needs_command" -f -a "shortcuts" -d 'Shortcuts subcommand'
complete -c n4n5 -n "__fish_n4n5_needs_command" -f -a "man" -d 'generate man'
complete -c n4n5 -n "__fish_n4n5_needs_command" -f -a "list_crates" -d 'list crates subcommand'
complete -c n4n5 -n "__fish_n4n5_needs_command" -f -a "git-mover" -d 'Launch git-mover cli'
complete -c n4n5 -n "__fish_n4n5_needs_command" -f -a "music" -d 'music subcommand'
complete -c n4n5 -n "__fish_n4n5_needs_command" -f -a "share" -d 'Quick http server share'
complete -c n4n5 -n "__fish_n4n5_needs_command" -f -a "watching" -d 'List watching repos'
complete -c n4n5 -n "__fish_n4n5_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c n4n5 -n "__fish_n4n5_using_subcommand config; and not __fish_seen_subcommand_from open help" -s h -l help -d 'Print help'
complete -c n4n5 -n "__fish_n4n5_using_subcommand config; and not __fish_seen_subcommand_from open help" -f -a "open" -d 'Open config with default editor'
complete -c n4n5 -n "__fish_n4n5_using_subcommand config; and not __fish_seen_subcommand_from open help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c n4n5 -n "__fish_n4n5_using_subcommand config; and __fish_seen_subcommand_from open" -s p -l path -d 'Print the path'
complete -c n4n5 -n "__fish_n4n5_using_subcommand config; and __fish_seen_subcommand_from open" -s h -l help -d 'Print help'
complete -c n4n5 -n "__fish_n4n5_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "open" -d 'Open config with default editor'
complete -c n4n5 -n "__fish_n4n5_using_subcommand config; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c n4n5 -n "__fish_n4n5_using_subcommand gh; and not __fish_seen_subcommand_from pulls projects help" -s h -l help -d 'Print help'
complete -c n4n5 -n "__fish_n4n5_using_subcommand gh; and not __fish_seen_subcommand_from pulls projects help" -f -a "pulls" -d 'Save pulls'
complete -c n4n5 -n "__fish_n4n5_using_subcommand gh; and not __fish_seen_subcommand_from pulls projects help" -f -a "projects" -d 'Save projects'
complete -c n4n5 -n "__fish_n4n5_using_subcommand gh; and not __fish_seen_subcommand_from pulls projects help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c n4n5 -n "__fish_n4n5_using_subcommand gh; and __fish_seen_subcommand_from pulls" -s j -l json -d 'Print as JSON'
complete -c n4n5 -n "__fish_n4n5_using_subcommand gh; and __fish_seen_subcommand_from pulls" -s h -l help -d 'Print help'
complete -c n4n5 -n "__fish_n4n5_using_subcommand gh; and __fish_seen_subcommand_from projects" -s j -l json -d 'Print as JSON'
complete -c n4n5 -n "__fish_n4n5_using_subcommand gh; and __fish_seen_subcommand_from projects" -s h -l help -d 'Print help'
complete -c n4n5 -n "__fish_n4n5_using_subcommand gh; and __fish_seen_subcommand_from help" -f -a "pulls" -d 'Save pulls'
complete -c n4n5 -n "__fish_n4n5_using_subcommand gh; and __fish_seen_subcommand_from help" -f -a "projects" -d 'Save projects'
complete -c n4n5 -n "__fish_n4n5_using_subcommand gh; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c n4n5 -n "__fish_n4n5_using_subcommand movies; and not __fish_seen_subcommand_from add open stats show sync help" -s h -l help -d 'Print help'
complete -c n4n5 -n "__fish_n4n5_using_subcommand movies; and not __fish_seen_subcommand_from add open stats show sync help" -f -a "add" -d 'add a movie'
complete -c n4n5 -n "__fish_n4n5_using_subcommand movies; and not __fish_seen_subcommand_from add open stats show sync help" -f -a "open" -d 'open movie file'
complete -c n4n5 -n "__fish_n4n5_using_subcommand movies; and not __fish_seen_subcommand_from add open stats show sync help" -f -a "stats" -d 'Show stats of movies'
complete -c n4n5 -n "__fish_n4n5_using_subcommand movies; and not __fish_seen_subcommand_from add open stats show sync help" -f -a "show" -d 'Show movies list'
complete -c n4n5 -n "__fish_n4n5_using_subcommand movies; and not __fish_seen_subcommand_from add open stats show sync help" -f -a "sync" -d 'Sync movies file'
complete -c n4n5 -n "__fish_n4n5_using_subcommand movies; and not __fish_seen_subcommand_from add open stats show sync help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c n4n5 -n "__fish_n4n5_using_subcommand movies; and __fish_seen_subcommand_from add" -s h -l help -d 'Print help'
complete -c n4n5 -n "__fish_n4n5_using_subcommand movies; and __fish_seen_subcommand_from open" -s p -l path -d 'print path of movies file'
complete -c n4n5 -n "__fish_n4n5_using_subcommand movies; and __fish_seen_subcommand_from open" -s h -l help -d 'Print help'
complete -c n4n5 -n "__fish_n4n5_using_subcommand movies; and __fish_seen_subcommand_from stats" -s j -l json -d 'print stats as json'
complete -c n4n5 -n "__fish_n4n5_using_subcommand movies; and __fish_seen_subcommand_from stats" -s h -l help -d 'Print help'
complete -c n4n5 -n "__fish_n4n5_using_subcommand movies; and __fish_seen_subcommand_from show" -s r -l reverse -d 'reverse mode'
complete -c n4n5 -n "__fish_n4n5_using_subcommand movies; and __fish_seen_subcommand_from show" -s f -l full -d 'show full mode'
complete -c n4n5 -n "__fish_n4n5_using_subcommand movies; and __fish_seen_subcommand_from show" -s c -l comment -d 'show comment'
complete -c n4n5 -n "__fish_n4n5_using_subcommand movies; and __fish_seen_subcommand_from show" -s h -l help -d 'Print help'
complete -c n4n5 -n "__fish_n4n5_using_subcommand movies; and __fish_seen_subcommand_from sync" -s j -l json -d 'print as json'
complete -c n4n5 -n "__fish_n4n5_using_subcommand movies; and __fish_seen_subcommand_from sync" -s h -l help -d 'Print help'
complete -c n4n5 -n "__fish_n4n5_using_subcommand movies; and __fish_seen_subcommand_from help" -f -a "add" -d 'add a movie'
complete -c n4n5 -n "__fish_n4n5_using_subcommand movies; and __fish_seen_subcommand_from help" -f -a "open" -d 'open movie file'
complete -c n4n5 -n "__fish_n4n5_using_subcommand movies; and __fish_seen_subcommand_from help" -f -a "stats" -d 'Show stats of movies'
complete -c n4n5 -n "__fish_n4n5_using_subcommand movies; and __fish_seen_subcommand_from help" -f -a "show" -d 'Show movies list'
complete -c n4n5 -n "__fish_n4n5_using_subcommand movies; and __fish_seen_subcommand_from help" -f -a "sync" -d 'Sync movies file'
complete -c n4n5 -n "__fish_n4n5_using_subcommand movies; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c n4n5 -n "__fish_n4n5_using_subcommand completions" -s h -l help -d 'Print help'
complete -c n4n5 -n "__fish_n4n5_using_subcommand shortcuts; and not __fish_seen_subcommand_from sync-git sync-all help" -s h -l help -d 'Print help'
complete -c n4n5 -n "__fish_n4n5_using_subcommand shortcuts; and not __fish_seen_subcommand_from sync-git sync-all help" -f -a "sync-git" -d 'Sync git repos between GitHub and Codeberg'
complete -c n4n5 -n "__fish_n4n5_using_subcommand shortcuts; and not __fish_seen_subcommand_from sync-git sync-all help" -f -a "sync-all" -d 'Sync all'
complete -c n4n5 -n "__fish_n4n5_using_subcommand shortcuts; and not __fish_seen_subcommand_from sync-git sync-all help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c n4n5 -n "__fish_n4n5_using_subcommand shortcuts; and __fish_seen_subcommand_from sync-git" -s h -l help -d 'Print help'
complete -c n4n5 -n "__fish_n4n5_using_subcommand shortcuts; and __fish_seen_subcommand_from sync-all" -s h -l help -d 'Print help'
complete -c n4n5 -n "__fish_n4n5_using_subcommand shortcuts; and __fish_seen_subcommand_from help" -f -a "sync-git" -d 'Sync git repos between GitHub and Codeberg'
complete -c n4n5 -n "__fish_n4n5_using_subcommand shortcuts; and __fish_seen_subcommand_from help" -f -a "sync-all" -d 'Sync all'
complete -c n4n5 -n "__fish_n4n5_using_subcommand shortcuts; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c n4n5 -n "__fish_n4n5_using_subcommand man" -s h -l help -d 'Print help'
complete -c n4n5 -n "__fish_n4n5_using_subcommand list_crates" -l username -d 'Specify username' -r
complete -c n4n5 -n "__fish_n4n5_using_subcommand list_crates" -l user-agent -d 'Specify user agent' -r
complete -c n4n5 -n "__fish_n4n5_using_subcommand list_crates" -l output-markdown -d 'Output markdown' -r -F
complete -c n4n5 -n "__fish_n4n5_using_subcommand list_crates" -l output-list -d 'Output list' -r -F
complete -c n4n5 -n "__fish_n4n5_using_subcommand list_crates" -l output-list-full -d 'Output list long/full' -r -F
complete -c n4n5 -n "__fish_n4n5_using_subcommand list_crates" -l delay -d 'Request delay (in milliseconds)' -r
complete -c n4n5 -n "__fish_n4n5_using_subcommand list_crates" -l filtered -d 'Filter crates' -r
complete -c n4n5 -n "__fish_n4n5_using_subcommand list_crates" -l specials -d 'Specials crates' -r
complete -c n4n5 -n "__fish_n4n5_using_subcommand list_crates" -l verbose -d 'Verbose'
complete -c n4n5 -n "__fish_n4n5_using_subcommand list_crates" -s h -l help -d 'Print help'
complete -c n4n5 -n "__fish_n4n5_using_subcommand git-mover" -l source -l from -d 'The source platform (github, gitlab, codeberg)' -r
complete -c n4n5 -n "__fish_n4n5_using_subcommand git-mover" -l destination -l to -d 'The destination platform (github, gitlab, codeberg)' -r
complete -c n4n5 -n "__fish_n4n5_using_subcommand git-mover" -l config -d 'Custom configuration file path' -r -F
complete -c n4n5 -n "__fish_n4n5_using_subcommand git-mover" -l no-forks -d 'Don\'t sync forked repositories'
complete -c n4n5 -n "__fish_n4n5_using_subcommand git-mover" -l no-delete -d 'Don\'t delete repositories'
complete -c n4n5 -n "__fish_n4n5_using_subcommand git-mover" -l resync -d 'Resync all repositories'
complete -c n4n5 -n "__fish_n4n5_using_subcommand git-mover" -l show-config-path -d 'Show the current config path and exit'
complete -c n4n5 -n "__fish_n4n5_using_subcommand git-mover" -l manual -d 'Sync manually'
complete -c n4n5 -n "__fish_n4n5_using_subcommand git-mover" -s v -s d -l verbose -d 'Verbose mode'
complete -c n4n5 -n "__fish_n4n5_using_subcommand git-mover" -s h -l help -d 'Print help'
complete -c n4n5 -n "__fish_n4n5_using_subcommand music; and not __fish_seen_subcommand_from sync open help" -s h -l help -d 'Print help'
complete -c n4n5 -n "__fish_n4n5_using_subcommand music; and not __fish_seen_subcommand_from sync open help" -f -a "sync" -d 'Save music'
complete -c n4n5 -n "__fish_n4n5_using_subcommand music; and not __fish_seen_subcommand_from sync open help" -f -a "open" -d 'Open music file'
complete -c n4n5 -n "__fish_n4n5_using_subcommand music; and not __fish_seen_subcommand_from sync open help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c n4n5 -n "__fish_n4n5_using_subcommand music; and __fish_seen_subcommand_from sync" -s h -l help -d 'Print help'
complete -c n4n5 -n "__fish_n4n5_using_subcommand music; and __fish_seen_subcommand_from open" -s p -l path -d 'Print the path only'
complete -c n4n5 -n "__fish_n4n5_using_subcommand music; and __fish_seen_subcommand_from open" -s h -l help -d 'Print help'
complete -c n4n5 -n "__fish_n4n5_using_subcommand music; and __fish_seen_subcommand_from help" -f -a "sync" -d 'Save music'
complete -c n4n5 -n "__fish_n4n5_using_subcommand music; and __fish_seen_subcommand_from help" -f -a "open" -d 'Open music file'
complete -c n4n5 -n "__fish_n4n5_using_subcommand music; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c n4n5 -n "__fish_n4n5_using_subcommand share" -s h -l help -d 'Print help'
complete -c n4n5 -n "__fish_n4n5_using_subcommand watching" -s h -l help -d 'Print help'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and not __fish_seen_subcommand_from config gh movies completions shortcuts man list_crates git-mover music share watching help" -f -a "config" -d 'config subcommand'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and not __fish_seen_subcommand_from config gh movies completions shortcuts man list_crates git-mover music share watching help" -f -a "gh" -d 'gh subcommand'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and not __fish_seen_subcommand_from config gh movies completions shortcuts man list_crates git-mover music share watching help" -f -a "movies" -d 'movies subcommand'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and not __fish_seen_subcommand_from config gh movies completions shortcuts man list_crates git-mover music share watching help" -f -a "completions" -d 'generate completions'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and not __fish_seen_subcommand_from config gh movies completions shortcuts man list_crates git-mover music share watching help" -f -a "shortcuts" -d 'Shortcuts subcommand'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and not __fish_seen_subcommand_from config gh movies completions shortcuts man list_crates git-mover music share watching help" -f -a "man" -d 'generate man'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and not __fish_seen_subcommand_from config gh movies completions shortcuts man list_crates git-mover music share watching help" -f -a "list_crates" -d 'list crates subcommand'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and not __fish_seen_subcommand_from config gh movies completions shortcuts man list_crates git-mover music share watching help" -f -a "git-mover" -d 'Launch git-mover cli'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and not __fish_seen_subcommand_from config gh movies completions shortcuts man list_crates git-mover music share watching help" -f -a "music" -d 'music subcommand'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and not __fish_seen_subcommand_from config gh movies completions shortcuts man list_crates git-mover music share watching help" -f -a "share" -d 'Quick http server share'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and not __fish_seen_subcommand_from config gh movies completions shortcuts man list_crates git-mover music share watching help" -f -a "watching" -d 'List watching repos'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and not __fish_seen_subcommand_from config gh movies completions shortcuts man list_crates git-mover music share watching help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "open" -d 'Open config with default editor'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and __fish_seen_subcommand_from gh" -f -a "pulls" -d 'Save pulls'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and __fish_seen_subcommand_from gh" -f -a "projects" -d 'Save projects'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and __fish_seen_subcommand_from movies" -f -a "add" -d 'add a movie'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and __fish_seen_subcommand_from movies" -f -a "open" -d 'open movie file'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and __fish_seen_subcommand_from movies" -f -a "stats" -d 'Show stats of movies'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and __fish_seen_subcommand_from movies" -f -a "show" -d 'Show movies list'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and __fish_seen_subcommand_from movies" -f -a "sync" -d 'Sync movies file'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and __fish_seen_subcommand_from shortcuts" -f -a "sync-git" -d 'Sync git repos between GitHub and Codeberg'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and __fish_seen_subcommand_from shortcuts" -f -a "sync-all" -d 'Sync all'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and __fish_seen_subcommand_from music" -f -a "sync" -d 'Save music'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and __fish_seen_subcommand_from music" -f -a "open" -d 'Open music file'
