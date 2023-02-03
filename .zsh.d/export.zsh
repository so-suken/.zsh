#export

#find library and header file from /opt/local(mac port)
#for xz
export LDFLAGS="-L/opt/local/lib/"
export CPPFLAGS="-I/opt/local/include -L/opt/local/lib"
export C_INCLUDE_PATH="/opt/local/include"
export LIBRARY_PATH="/opt/local/lib"

#Oepnssl (possibly this will work when you got any error of openssl)
export CPPFLAGS="-I/opt/local/bin/openssl/include"
export LDFLAGS="-L/opt/local/bin/openssl/lib"

export PATH=/Applications/Julia-1.8.app/Contents/Resources/julia/bin:$PATH

#homebrew
export PATH=$HOME/.homebrew/bin:$PATH
export HOMEBREW_CACHE=$HOME/.homebrew/cache
