def FlagsForFile(filename, **kwargs):

  flags = [
    '-Wall',
    '-Wextra',
    '-Werror'
    '-pedantic',
    '-I',
    '.',
  ]

  data = kwargs['client_data']
  filetype = data['&filetype']
  if filetype == 'c':
    flags += [
              '-x', 
              'c',
              '-std=c99'
              '-stdlib=libc',
              # '-isystem',
              # '/usr/lib'
              # '-isystem',
              '-I/usr/include',
              # '-isystem',
              '-I/usr/local/include'
             ]
  elif filetype == 'cpp':
    flags += [
              '-std=c++11',
              '-stdlib=libc++',
              '-x',
              'c++',
              '-I/usr/include/c++/8/'
             ]
  else:
    flags = []

  with open('/home/florian/ycm_log', 'w') as f:
      f.write(str(flags))

  return {
    'flags':    flags,
    'do_cache': True
}
