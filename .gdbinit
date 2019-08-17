set disassembly-flavor intel

define init-peda
source /usr/share/peda/peda.py
end
document init-peda
Initializes the PEDA (Python Exploit Development Assistant for GDB) framework
end

define init-pwndbg
source /usr/share/pwndbg/gdbinit.py
end
document init-pwndbg
Initializes PwnDBG
end
