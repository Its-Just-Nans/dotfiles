
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
            [CompletionResult]::new('--config', '--config', [CompletionResultType]::ParameterName, 'Sets a custom config file')
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Turn debugging information on')
            [CompletionResult]::new('--debug', '--debug', [CompletionResultType]::ParameterName, 'Turn debugging information on')
            [CompletionResult]::new('--use-input', '--use-input', [CompletionResultType]::ParameterName, 'whether to use input for configuration')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('-V', '-V ', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('--version', '--version', [CompletionResultType]::ParameterName, 'Print version')
            [CompletionResult]::new('config', 'config', [CompletionResultType]::ParameterValue, 'config subcommand')
            [CompletionResult]::new('gh', 'gh', [CompletionResultType]::ParameterValue, 'gh subcommand')
            [CompletionResult]::new('movies', 'movies', [CompletionResultType]::ParameterValue, 'movies subcommand')
            [CompletionResult]::new('completions', 'completions', [CompletionResultType]::ParameterValue, 'generate completions')
            [CompletionResult]::new('shortcuts', 'shortcuts', [CompletionResultType]::ParameterValue, 'Shortcuts subcommand')
            [CompletionResult]::new('man', 'man', [CompletionResultType]::ParameterValue, 'generate man')
            [CompletionResult]::new('list_crates', 'list_crates', [CompletionResultType]::ParameterValue, 'list crates subcommand')
            [CompletionResult]::new('git-mover', 'git-mover', [CompletionResultType]::ParameterValue, 'Launch git-mover cli')
            [CompletionResult]::new('music', 'music', [CompletionResultType]::ParameterValue, 'music subcommand')
            [CompletionResult]::new('share', 'share', [CompletionResultType]::ParameterValue, 'Quick http server share')
            [CompletionResult]::new('watching', 'watching', [CompletionResultType]::ParameterValue, 'List watching repos')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
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
        'n4n5;completions' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'n4n5;shortcuts' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('sync-git', 'sync-git', [CompletionResultType]::ParameterValue, 'Sync git repos between GitHub and Codeberg')
            [CompletionResult]::new('sync-all', 'sync-all', [CompletionResultType]::ParameterValue, 'Sync all')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'n4n5;shortcuts;sync-git' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'n4n5;shortcuts;sync-all' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'n4n5;shortcuts;help' {
            [CompletionResult]::new('sync-git', 'sync-git', [CompletionResultType]::ParameterValue, 'Sync git repos between GitHub and Codeberg')
            [CompletionResult]::new('sync-all', 'sync-all', [CompletionResultType]::ParameterValue, 'Sync all')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
            break
        }
        'n4n5;shortcuts;help;sync-git' {
            break
        }
        'n4n5;shortcuts;help;sync-all' {
            break
        }
        'n4n5;shortcuts;help;help' {
            break
        }
        'n4n5;man' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'n4n5;list_crates' {
            [CompletionResult]::new('--username', '--username', [CompletionResultType]::ParameterName, 'Specify username')
            [CompletionResult]::new('--user-agent', '--user-agent', [CompletionResultType]::ParameterName, 'Specify user agent')
            [CompletionResult]::new('--output-markdown', '--output-markdown', [CompletionResultType]::ParameterName, 'Output markdown')
            [CompletionResult]::new('--output-list', '--output-list', [CompletionResultType]::ParameterName, 'Output list')
            [CompletionResult]::new('--output-list-full', '--output-list-full', [CompletionResultType]::ParameterName, 'Output list long/full')
            [CompletionResult]::new('--delay', '--delay', [CompletionResultType]::ParameterName, 'Request delay (in milliseconds)')
            [CompletionResult]::new('--filtered', '--filtered', [CompletionResultType]::ParameterName, 'Filter crates')
            [CompletionResult]::new('--specials', '--specials', [CompletionResultType]::ParameterName, 'Specials crates')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Verbose')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'n4n5;git-mover' {
            [CompletionResult]::new('--source', '--source', [CompletionResultType]::ParameterName, 'The source platform (github, gitlab, codeberg)')
            [CompletionResult]::new('--from', '--from', [CompletionResultType]::ParameterName, 'The source platform (github, gitlab, codeberg)')
            [CompletionResult]::new('--destination', '--destination', [CompletionResultType]::ParameterName, 'The destination platform (github, gitlab, codeberg)')
            [CompletionResult]::new('--to', '--to', [CompletionResultType]::ParameterName, 'The destination platform (github, gitlab, codeberg)')
            [CompletionResult]::new('--config', '--config', [CompletionResultType]::ParameterName, 'Custom configuration file path')
            [CompletionResult]::new('--no-forks', '--no-forks', [CompletionResultType]::ParameterName, 'Don''t sync forked repositories')
            [CompletionResult]::new('--no-delete', '--no-delete', [CompletionResultType]::ParameterName, 'Don''t delete repositories')
            [CompletionResult]::new('--resync', '--resync', [CompletionResultType]::ParameterName, 'Resync all repositories')
            [CompletionResult]::new('--show-config-path', '--show-config-path', [CompletionResultType]::ParameterName, 'Show the current config path and exit')
            [CompletionResult]::new('--manual', '--manual', [CompletionResultType]::ParameterName, 'Sync manually')
            [CompletionResult]::new('-v', '-v', [CompletionResultType]::ParameterName, 'Verbose mode')
            [CompletionResult]::new('-d', '-d', [CompletionResultType]::ParameterName, 'Verbose mode')
            [CompletionResult]::new('--verbose', '--verbose', [CompletionResultType]::ParameterName, 'Verbose mode')
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
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
        'n4n5;share' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'n4n5;watching' {
            [CompletionResult]::new('-h', '-h', [CompletionResultType]::ParameterName, 'Print help')
            [CompletionResult]::new('--help', '--help', [CompletionResultType]::ParameterName, 'Print help')
            break
        }
        'n4n5;help' {
            [CompletionResult]::new('config', 'config', [CompletionResultType]::ParameterValue, 'config subcommand')
            [CompletionResult]::new('gh', 'gh', [CompletionResultType]::ParameterValue, 'gh subcommand')
            [CompletionResult]::new('movies', 'movies', [CompletionResultType]::ParameterValue, 'movies subcommand')
            [CompletionResult]::new('completions', 'completions', [CompletionResultType]::ParameterValue, 'generate completions')
            [CompletionResult]::new('shortcuts', 'shortcuts', [CompletionResultType]::ParameterValue, 'Shortcuts subcommand')
            [CompletionResult]::new('man', 'man', [CompletionResultType]::ParameterValue, 'generate man')
            [CompletionResult]::new('list_crates', 'list_crates', [CompletionResultType]::ParameterValue, 'list crates subcommand')
            [CompletionResult]::new('git-mover', 'git-mover', [CompletionResultType]::ParameterValue, 'Launch git-mover cli')
            [CompletionResult]::new('music', 'music', [CompletionResultType]::ParameterValue, 'music subcommand')
            [CompletionResult]::new('share', 'share', [CompletionResultType]::ParameterValue, 'Quick http server share')
            [CompletionResult]::new('watching', 'watching', [CompletionResultType]::ParameterValue, 'List watching repos')
            [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterValue, 'Print this message or the help of the given subcommand(s)')
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
        'n4n5;help;completions' {
            break
        }
        'n4n5;help;shortcuts' {
            [CompletionResult]::new('sync-git', 'sync-git', [CompletionResultType]::ParameterValue, 'Sync git repos between GitHub and Codeberg')
            [CompletionResult]::new('sync-all', 'sync-all', [CompletionResultType]::ParameterValue, 'Sync all')
            break
        }
        'n4n5;help;shortcuts;sync-git' {
            break
        }
        'n4n5;help;shortcuts;sync-all' {
            break
        }
        'n4n5;help;man' {
            break
        }
        'n4n5;help;list_crates' {
            break
        }
        'n4n5;help;git-mover' {
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
        'n4n5;help;share' {
            break
        }
        'n4n5;help;watching' {
            break
        }
        'n4n5;help;help' {
            break
        }
    })

    $completions.Where{ $_.CompletionText -like "$wordToComplete*" } |
        Sort-Object -Property ListItemText
}
