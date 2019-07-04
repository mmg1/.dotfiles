alias xcp='xclip -in -sel c'
alias gcp="xclip -out -sel c"
alias gdbui='gdb -tui --nx -q'
alias pudb='python3 -m pudb'
alias vg='valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --num-callers=20 --track-fds=yes'
alias open='xdg-open'
cutter () { /home/florian/Documents/CTF/reverse/Cutter-v1.8.2-x64.Linux.AppImage "$1" &> /dev/null & }
