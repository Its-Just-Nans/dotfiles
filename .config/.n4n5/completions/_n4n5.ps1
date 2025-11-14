
using namespace System.Management.Automation
using namespace System.Management.Automation.Language

Register-ArgumentCompleter -Native -CommandName 'n4n5' -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)

    $commandElements = $commandAst.CommandElements
    $command = @(
        'n4n5'
        for ($i = 1; $i -lt $commandElements.Count; $i++) {
            $element = $commandElements[$i]
            if ($element -isnot [StringConstantExpressionAst] -or
                $element.StringConstantType -ne [StringConstantType]::BareWord -or
                $element.Value.StartsWith('-') -or
                $element.Value -eq $wordToComplete) {
                break
        }
        $element.Value
    }) -join ';'

    $completions = @(switch ($command) {
        'n4n5' {
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'Sets a custom config file')
            [CompletionResult]::new('--config', '--config', [CompletionResultType]::ParameterName, 'Sets a custom config file')
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Turn debugging information on')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Turn debugging information on')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('utils', 'utils', [CompletionResultType]::ParameterValue, 'utils subcommand')
            [CompletionResult]::new('music', 'music', [CompletionResultType]::ParameterValue, 'music subcommand')
            [CompletionResult]::new('config', 'config', [CompletionResultType]::ParameterValue, 'config subcommand')
            [CompletionResult]::new('gh', 'gh', [CompletionResultType]::ParameterValue, 'gh subcommand')
            [CompletionResult]::new('helpers', 'helpers', [CompletionResultType]::ParameterValue, 'helpers subcommand')
            [CompletionResult]::new('movies', 'movies', [CompletionResultType]::ParameterValue, 'movies subcommand')
            [CompletionResult]::new('sync', 'sync', [CompletionResultType]::ParameterValue, 'sync subcommand')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'n4n5;utils' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('list_crates', 'list_crates', [CompletionResultType]::ParameterValue, 'list_crates subcommand')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'n4n5;utils;list_crates' {
            [CompletionResult]::new('--username', '--username', [CompletionResultType]::ParameterName, 'Specify username')
            [CompletionResult]::new('--user-agent', '--user-agent', [CompletionResultType]::ParameterName, 'Specify user agent')
            [CompletionResult]::new('--output-markdown', '--output-markdown', [CompletionResultType]::ParameterName, 'Output markdown')
            [CompletionResult]::new('--output-list', '--output-list', [CompletionResultType]::ParameterName, 'Output list')
            [CompletionResult]::new('--output-list-full', '--output-list-full', [CompletionResultType]::ParameterName, 'Output list long/full')
            [CompletionResult]::new('--delay', '--delay', [CompletionResultType]::ParameterName, 'Request delay (in seconds)')
            [CompletionResult]::new('--filtered', '--filtered', [CompletionResultType]::ParameterName, 'Filter crates')
            [CompletionResult]::new('--specials', '--specials', [CompletionResultType]::ParameterName, 'Filter crates')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Filter crates')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'n4n5;utils;help' {
            [CompletionResult]::new('list_crates', 'list_crates', [CompletionResultType]::ParameterValue, 'list_crates subcommand')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'n4n5;utils;help;list_crates' {
            break
        }
        'n4n5;utils;help;help' {
            break
        }
        'n4n5;music' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('sync', 'sync', [CompletionResultType]::ParameterValue, 'Save music')
            [CompletionResult]::new('open', 'open', [CompletionResultType]::ParameterValue, 'Open music file')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'n4n5;music;sync' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'n4n5;music;open' {
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'Print the path only')
            [CompletionResult]::new('--path', '--path', [CompletionResultType]::ParameterName, 'Print the path only')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'n4n5;music;help' {
            [CompletionResult]::new('sync', 'sync', [CompletionResultType]::ParameterValue, 'Save music')
            [CompletionResult]::new('open', 'open', [CompletionResultType]::ParameterValue, 'Open music file')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'n4n5;music;help;sync' {
            break
        }
        'n4n5;music;help;open' {
            break
        }
        'n4n5;music;help;help' {
            break
        }
        'n4n5;config' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('open', 'open', [CompletionResultType]::ParameterValue, 'Open config with default editor')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'n4n5;config;open' {
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'Print the path')
            [CompletionResult]::new('--path', '--path', [CompletionResultType]::ParameterName, 'Print the path')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'n4n5;config;help' {
            [CompletionResult]::new('open', 'open', [CompletionResultType]::ParameterValue, 'Open config with default editor')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'n4n5;config;help;open' {
            break
        }
        'n4n5;config;help;help' {
            break
        }
        'n4n5;gh' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('pulls', 'pulls', [CompletionResultType]::ParameterValue, 'Save pulls')
            [CompletionResult]::new('projects', 'projects', [CompletionResultType]::ParameterValue, 'Save projects')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'n4n5;gh;pulls' {
            [CompletionResult]::new('-j', '-j', [CompletionResultType]::ParameterName, 'Print as JSON')
            [CompletionResult]::new('--json', '--json', [CompletionResultType]::ParameterName, 'Print as JSON')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'n4n5;gh;projects' {
            [CompletionResult]::new('-j', '-j', [CompletionResultType]::ParameterName, 'Print as JSON')
            [CompletionResult]::new('--json', '--json', [CompletionResultType]::ParameterName, 'Print as JSON')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'n4n5;gh;help' {
            [CompletionResult]::new('pulls', 'pulls', [CompletionResultType]::ParameterValue, 'Save pulls')
            [CompletionResult]::new('projects', 'projects', [CompletionResultType]::ParameterValue, 'Save projects')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'n4n5;gh;help;pulls' {
            break
        }
        'n4n5;gh;help;projects' {
            break
        }
        'n4n5;gh;help;help' {
            break
        }
        'n4n5;helpers' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('completions', 'completions', [CompletionResultType]::ParameterValue, 'generate completions')
            [CompletionResult]::new('man', 'man', [CompletionResultType]::ParameterValue, 'generate man')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'n4n5;helpers;completions' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'n4n5;helpers;man' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'n4n5;helpers;help' {
            [CompletionResult]::new('completions', 'completions', [CompletionResultType]::ParameterValue, 'generate completions')
            [CompletionResult]::new('man', 'man', [CompletionResultType]::ParameterValue, 'generate man')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'n4n5;helpers;help;completions' {
            break
        }
        'n4n5;helpers;help;man' {
            break
        }
        'n4n5;helpers;help;help' {
            break
        }
        'n4n5;movies' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'add a movie')
            [CompletionResult]::new('open', 'open', [CompletionResultType]::ParameterValue, 'open movie file')
            [CompletionResult]::new('stats', 'stats', [CompletionResultType]::ParameterValue, 'Show stats of movies')
            [CompletionResult]::new('show', 'show', [CompletionResultType]::ParameterValue, 'Show movies list')
            [CompletionResult]::new('sync', 'sync', [CompletionResultType]::ParameterValue, 'Sync movies file')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'n4n5;movies;add' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'n4n5;movies;open' {
            [CompletionResult]::new('-p', '-p', [CompletionResultType]::ParameterName, 'print path of movies file')
            [CompletionResult]::new('--path', '--path', [CompletionResultType]::ParameterName, 'print path of movies file')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'n4n5;movies;stats' {
            [CompletionResult]::new('-j', '-j', [CompletionResultType]::ParameterName, 'print stats as json')
            [CompletionResult]::new('--json', '--json', [CompletionResultType]::ParameterName, 'print stats as json')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'n4n5;movies;show' {
            [CompletionResult]::new('-r', '-r', [CompletionResultType]::ParameterName, 'reverse mode')
            [CompletionResult]::new('--reverse', '--reverse', [CompletionResultType]::ParameterName, 'reverse mode')
            [CompletionResult]::new('-f', '-f', [CompletionResultType]::ParameterName, 'show full mode')
            [CompletionResult]::new('--full', '--full', [CompletionResultType]::ParameterName, 'show full mode')
            [CompletionResult]::new('-c', '-c', [CompletionResultType]::ParameterName, 'show comment')
            [CompletionResult]::new('--comment', '--comment', [CompletionResultType]::ParameterName, 'show comment')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'n4n5;movies;sync' {
            [CompletionResult]::new('-j', '-j', [CompletionResultType]::ParameterName, 'print as json')
            [CompletionResult]::new('--json', '--json', [CompletionResultType]::ParameterName, 'print as json')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'n4n5;movies;help' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'add a movie')
            [CompletionResult]::new('open', 'open', [CompletionResultType]::ParameterValue, 'open movie file')
            [CompletionResult]::new('stats', 'stats', [CompletionResultType]::ParameterValue, 'Show stats of movies')
            [CompletionResult]::new('show', 'show', [CompletionResultType]::ParameterValue, 'Show movies list')
            [CompletionResult]::new('sync', 'sync', [CompletionResultType]::ParameterValue, 'Sync movies file')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'n4n5;movies;help;add' {
            break
        }
        'n4n5;movies;help;open' {
            break
        }
        'n4n5;movies;help;stats' {
            break
        }
        'n4n5;movies;help;show' {
            break
        }
        'n4n5;movies;help;sync' {
            break
        }
        'n4n5;movies;help;help' {
            break
        }
        'n4n5;sync' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('settings', 'settings', [CompletionResultType]::ParameterValue, 'save settings')
            [CompletionResult]::new('movies', 'movies', [CompletionResultType]::ParameterValue, 'sync movies')
            [CompletionResult]::new('programs', 'programs', [CompletionResultType]::ParameterValue, 'sync programs')
            [CompletionResult]::new('music', 'music', [CompletionResultType]::ParameterValue, 'sync music')
            [CompletionResult]::new('all', 'all', [CompletionResultType]::ParameterValue, 'sync all')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'n4n5;sync;settings' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'add a file to save')
            [CompletionResult]::new('all', 'all', [CompletionResultType]::ParameterValue, 'add all files to save')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'n4n5;sync;settings;add' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'n4n5;sync;settings;all' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'n4n5;sync;settings;help' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'add a file to save')
            [CompletionResult]::new('all', 'all', [CompletionResultType]::ParameterValue, 'add all files to save')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'n4n5;sync;settings;help;add' {
            break
        }
        'n4n5;sync;settings;help;all' {
            break
        }
        'n4n5;sync;settings;help;help' {
            break
        }
        'n4n5;sync;movies' {
            [CompletionResult]::new('-j', '-j', [CompletionResultType]::ParameterName, 'print as json')
            [CompletionResult]::new('--json', '--json', [CompletionResultType]::ParameterName, 'print as json')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'n4n5;sync;programs' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'n4n5;sync;music' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'n4n5;sync;all' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'n4n5;sync;help' {
            [CompletionResult]::new('settings', 'settings', [CompletionResultType]::ParameterValue, 'save settings')
            [CompletionResult]::new('movies', 'movies', [CompletionResultType]::ParameterValue, 'sync movies')
            [CompletionResult]::new('programs', 'programs', [CompletionResultType]::ParameterValue, 'sync programs')
            [CompletionResult]::new('music', 'music', [CompletionResultType]::ParameterValue, 'sync music')
            [CompletionResult]::new('all', 'all', [CompletionResultType]::ParameterValue, 'sync all')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'n4n5;sync;help;settings' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'add a file to save')
            [CompletionResult]::new('all', 'all', [CompletionResultType]::ParameterValue, 'add all files to save')
            break
        }
        'n4n5;sync;help;settings;add' {
            break
        }
        'n4n5;sync;help;settings;all' {
            break
        }
        'n4n5;sync;help;movies' {
            break
        }
        'n4n5;sync;help;programs' {
            break
        }
        'n4n5;sync;help;music' {
            break
        }
        'n4n5;sync;help;all' {
            break
        }
        'n4n5;sync;help;help' {
            break
        }
        'n4n5;help' {
            [CompletionResult]::new('utils', 'utils', [CompletionResultType]::ParameterValue, 'utils subcommand')
            [CompletionResult]::new('music', 'music', [CompletionResultType]::ParameterValue, 'music subcommand')
            [CompletionResult]::new('config', 'config', [CompletionResultType]::ParameterValue, 'config subcommand')
            [CompletionResult]::new('gh', 'gh', [CompletionResultType]::ParameterValue, 'gh subcommand')
            [CompletionResult]::new('helpers', 'helpers', [CompletionResultType]::ParameterValue, 'helpers subcommand')
            [CompletionResult]::new('movies', 'movies', [CompletionResultType]::ParameterValue, 'movies subcommand')
            [CompletionResult]::new('sync', 'sync', [CompletionResultType]::ParameterValue, 'sync subcommand')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'n4n5;help;utils' {
            [CompletionResult]::new('list_crates', 'list_crates', [CompletionResultType]::ParameterValue, 'list_crates subcommand')
            break
        }
        'n4n5;help;utils;list_crates' {
            break
        }
        'n4n5;help;music' {
            [CompletionResult]::new('sync', 'sync', [CompletionResultType]::ParameterValue, 'Save music')
            [CompletionResult]::new('open', 'open', [CompletionResultType]::ParameterValue, 'Open music file')
            break
        }
        'n4n5;help;music;sync' {
            break
        }
        'n4n5;help;music;open' {
            break
        }
        'n4n5;help;config' {
            [CompletionResult]::new('open', 'open', [CompletionResultType]::ParameterValue, 'Open config with default editor')
            break
        }
        'n4n5;help;config;open' {
            break
        }
        'n4n5;help;gh' {
            [CompletionResult]::new('pulls', 'pulls', [CompletionResultType]::ParameterValue, 'Save pulls')
            [CompletionResult]::new('projects', 'projects', [CompletionResultType]::ParameterValue, 'Save projects')
            break
        }
        'n4n5;help;gh;pulls' {
            break
        }
        'n4n5;help;gh;projects' {
            break
        }
        'n4n5;help;helpers' {
            [CompletionResult]::new('completions', 'completions', [CompletionResultType]::ParameterValue, 'generate completions')
            [CompletionResult]::new('man', 'man', [CompletionResultType]::ParameterValue, 'generate man')
            break
        }
        'n4n5;help;helpers;completions' {
            break
        }
        'n4n5;help;helpers;man' {
            break
        }
        'n4n5;help;movies' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'add a movie')
            [CompletionResult]::new('open', 'open', [CompletionResultType]::ParameterValue, 'open movie file')
            [CompletionResult]::new('stats', 'stats', [CompletionResultType]::ParameterValue, 'Show stats of movies')
            [CompletionResult]::new('show', 'show', [CompletionResultType]::ParameterValue, 'Show movies list')
            [CompletionResult]::new('sync', 'sync', [CompletionResultType]::ParameterValue, 'Sync movies file')
            break
        }
        'n4n5;help;movies;add' {
            break
        }
        'n4n5;help;movies;open' {
            break
        }
        'n4n5;help;movies;stats' {
            break
        }
        'n4n5;help;movies;show' {
            break
        }
        'n4n5;help;movies;sync' {
            break
        }
        'n4n5;help;sync' {
            [CompletionResult]::new('settings', 'settings', [CompletionResultType]::ParameterValue, 'save settings')
            [CompletionResult]::new('movies', 'movies', [CompletionResultType]::ParameterValue, 'sync movies')
            [CompletionResult]::new('programs', 'programs', [CompletionResultType]::ParameterValue, 'sync programs')
            [CompletionResult]::new('music', 'music', [CompletionResultType]::ParameterValue, 'sync music')
            [CompletionResult]::new('all', 'all', [CompletionResultType]::ParameterValue, 'sync all')
            break
        }
        'n4n5;help;sync;settings' {
            [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterValue, 'add a file to save')
            [CompletionResult]::new('all', 'all', [CompletionResultType]::ParameterValue, 'add all files to save')
            break
        }
        'n4n5;help;sync;settings;add' {
            break
        }
        'n4n5;help;sync;settings;all' {
            break
        }
        'n4n5;help;sync;movies' {
            break
        }
        'n4n5;help;sync;programs' {
            break
        }
        'n4n5;help;sync;music' {
            break
        }
        'n4n5;help;sync;all' {
            break
        }
        'n4n5;help;help' {
            break
        }
    })

    $completions.Where{ $_.CompletionText -like "$wordToComplete*" } |
        Sort-Object -Property ListItemText
}
