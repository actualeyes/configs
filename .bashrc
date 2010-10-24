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

# User specific aliases and functions
export EDITOR=emacs
# Perl environment
export PATH=$HOME/local/bin:$PATH
export MANPATH=$HOME/local/man:$MANPATH
# Android environment
export PATH=$HOME/lib/android/tools:$PATH

alias pu='pushd'
alias po='popd'
#alias emacs='emacs -nw'
alias epochtohum="perl -e 'print scalar(localtime(\$ARGV[0])),\"\\n\"'"
# awk dirs solution
#alias dirs="dirs -p | awk 'BEGIN { count=0 } { print count \" \" \$1 } {count++}'"
# perl dirs solution
alias dirs="dirs -p | perl -wnl -e 'print \"\$. \$_\"'"


# Run functions =
futurama;
