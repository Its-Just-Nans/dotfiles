
use builtin;
use str;

set edit:completion:arg-completer[n4n5] = {|@words|
    fn spaces {|n|
        builtin:repeat $n ' ' | str:join ''
    }
    fn cand {|text desc|
        edit:complex-candidate $text &display=$text' '(spaces (- 14 (wcswidth $text)))$desc
    }
    var command = 'n4n5'
    for word $words[1..-1] {
        if (str:has-prefix $word '-') {
            break
        }
        set command = $command';'$word
    }
    var completions = [
        &'n4n5'= {
            cand --config 'Sets a custom config file'
            cand -d 'Turn debugging information on'
            cand --debug 'Turn debugging information on'
            cand --use-input 'whether to use input for configuration'
            cand -h 'Print help'
            cand --help 'Print help'
            cand -V 'Print version'
            cand --version 'Print version'
            cand config 'config subcommand'
            cand gh 'gh subcommand'
            cand movies 'movies subcommand'
            cand completions 'generate completions'
            cand shortcuts 'Shortcuts subcommand'
            cand man 'generate man'
            cand list_crates 'list crates subcommand'
            cand git-mover 'Launch git-mover cli'
            cand music 'music subcommand'
            cand share 'Quick http server share'
            cand watching 'List watching repos'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'n4n5;config'= {
            cand -h 'Print help'
            cand --help 'Print help'
            cand open 'Open config with default editor'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'n4n5;config;open'= {
            cand -p 'Print the path'
            cand --path 'Print the path'
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'n4n5;config;help'= {
            cand open 'Open config with default editor'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'n4n5;config;help;open'= {
        }
        &'n4n5;config;help;help'= {
        }
        &'n4n5;gh'= {
            cand -h 'Print help'
            cand --help 'Print help'
            cand pulls 'Save pulls'
            cand projects 'Save projects'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'n4n5;gh;pulls'= {
            cand -j 'Print as JSON'
            cand --json 'Print as JSON'
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'n4n5;gh;projects'= {
            cand -j 'Print as JSON'
            cand --json 'Print as JSON'
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'n4n5;gh;help'= {
            cand pulls 'Save pulls'
            cand projects 'Save projects'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'n4n5;gh;help;pulls'= {
        }
        &'n4n5;gh;help;projects'= {
        }
        &'n4n5;gh;help;help'= {
        }
        &'n4n5;movies'= {
            cand -h 'Print help'
            cand --help 'Print help'
            cand add 'add a movie'
            cand open 'open movie file'
            cand stats 'Show stats of movies'
            cand show 'Show movies list'
            cand sync 'Sync movies file'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'n4n5;movies;add'= {
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'n4n5;movies;open'= {
            cand -p 'print path of movies file'
            cand --path 'print path of movies file'
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'n4n5;movies;stats'= {
            cand -j 'print stats as json'
            cand --json 'print stats as json'
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'n4n5;movies;show'= {
            cand -r 'reverse mode'
            cand --reverse 'reverse mode'
            cand -f 'show full mode'
            cand --full 'show full mode'
            cand -c 'show comment'
            cand --comment 'show comment'
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'n4n5;movies;sync'= {
            cand -j 'print as json'
            cand --json 'print as json'
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'n4n5;movies;help'= {
            cand add 'add a movie'
            cand open 'open movie file'
            cand stats 'Show stats of movies'
            cand show 'Show movies list'
            cand sync 'Sync movies file'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'n4n5;movies;help;add'= {
        }
        &'n4n5;movies;help;open'= {
        }
        &'n4n5;movies;help;stats'= {
        }
        &'n4n5;movies;help;show'= {
        }
        &'n4n5;movies;help;sync'= {
        }
        &'n4n5;movies;help;help'= {
        }
        &'n4n5;completions'= {
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'n4n5;shortcuts'= {
            cand -h 'Print help'
            cand --help 'Print help'
            cand sync-git 'Sync git repos between GitHub and Codeberg'
            cand sync-all 'Sync all'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'n4n5;shortcuts;sync-git'= {
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'n4n5;shortcuts;sync-all'= {
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'n4n5;shortcuts;help'= {
            cand sync-git 'Sync git repos between GitHub and Codeberg'
            cand sync-all 'Sync all'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'n4n5;shortcuts;help;sync-git'= {
        }
        &'n4n5;shortcuts;help;sync-all'= {
        }
        &'n4n5;shortcuts;help;help'= {
        }
        &'n4n5;man'= {
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'n4n5;list_crates'= {
            cand --username 'Specify username'
            cand --user-agent 'Specify user agent'
            cand --output-markdown 'Output markdown'
            cand --output-list 'Output list'
            cand --output-list-full 'Output list long/full'
            cand --delay 'Request delay (in milliseconds)'
            cand --filtered 'Filter crates'
            cand --specials 'Specials crates'
            cand --verbose 'Verbose'
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'n4n5;git-mover'= {
            cand --source 'The source platform (github, gitlab, codeberg)'
            cand --from 'The source platform (github, gitlab, codeberg)'
            cand --destination 'The destination platform (github, gitlab, codeberg)'
            cand --to 'The destination platform (github, gitlab, codeberg)'
            cand --config 'Custom configuration file path'
            cand --no-forks 'Don''t sync forked repositories'
            cand --no-delete 'Don''t delete repositories'
            cand --resync 'Resync all repositories'
            cand --show-config-path 'Show the current config path and exit'
            cand --manual 'Sync manually'
            cand -v 'Verbose mode'
            cand -d 'Verbose mode'
            cand --verbose 'Verbose mode'
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'n4n5;music'= {
            cand -h 'Print help'
            cand --help 'Print help'
            cand sync 'Save music'
            cand open 'Open music file'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'n4n5;music;sync'= {
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'n4n5;music;open'= {
            cand -p 'Print the path only'
            cand --path 'Print the path only'
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'n4n5;music;help'= {
            cand sync 'Save music'
            cand open 'Open music file'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'n4n5;music;help;sync'= {
        }
        &'n4n5;music;help;open'= {
        }
        &'n4n5;music;help;help'= {
        }
        &'n4n5;share'= {
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'n4n5;watching'= {
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'n4n5;help'= {
            cand config 'config subcommand'
            cand gh 'gh subcommand'
            cand movies 'movies subcommand'
            cand completions 'generate completions'
            cand shortcuts 'Shortcuts subcommand'
            cand man 'generate man'
            cand list_crates 'list crates subcommand'
            cand git-mover 'Launch git-mover cli'
            cand music 'music subcommand'
            cand share 'Quick http server share'
            cand watching 'List watching repos'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'n4n5;help;config'= {
            cand open 'Open config with default editor'
        }
        &'n4n5;help;config;open'= {
        }
        &'n4n5;help;gh'= {
            cand pulls 'Save pulls'
            cand projects 'Save projects'
        }
        &'n4n5;help;gh;pulls'= {
        }
        &'n4n5;help;gh;projects'= {
        }
        &'n4n5;help;movies'= {
            cand add 'add a movie'
            cand open 'open movie file'
            cand stats 'Show stats of movies'
            cand show 'Show movies list'
            cand sync 'Sync movies file'
        }
        &'n4n5;help;movies;add'= {
        }
        &'n4n5;help;movies;open'= {
        }
        &'n4n5;help;movies;stats'= {
        }
        &'n4n5;help;movies;show'= {
        }
        &'n4n5;help;movies;sync'= {
        }
        &'n4n5;help;completions'= {
        }
        &'n4n5;help;shortcuts'= {
            cand sync-git 'Sync git repos between GitHub and Codeberg'
            cand sync-all 'Sync all'
        }
        &'n4n5;help;shortcuts;sync-git'= {
        }
        &'n4n5;help;shortcuts;sync-all'= {
        }
        &'n4n5;help;man'= {
        }
        &'n4n5;help;list_crates'= {
        }
        &'n4n5;help;git-mover'= {
        }
        &'n4n5;help;music'= {
            cand sync 'Save music'
            cand open 'Open music file'
        }
        &'n4n5;help;music;sync'= {
        }
        &'n4n5;help;music;open'= {
        }
        &'n4n5;help;share'= {
        }
        &'n4n5;help;watching'= {
        }
        &'n4n5;help;help'= {
        }
    ]
    $completions[$command]
}
