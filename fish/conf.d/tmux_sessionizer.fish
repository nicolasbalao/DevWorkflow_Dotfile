if status is-interactive && ensure tmux && ensure tmux-sessionizer
    bind \cf 'tmux-sessionizer'
    bind \ch 'tmux neww tmux-sessionizer -l'
end
