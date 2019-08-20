alias xcp='xclip -in -sel c'
alias gcp="xclip -out -sel c"
alias gdbui='gdb -tui --nx -q'
alias pudb='python3 -m pudb'
alias vg='valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --num-callers=20 --track-fds=yes'
alias open='xdg-open'
cutter () { /home/florian/Documents/Cutter-v1.8.3-x64.Linux.AppImage "$1" &> /dev/null & }
alias ta='tmux attach'
alias tn='tmux new -s main'
