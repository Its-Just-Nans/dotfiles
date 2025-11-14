# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_n4n5_global_optspecs
	string join \n c/config= d/debug h/help
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

complete -c n4n5 -n "__fish_n4n5_needs_command" -s c -l config -d 'Sets a custom config file' -r -F
complete -c n4n5 -n "__fish_n4n5_needs_command" -s d -l debug -d 'Turn debugging information on'
complete -c n4n5 -n "__fish_n4n5_needs_command" -s h -l help -d 'Print help'
complete -c n4n5 -n "__fish_n4n5_needs_command" -f -a "utils" -d 'utils subcommand'
complete -c n4n5 -n "__fish_n4n5_needs_command" -f -a "music" -d 'music subcommand'
complete -c n4n5 -n "__fish_n4n5_needs_command" -f -a "config" -d 'config subcommand'
complete -c n4n5 -n "__fish_n4n5_needs_command" -f -a "gh" -d 'gh subcommand'
complete -c n4n5 -n "__fish_n4n5_needs_command" -f -a "helpers" -d 'helpers subcommand'
complete -c n4n5 -n "__fish_n4n5_needs_command" -f -a "movies" -d 'movies subcommand'
complete -c n4n5 -n "__fish_n4n5_needs_command" -f -a "sync" -d 'sync subcommand'
complete -c n4n5 -n "__fish_n4n5_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c n4n5 -n "__fish_n4n5_using_subcommand utils; and not __fish_seen_subcommand_from list_crates help" -s h -l help -d 'Print help'
complete -c n4n5 -n "__fish_n4n5_using_subcommand utils; and not __fish_seen_subcommand_from list_crates help" -f -a "list_crates" -d 'list_crates subcommand'
complete -c n4n5 -n "__fish_n4n5_using_subcommand utils; and not __fish_seen_subcommand_from list_crates help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c n4n5 -n "__fish_n4n5_using_subcommand utils; and __fish_seen_subcommand_from list_crates" -l username -d 'Specify username' -r
complete -c n4n5 -n "__fish_n4n5_using_subcommand utils; and __fish_seen_subcommand_from list_crates" -l user-agent -d 'Specify user agent' -r
complete -c n4n5 -n "__fish_n4n5_using_subcommand utils; and __fish_seen_subcommand_from list_crates" -l output-markdown -d 'Output markdown' -r -F
complete -c n4n5 -n "__fish_n4n5_using_subcommand utils; and __fish_seen_subcommand_from list_crates" -l output-list -d 'Output list' -r -F
complete -c n4n5 -n "__fish_n4n5_using_subcommand utils; and __fish_seen_subcommand_from list_crates" -l output-list-full -d 'Output list long/full' -r -F
complete -c n4n5 -n "__fish_n4n5_using_subcommand utils; and __fish_seen_subcommand_from list_crates" -l delay -d 'Request delay (in seconds)' -r
complete -c n4n5 -n "__fish_n4n5_using_subcommand utils; and __fish_seen_subcommand_from list_crates" -l filtered -d 'Filter crates' -r
complete -c n4n5 -n "__fish_n4n5_using_subcommand utils; and __fish_seen_subcommand_from list_crates" -l specials -d 'Filter crates' -r
complete -c n4n5 -n "__fish_n4n5_using_subcommand utils; and __fish_seen_subcommand_from list_crates" -l verbose -d 'Filter crates'
complete -c n4n5 -n "__fish_n4n5_using_subcommand utils; and __fish_seen_subcommand_from list_crates" -s h -l help -d 'Print help'
complete -c n4n5 -n "__fish_n4n5_using_subcommand utils; and __fish_seen_subcommand_from help" -f -a "list_crates" -d 'list_crates subcommand'
complete -c n4n5 -n "__fish_n4n5_using_subcommand utils; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
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
complete -c n4n5 -n "__fish_n4n5_using_subcommand helpers; and not __fish_seen_subcommand_from completions man help" -s h -l help -d 'Print help'
complete -c n4n5 -n "__fish_n4n5_using_subcommand helpers; and not __fish_seen_subcommand_from completions man help" -f -a "completions" -d 'generate completions'
complete -c n4n5 -n "__fish_n4n5_using_subcommand helpers; and not __fish_seen_subcommand_from completions man help" -f -a "man" -d 'generate man'
complete -c n4n5 -n "__fish_n4n5_using_subcommand helpers; and not __fish_seen_subcommand_from completions man help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c n4n5 -n "__fish_n4n5_using_subcommand helpers; and __fish_seen_subcommand_from completions" -s h -l help -d 'Print help'
complete -c n4n5 -n "__fish_n4n5_using_subcommand helpers; and __fish_seen_subcommand_from man" -s h -l help -d 'Print help'
complete -c n4n5 -n "__fish_n4n5_using_subcommand helpers; and __fish_seen_subcommand_from help" -f -a "completions" -d 'generate completions'
complete -c n4n5 -n "__fish_n4n5_using_subcommand helpers; and __fish_seen_subcommand_from help" -f -a "man" -d 'generate man'
complete -c n4n5 -n "__fish_n4n5_using_subcommand helpers; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
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
complete -c n4n5 -n "__fish_n4n5_using_subcommand sync; and not __fish_seen_subcommand_from settings movies programs music all help" -s h -l help -d 'Print help'
complete -c n4n5 -n "__fish_n4n5_using_subcommand sync; and not __fish_seen_subcommand_from settings movies programs music all help" -f -a "settings" -d 'save settings'
complete -c n4n5 -n "__fish_n4n5_using_subcommand sync; and not __fish_seen_subcommand_from settings movies programs music all help" -f -a "movies" -d 'sync movies'
complete -c n4n5 -n "__fish_n4n5_using_subcommand sync; and not __fish_seen_subcommand_from settings movies programs music all help" -f -a "programs" -d 'sync programs'
complete -c n4n5 -n "__fish_n4n5_using_subcommand sync; and not __fish_seen_subcommand_from settings movies programs music all help" -f -a "music" -d 'sync music'
complete -c n4n5 -n "__fish_n4n5_using_subcommand sync; and not __fish_seen_subcommand_from settings movies programs music all help" -f -a "all" -d 'sync all'
complete -c n4n5 -n "__fish_n4n5_using_subcommand sync; and not __fish_seen_subcommand_from settings movies programs music all help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c n4n5 -n "__fish_n4n5_using_subcommand sync; and __fish_seen_subcommand_from settings" -s h -l help -d 'Print help'
complete -c n4n5 -n "__fish_n4n5_using_subcommand sync; and __fish_seen_subcommand_from settings" -f -a "add" -d 'add a file to save'
complete -c n4n5 -n "__fish_n4n5_using_subcommand sync; and __fish_seen_subcommand_from settings" -f -a "all" -d 'add all files to save'
complete -c n4n5 -n "__fish_n4n5_using_subcommand sync; and __fish_seen_subcommand_from settings" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c n4n5 -n "__fish_n4n5_using_subcommand sync; and __fish_seen_subcommand_from movies" -s j -l json -d 'print as json'
complete -c n4n5 -n "__fish_n4n5_using_subcommand sync; and __fish_seen_subcommand_from movies" -s h -l help -d 'Print help'
complete -c n4n5 -n "__fish_n4n5_using_subcommand sync; and __fish_seen_subcommand_from programs" -s h -l help -d 'Print help'
complete -c n4n5 -n "__fish_n4n5_using_subcommand sync; and __fish_seen_subcommand_from music" -s h -l help -d 'Print help'
complete -c n4n5 -n "__fish_n4n5_using_subcommand sync; and __fish_seen_subcommand_from all" -s h -l help -d 'Print help'
complete -c n4n5 -n "__fish_n4n5_using_subcommand sync; and __fish_seen_subcommand_from help" -f -a "settings" -d 'save settings'
complete -c n4n5 -n "__fish_n4n5_using_subcommand sync; and __fish_seen_subcommand_from help" -f -a "movies" -d 'sync movies'
complete -c n4n5 -n "__fish_n4n5_using_subcommand sync; and __fish_seen_subcommand_from help" -f -a "programs" -d 'sync programs'
complete -c n4n5 -n "__fish_n4n5_using_subcommand sync; and __fish_seen_subcommand_from help" -f -a "music" -d 'sync music'
complete -c n4n5 -n "__fish_n4n5_using_subcommand sync; and __fish_seen_subcommand_from help" -f -a "all" -d 'sync all'
complete -c n4n5 -n "__fish_n4n5_using_subcommand sync; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and not __fish_seen_subcommand_from utils music config gh helpers movies sync help" -f -a "utils" -d 'utils subcommand'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and not __fish_seen_subcommand_from utils music config gh helpers movies sync help" -f -a "music" -d 'music subcommand'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and not __fish_seen_subcommand_from utils music config gh helpers movies sync help" -f -a "config" -d 'config subcommand'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and not __fish_seen_subcommand_from utils music config gh helpers movies sync help" -f -a "gh" -d 'gh subcommand'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and not __fish_seen_subcommand_from utils music config gh helpers movies sync help" -f -a "helpers" -d 'helpers subcommand'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and not __fish_seen_subcommand_from utils music config gh helpers movies sync help" -f -a "movies" -d 'movies subcommand'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and not __fish_seen_subcommand_from utils music config gh helpers movies sync help" -f -a "sync" -d 'sync subcommand'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and not __fish_seen_subcommand_from utils music config gh helpers movies sync help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and __fish_seen_subcommand_from utils" -f -a "list_crates" -d 'list_crates subcommand'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and __fish_seen_subcommand_from music" -f -a "sync" -d 'Save music'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and __fish_seen_subcommand_from music" -f -a "open" -d 'Open music file'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and __fish_seen_subcommand_from config" -f -a "open" -d 'Open config with default editor'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and __fish_seen_subcommand_from gh" -f -a "pulls" -d 'Save pulls'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and __fish_seen_subcommand_from gh" -f -a "projects" -d 'Save projects'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and __fish_seen_subcommand_from helpers" -f -a "completions" -d 'generate completions'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and __fish_seen_subcommand_from helpers" -f -a "man" -d 'generate man'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and __fish_seen_subcommand_from movies" -f -a "add" -d 'add a movie'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and __fish_seen_subcommand_from movies" -f -a "open" -d 'open movie file'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and __fish_seen_subcommand_from movies" -f -a "stats" -d 'Show stats of movies'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and __fish_seen_subcommand_from movies" -f -a "show" -d 'Show movies list'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and __fish_seen_subcommand_from movies" -f -a "sync" -d 'Sync movies file'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and __fish_seen_subcommand_from sync" -f -a "settings" -d 'save settings'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and __fish_seen_subcommand_from sync" -f -a "movies" -d 'sync movies'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and __fish_seen_subcommand_from sync" -f -a "programs" -d 'sync programs'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and __fish_seen_subcommand_from sync" -f -a "music" -d 'sync music'
complete -c n4n5 -n "__fish_n4n5_using_subcommand help; and __fish_seen_subcommand_from sync" -f -a "all" -d 'sync all'
