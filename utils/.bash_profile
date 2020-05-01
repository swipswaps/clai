# Respect file tags for ASCII/EBCDIC stuff.
export _BPXK_AUTOCVT=ON
export _CEE_RUNOPTS="FILETAG(AUTOCVT,AUTOTAG) POSIX(ON)"
export _BPXK_SETIBMOPT_TRANSPORT=TCP342

# Set up for Python and Anaconda
export RELEASE_PREFIX=
export PYTHON_HOME=$RELEASE_PREFIX/usr/lpp/IBM/izoda/anaconda
export LIBPATH=$PYTHON_HOME/lib:$LIBPATH
export FFI_LIB=$PYTHON_HOME/lib/ffi
export MANPATH=$PYTHON_HOME/share/man:$MANPATH
export PKG_CONFIG_PATH=$PYTHON_HOME/lib/pkgconfig:$PYTHON_HOME/share/pkgconfig
export CURL_CA_BUNDLE=$PYTHON_HOME/etc/ssl/cacert.pem

# Add Git, Python and bash 
export PATH=/Voyager/git/bin/:$PYTHON_HOME/bin:$PATH
