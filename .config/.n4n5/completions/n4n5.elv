
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
            cand -c 'Sets a custom config file'
            cand --config 'Sets a custom config file'
            cand -d 'Turn debugging information on'
            cand --debug 'Turn debugging information on'
            cand -h 'Print help'
            cand --help 'Print help'
            cand utils 'utils subcommand'
            cand music 'music subcommand'
            cand config 'config subcommand'
            cand gh 'gh subcommand'
            cand helpers 'helpers subcommand'
            cand movies 'movies subcommand'
            cand sync 'sync subcommand'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'n4n5;utils'= {
            cand -h 'Print help'
            cand --help 'Print help'
            cand list_crates 'list_crates subcommand'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'n4n5;utils;list_crates'= {
            cand --username 'Specify username'
            cand --user-agent 'Specify user agent'
            cand --output-markdown 'Output markdown'
            cand --output-list 'Output list'
            cand --output-list-full 'Output list long/full'
            cand --delay 'Request delay (in seconds)'
            cand --filtered 'Filter crates'
            cand --specials 'Filter crates'
            cand --verbose 'Filter crates'
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'n4n5;utils;help'= {
            cand list_crates 'list_crates subcommand'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'n4n5;utils;help;list_crates'= {
        }
        &'n4n5;utils;help;help'= {
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
        &'n4n5;helpers'= {
            cand -h 'Print help'
            cand --help 'Print help'
            cand completions 'generate completions'
            cand man 'generate man'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'n4n5;helpers;completions'= {
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'n4n5;helpers;man'= {
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'n4n5;helpers;help'= {
            cand completions 'generate completions'
            cand man 'generate man'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'n4n5;helpers;help;completions'= {
        }
        &'n4n5;helpers;help;man'= {
        }
        &'n4n5;helpers;help;help'= {
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
        &'n4n5;sync'= {
            cand -h 'Print help'
            cand --help 'Print help'
            cand settings 'save settings'
            cand movies 'sync movies'
            cand programs 'sync programs'
            cand music 'sync music'
            cand all 'sync all'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'n4n5;sync;settings'= {
            cand -h 'Print help'
            cand --help 'Print help'
            cand add 'add a file to save'
            cand all 'add all files to save'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'n4n5;sync;settings;add'= {
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'n4n5;sync;settings;all'= {
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'n4n5;sync;settings;help'= {
            cand add 'add a file to save'
            cand all 'add all files to save'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'n4n5;sync;settings;help;add'= {
        }
        &'n4n5;sync;settings;help;all'= {
        }
        &'n4n5;sync;settings;help;help'= {
        }
        &'n4n5;sync;movies'= {
            cand -j 'print as json'
            cand --json 'print as json'
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'n4n5;sync;programs'= {
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'n4n5;sync;music'= {
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'n4n5;sync;all'= {
            cand -h 'Print help'
            cand --help 'Print help'
        }
        &'n4n5;sync;help'= {
            cand settings 'save settings'
            cand movies 'sync movies'
            cand programs 'sync programs'
            cand music 'sync music'
            cand all 'sync all'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'n4n5;sync;help;settings'= {
            cand add 'add a file to save'
            cand all 'add all files to save'
        }
        &'n4n5;sync;help;settings;add'= {
        }
        &'n4n5;sync;help;settings;all'= {
        }
        &'n4n5;sync;help;movies'= {
        }
        &'n4n5;sync;help;programs'= {
        }
        &'n4n5;sync;help;music'= {
        }
        &'n4n5;sync;help;all'= {
        }
        &'n4n5;sync;help;help'= {
        }
        &'n4n5;help'= {
            cand utils 'utils subcommand'
            cand music 'music subcommand'
            cand config 'config subcommand'
            cand gh 'gh subcommand'
            cand helpers 'helpers subcommand'
            cand movies 'movies subcommand'
            cand sync 'sync subcommand'
            cand help 'Print this message or the help of the given subcommand(s)'
        }
        &'n4n5;help;utils'= {
            cand list_crates 'list_crates subcommand'
        }
        &'n4n5;help;utils;list_crates'= {
        }
        &'n4n5;help;music'= {
            cand sync 'Save music'
            cand open 'Open music file'
        }
        &'n4n5;help;music;sync'= {
        }
        &'n4n5;help;music;open'= {
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
        &'n4n5;help;helpers'= {
            cand completions 'generate completions'
            cand man 'generate man'
        }
        &'n4n5;help;helpers;completions'= {
        }
        &'n4n5;help;helpers;man'= {
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
        &'n4n5;help;sync'= {
            cand settings 'save settings'
            cand movies 'sync movies'
            cand programs 'sync programs'
            cand music 'sync music'
            cand all 'sync all'
        }
        &'n4n5;help;sync;settings'= {
            cand add 'add a file to save'
            cand all 'add all files to save'
        }
        &'n4n5;help;sync;settings;add'= {
        }
        &'n4n5;help;sync;settings;all'= {
        }
        &'n4n5;help;sync;movies'= {
        }
        &'n4n5;help;sync;programs'= {
        }
        &'n4n5;help;sync;music'= {
        }
        &'n4n5;help;sync;all'= {
        }
        &'n4n5;help;help'= {
        }
    ]
    $completions[$command]
}
