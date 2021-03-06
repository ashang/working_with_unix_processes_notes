#
# fork(2) calls slow down as the parent process uses more memory due to the need to copy page tables. 
# In many common uses of fork(), where it is followed by one of the exec family of functions 
# to spawn child processes (Kernel#system, IO::popen, Process::spawn, etc.), 
# it's possible to remove this overhead by using special process spawning interfaces (posix_spawn(), vfork(), etc.)
#
# The posix-spawn library aims to implement a subset of the Ruby 1.9 Process::spawn interface 
# in a way that takes advantage of fast process spawning interfaces 
# when available and provides sane fallbacks on systems that do not.
#
# https://github.com/rtomayko/posix-spawn/
#
# $ gem install posix-spawn

require 'posix/spawn'
pid  = POSIX::Spawn::spawn('echo', 'hello world')
stat = Process::waitpid(pid)
