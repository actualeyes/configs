# .bashrc
# Futurama quotes:
function futurama() { curl -Is slashdot.org | egrep '^X-(F|B|L)' | cut -d \- -f 2; }
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
# Source work definitions
if [ -f $HOME/lib/work/work_env.sh ]; then
	. $HOME/lib/work/work_env.sh
fi

#export LC_ALL=ja_JP
# User specific aliases and functions
export EDITOR=emacs
# Perl environment
export PATH=$HOME/local/bin:$PATH
export MANPATH=$HOME/local/man:$MANPATH
# Android environment
export PATH=$HOME/lib/android/tools:$PATH
alias sudo='sudo env PATH=$PATH'
alias pu='pushd'
alias po='popd'
#alias emacs='emacs -nw'
alias epochtohum="perl -e 'print scalar(localtime(\$ARGV[0])),\"\\n\"'"
# awk dirs solution
#alias dirs="dirs -p | awk 'BEGIN { count=0 } { print count \" \" \$1 } {count++}'"
# perl dirs solution
alias dirs="dirs -p | perl -wnl -e 'print \"\$. \$_\"'"

eval $(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)
# /usr/bin/luit
# Run functions =
futurama;
