if status is-interactive && ensure tmux && ensure tmux-sessionizer
    bind -M insert \cf 'tmux-sessionizer'
    bind -M insert \ch 'tmux neww tmux-sessionizer -l'

    bind -M default \cf 'tmux-sessionizer'
    bind -M default \ch 'tmux neww tmux-sessionizer -l'

    if test -n $TMUX
        # cdp allow to quickly return back to the project
        function cdp
            set -l project (tmux showenv ROOT_DIR | string replace 'ROOT_DIR=' '')
            cd $project
        end
    end
end


