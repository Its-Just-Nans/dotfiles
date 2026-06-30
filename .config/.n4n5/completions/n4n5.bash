_n4n5() {
    local i cur prev opts cmd
    COMPREPLY=()
    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
        cur="$2"
    else
        cur="${COMP_WORDS[COMP_CWORD]}"
    fi
    prev="$3"
    cmd=""
    opts=""

    for i in "${COMP_WORDS[@]:0:COMP_CWORD}"
    do
        case "${cmd},${i}" in
            ",$1")
                cmd="n4n5"
                ;;
            n4n5,completions)
                cmd="n4n5__subcmd__completions"
                ;;
            n4n5,config)
                cmd="n4n5__subcmd__config"
                ;;
            n4n5,gh)
                cmd="n4n5__subcmd__gh"
                ;;
            n4n5,git-mover)
                cmd="n4n5__subcmd__git__subcmd__mover"
                ;;
            n4n5,help)
                cmd="n4n5__subcmd__help"
                ;;
            n4n5,list_crates)
                cmd="n4n5__subcmd__list_crates"
                ;;
            n4n5,man)
                cmd="n4n5__subcmd__man"
                ;;
            n4n5,movies)
                cmd="n4n5__subcmd__movies"
                ;;
            n4n5,music)
                cmd="n4n5__subcmd__music"
                ;;
            n4n5,share)
                cmd="n4n5__subcmd__share"
                ;;
            n4n5,shortcuts)
                cmd="n4n5__subcmd__shortcuts"
                ;;
            n4n5,watching)
                cmd="n4n5__subcmd__watching"
                ;;
            n4n5__subcmd__config,help)
                cmd="n4n5__subcmd__config__subcmd__help"
                ;;
            n4n5__subcmd__config,open)
                cmd="n4n5__subcmd__config__subcmd__open"
                ;;
            n4n5__subcmd__config__subcmd__help,help)
                cmd="n4n5__subcmd__config__subcmd__help__subcmd__help"
                ;;
            n4n5__subcmd__config__subcmd__help,open)
                cmd="n4n5__subcmd__config__subcmd__help__subcmd__open"
                ;;
            n4n5__subcmd__gh,help)
                cmd="n4n5__subcmd__gh__subcmd__help"
                ;;
            n4n5__subcmd__gh,projects)
                cmd="n4n5__subcmd__gh__subcmd__projects"
                ;;
            n4n5__subcmd__gh,pulls)
                cmd="n4n5__subcmd__gh__subcmd__pulls"
                ;;
            n4n5__subcmd__gh__subcmd__help,help)
                cmd="n4n5__subcmd__gh__subcmd__help__subcmd__help"
                ;;
            n4n5__subcmd__gh__subcmd__help,projects)
                cmd="n4n5__subcmd__gh__subcmd__help__subcmd__projects"
                ;;
            n4n5__subcmd__gh__subcmd__help,pulls)
                cmd="n4n5__subcmd__gh__subcmd__help__subcmd__pulls"
                ;;
            n4n5__subcmd__help,completions)
                cmd="n4n5__subcmd__help__subcmd__completions"
                ;;
            n4n5__subcmd__help,config)
                cmd="n4n5__subcmd__help__subcmd__config"
                ;;
            n4n5__subcmd__help,gh)
                cmd="n4n5__subcmd__help__subcmd__gh"
                ;;
            n4n5__subcmd__help,git-mover)
                cmd="n4n5__subcmd__help__subcmd__git__subcmd__mover"
                ;;
            n4n5__subcmd__help,help)
                cmd="n4n5__subcmd__help__subcmd__help"
                ;;
            n4n5__subcmd__help,list_crates)
                cmd="n4n5__subcmd__help__subcmd__list_crates"
                ;;
            n4n5__subcmd__help,man)
                cmd="n4n5__subcmd__help__subcmd__man"
                ;;
            n4n5__subcmd__help,movies)
                cmd="n4n5__subcmd__help__subcmd__movies"
                ;;
            n4n5__subcmd__help,music)
                cmd="n4n5__subcmd__help__subcmd__music"
                ;;
            n4n5__subcmd__help,share)
                cmd="n4n5__subcmd__help__subcmd__share"
                ;;
            n4n5__subcmd__help,shortcuts)
                cmd="n4n5__subcmd__help__subcmd__shortcuts"
                ;;
            n4n5__subcmd__help,watching)
                cmd="n4n5__subcmd__help__subcmd__watching"
                ;;
            n4n5__subcmd__help__subcmd__config,open)
                cmd="n4n5__subcmd__help__subcmd__config__subcmd__open"
                ;;
            n4n5__subcmd__help__subcmd__gh,projects)
                cmd="n4n5__subcmd__help__subcmd__gh__subcmd__projects"
                ;;
            n4n5__subcmd__help__subcmd__gh,pulls)
                cmd="n4n5__subcmd__help__subcmd__gh__subcmd__pulls"
                ;;
            n4n5__subcmd__help__subcmd__movies,add)
                cmd="n4n5__subcmd__help__subcmd__movies__subcmd__add"
                ;;
            n4n5__subcmd__help__subcmd__movies,open)
                cmd="n4n5__subcmd__help__subcmd__movies__subcmd__open"
                ;;
            n4n5__subcmd__help__subcmd__movies,show)
                cmd="n4n5__subcmd__help__subcmd__movies__subcmd__show"
                ;;
            n4n5__subcmd__help__subcmd__movies,stats)
                cmd="n4n5__subcmd__help__subcmd__movies__subcmd__stats"
                ;;
            n4n5__subcmd__help__subcmd__movies,sync)
                cmd="n4n5__subcmd__help__subcmd__movies__subcmd__sync"
                ;;
            n4n5__subcmd__help__subcmd__music,open)
                cmd="n4n5__subcmd__help__subcmd__music__subcmd__open"
                ;;
            n4n5__subcmd__help__subcmd__music,sync)
                cmd="n4n5__subcmd__help__subcmd__music__subcmd__sync"
                ;;
            n4n5__subcmd__help__subcmd__shortcuts,sync-all)
                cmd="n4n5__subcmd__help__subcmd__shortcuts__subcmd__sync__subcmd__all"
                ;;
            n4n5__subcmd__help__subcmd__shortcuts,sync-git)
                cmd="n4n5__subcmd__help__subcmd__shortcuts__subcmd__sync__subcmd__git"
                ;;
            n4n5__subcmd__movies,add)
                cmd="n4n5__subcmd__movies__subcmd__add"
                ;;
            n4n5__subcmd__movies,help)
                cmd="n4n5__subcmd__movies__subcmd__help"
                ;;
            n4n5__subcmd__movies,open)
                cmd="n4n5__subcmd__movies__subcmd__open"
                ;;
            n4n5__subcmd__movies,show)
                cmd="n4n5__subcmd__movies__subcmd__show"
                ;;
            n4n5__subcmd__movies,stats)
                cmd="n4n5__subcmd__movies__subcmd__stats"
                ;;
            n4n5__subcmd__movies,sync)
                cmd="n4n5__subcmd__movies__subcmd__sync"
                ;;
            n4n5__subcmd__movies__subcmd__help,add)
                cmd="n4n5__subcmd__movies__subcmd__help__subcmd__add"
                ;;
            n4n5__subcmd__movies__subcmd__help,help)
                cmd="n4n5__subcmd__movies__subcmd__help__subcmd__help"
                ;;
            n4n5__subcmd__movies__subcmd__help,open)
                cmd="n4n5__subcmd__movies__subcmd__help__subcmd__open"
                ;;
            n4n5__subcmd__movies__subcmd__help,show)
                cmd="n4n5__subcmd__movies__subcmd__help__subcmd__show"
                ;;
            n4n5__subcmd__movies__subcmd__help,stats)
                cmd="n4n5__subcmd__movies__subcmd__help__subcmd__stats"
                ;;
            n4n5__subcmd__movies__subcmd__help,sync)
                cmd="n4n5__subcmd__movies__subcmd__help__subcmd__sync"
                ;;
            n4n5__subcmd__music,help)
                cmd="n4n5__subcmd__music__subcmd__help"
                ;;
            n4n5__subcmd__music,open)
                cmd="n4n5__subcmd__music__subcmd__open"
                ;;
            n4n5__subcmd__music,sync)
                cmd="n4n5__subcmd__music__subcmd__sync"
                ;;
            n4n5__subcmd__music__subcmd__help,help)
                cmd="n4n5__subcmd__music__subcmd__help__subcmd__help"
                ;;
            n4n5__subcmd__music__subcmd__help,open)
                cmd="n4n5__subcmd__music__subcmd__help__subcmd__open"
                ;;
            n4n5__subcmd__music__subcmd__help,sync)
                cmd="n4n5__subcmd__music__subcmd__help__subcmd__sync"
                ;;
            n4n5__subcmd__shortcuts,help)
                cmd="n4n5__subcmd__shortcuts__subcmd__help"
                ;;
            n4n5__subcmd__shortcuts,sync-all)
                cmd="n4n5__subcmd__shortcuts__subcmd__sync__subcmd__all"
                ;;
            n4n5__subcmd__shortcuts,sync-git)
                cmd="n4n5__subcmd__shortcuts__subcmd__sync__subcmd__git"
                ;;
            n4n5__subcmd__shortcuts__subcmd__help,help)
                cmd="n4n5__subcmd__shortcuts__subcmd__help__subcmd__help"
                ;;
            n4n5__subcmd__shortcuts__subcmd__help,sync-all)
                cmd="n4n5__subcmd__shortcuts__subcmd__help__subcmd__sync__subcmd__all"
                ;;
            n4n5__subcmd__shortcuts__subcmd__help,sync-git)
                cmd="n4n5__subcmd__shortcuts__subcmd__help__subcmd__sync__subcmd__git"
                ;;
            *)
                ;;
        esac
    done

    case "${cmd}" in
        n4n5)
            opts="-d -h -V --config --debug --use-input --help --version config gh movies completions shortcuts man list_crates git-mover music share watching help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --config)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__completions)
            opts="-h --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__config)
            opts="-h --help open help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__config__subcmd__help)
            opts="open help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__config__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__config__subcmd__help__subcmd__open)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__config__subcmd__open)
            opts="-p -h --path --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__gh)
            opts="-h --help pulls projects help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__gh__subcmd__help)
            opts="pulls projects help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__gh__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__gh__subcmd__help__subcmd__projects)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__gh__subcmd__help__subcmd__pulls)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__gh__subcmd__projects)
            opts="-j -h --json --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__gh__subcmd__pulls)
            opts="-j -h --json --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__git__subcmd__mover)
            opts="-d -v -h --from --source --to --destination --no-forks --no-delete --resync --config --show-config-path --manual --verbose --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --source)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --from)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --destination)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --to)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --config)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__help)
            opts="config gh movies completions shortcuts man list_crates git-mover music share watching help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__help__subcmd__completions)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__help__subcmd__config)
            opts="open"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__help__subcmd__config__subcmd__open)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__help__subcmd__gh)
            opts="pulls projects"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__help__subcmd__gh__subcmd__projects)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__help__subcmd__gh__subcmd__pulls)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__help__subcmd__git__subcmd__mover)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__help__subcmd__list_crates)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__help__subcmd__man)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__help__subcmd__movies)
            opts="add open stats show sync"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__help__subcmd__movies__subcmd__add)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__help__subcmd__movies__subcmd__open)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__help__subcmd__movies__subcmd__show)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__help__subcmd__movies__subcmd__stats)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__help__subcmd__movies__subcmd__sync)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__help__subcmd__music)
            opts="sync open"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__help__subcmd__music__subcmd__open)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__help__subcmd__music__subcmd__sync)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__help__subcmd__share)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__help__subcmd__shortcuts)
            opts="sync-git sync-all"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__help__subcmd__shortcuts__subcmd__sync__subcmd__all)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__help__subcmd__shortcuts__subcmd__sync__subcmd__git)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__help__subcmd__watching)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__list_crates)
            opts="-h --username --user-agent --output-markdown --output-list --output-list-full --delay --filtered --verbose --specials --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --username)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --user-agent)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-markdown)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-list)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-list-full)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --delay)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --filtered)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --specials)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__man)
            opts="-h --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__movies)
            opts="-h --help add open stats show sync help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__movies__subcmd__add)
            opts="-h --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__movies__subcmd__help)
            opts="add open stats show sync help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__movies__subcmd__help__subcmd__add)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__movies__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__movies__subcmd__help__subcmd__open)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__movies__subcmd__help__subcmd__show)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__movies__subcmd__help__subcmd__stats)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__movies__subcmd__help__subcmd__sync)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__movies__subcmd__open)
            opts="-p -h --path --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__movies__subcmd__show)
            opts="-r -f -c -h --reverse --full --comment --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__movies__subcmd__stats)
            opts="-j -h --json --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__movies__subcmd__sync)
            opts="-j -h --json --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__music)
            opts="-h --help sync open help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__music__subcmd__help)
            opts="sync open help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__music__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__music__subcmd__help__subcmd__open)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__music__subcmd__help__subcmd__sync)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__music__subcmd__open)
            opts="-p -h --path --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__music__subcmd__sync)
            opts="-h --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__share)
            opts="-h --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__shortcuts)
            opts="-h --help sync-git sync-all help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__shortcuts__subcmd__help)
            opts="sync-git sync-all help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__shortcuts__subcmd__help__subcmd__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__shortcuts__subcmd__help__subcmd__sync__subcmd__all)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__shortcuts__subcmd__help__subcmd__sync__subcmd__git)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__shortcuts__subcmd__sync__subcmd__all)
            opts="-h --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__shortcuts__subcmd__sync__subcmd__git)
            opts="-h --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        n4n5__subcmd__watching)
            opts="-h --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
    esac
}

if [[ "${BASH_VERSINFO[0]}" -eq 4 && "${BASH_VERSINFO[1]}" -ge 4 || "${BASH_VERSINFO[0]}" -gt 4 ]]; then
    complete -F _n4n5 -o nosort -o bashdefault -o default n4n5
else
    complete -F _n4n5 -o bashdefault -o default n4n5
fi
