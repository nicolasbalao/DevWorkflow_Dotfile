if status is-interactive && ensure tmux && ensure tmux-sessionizer
    bind -M insert \cf 'tmux-sessionizer'
    bind -M insert \ch 'tmux neww tmux-sessionizer -l'

    bind -M default \cf 'tmux-sessionizer'
    bind -M default \ch 'tmux neww tmux-sessionizer -l'
end
