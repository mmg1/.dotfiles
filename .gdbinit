set disassembly-flavor intel
<<<<<<< HEAD
source ~/pwndbg/gdbinit.py
=======
>>>>>>> 68c2788... fixed .gdbinit

define init-peda
source ~/peda/peda.py
end
document init-peda
Initializes the PEDA (Python Exploit Development Assistant for GDB) framework
end

define init-pwndbg
source ~/pwndbg/gdbinit.py
end
document init-pwndbg
Initializes PwnDBG
end
