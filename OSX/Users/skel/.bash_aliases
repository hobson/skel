# Building Energy data analysis
alias pylab='ipython qtconsole --pylab=qt'
alias dalcode='ipython qtconsole --pylab=qt "import dal"'
alias gocode='cd /home/hobs/code/buildingenergy/BuildingEnergy/doe_data_test/'

# caused bug http://stackoverflow.com/q/14410135/623735
#alias git=hub

# Building Energy (flint)
export FLINT_DEFAULT_ENV_NAME=core

# # getting weird errors
# chop () {
#     if [ $1 ]
#     then
#         flint chop-wood $1
#     else
#         flint chop-wood $FLINT_DEFAULT_ENV_NAME
#     fi
# }
# alias chopwood='chop'
# alias chop_wood='chop'
# alias chop-wood='chop'
# alias spark='flint spark'
# alias sharpen='flint sharpen'
# alias be='flint chop-wood $FLINT_DEFAULT_ENV_NAME && flint spark && sublime ~/flint-projects/$FLINT_DEFAULT_ENV_NAME/django &'

# FIXME: detect os and search paths for these apps (and their various versions) before setting aliases
# MACOSX
alias excel='open "/Applications/Microsoft Office 2011/Microsoft Excel.app"'
alias word='open "/Applications/Microsoft Office 2011/Microsoft Word.app"'
alias ppt='open "/Applications/Microsoft Office 2011/Microsoft PowerPoint.app"'
alias powerpoint=ppt
