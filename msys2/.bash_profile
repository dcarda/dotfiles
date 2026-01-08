# To the extent possible under law, the author(s) have dedicated all 
# copyright and related and neighboring rights to this software to the 
# public domain worldwide. This software is distributed without any warranty. 
# You should have received a copy of the CC0 Public Domain Dedication along 
# with this software. 
# If not, see <https://creativecommons.org/publicdomain/zero/1.0/>. 

# ~/.bash_profile: executed by bash(1) for login shells.

# The copy in your home directory (~/.bash_profile) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be beneficial to all, please feel free to send
# a patch to the msys2 mailing list.

# User dependent .bash_profile file

#  ──────────────────────────────────────────────────────────────────────
#  Color Settings
#  Bunch-o-predefined colors.  Makes reading code easier than escape sequences.
#  I don't remember where I found this.  o_O

# Reset
#Color_Off="\[\033[0m\]"   # Text Reset
Color_Off="\033[0m"   # Text Reset

# Regular Colors
Black="\033[0;30m"        # Black
Red="\033[0;31m"          # Red
Green="\033[0;32m"        # Green
Yellow="\033[0;33m"       # Yellow
Blue="\033[0;34m"         # Blue
Purple="\033[0;35m"       # Purple
Cyan="\033[0;36m"         # Cyan
White="\033[0;37m"        # White

# Bold
BBlack="\033[1;30m"       # Black
BRed="\033[1;31m"         # Red
BGreen="\033[1;32m"       # Green
BYellow="\033[1;33m"      # Yellow
BBlue="\033[1;34m"        # Blue
BPurple="\033[1;35m"      # Purple
BCyan="\033[1;36m"        # Cyan
BWhite="\033[1;37m"       # White

# Underline
UBlack="\033[4;30m"       # Black
URed="\033[4;31m"         # Red
UGreen="\033[4;32m"       # Green
UYellow="\033[4;33m"      # Yellow
UBlue="\033[4;34m"        # Blue
UPurple="\033[4;35m"      # Purple
UCyan="\033[4;36m"        # Cyan
UWhite="\033[4;37m"       # White

# Background
On_Black="\033[40m"       # Black
On_Red="\033[41m"         # Red
On_Green="\033[42m"       # Green
On_Yellow="\033[43m"      # Yellow
On_Blue="\033[44m"        # Blue
On_Purple="\033[45m"      # Purple
On_Cyan="\033[46m"        # Cyan
On_White="\033[47m"       # White

# High Intensty
IBlack="\033[0;90m"       # Black
IRed="\033[0;91m"         # Red
IGreen="\033[0;92m"       # Green
IYellow="\033[0;93m"      # Yellow
IBlue="\033[0;94m"        # Blue
IPurple="\033[0;95m"      # Purple
ICyan="\033[0;96m"        # Cyan
IWhite="\033[0;97m"       # White

# Bold High Intensty
BIBlack="\033[1;90m"      # Black
BIRed="\033[1;91m"        # Red
BIGreen="\033[1;92m"      # Green
BIYellow="\033[1;93m"     # Yellow
BIBlue="\033[1;94m"       # Blue
BIPurple="\033[1;95m"     # Purple
BICyan="\033[1;96m"       # Cyan
BIWhite="\033[1;97m"      # White

# High Intensty backgrounds
On_IBlack="\033[0;100m"   # Black
On_IRed="\033[0;101m"     # Red
On_IGreen="\033[0;102m"   # Green
On_IYellow="\033[0;103m"  # Yellow
On_IBlue="\033[0;104m"    # Blue
On_IPurple="\033[10;95m"  # Purple
On_ICyan="\033[0;106m"    # Cyan
On_IWhite="\033[0;107m"   # White

#  This will change some of the directory colors.
#  Really good explination here:
#    https://www.cyberciti.biz/faq/apple-mac-osx-terminal-color-ls-output-option/
export LSCOLORS=GxFxCxDxBxegedabagaced

#  ──────────────────────────────────────────────────────────────────────
#  Git
#  https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
if [ -f "" ] ; then
  source "/etc/profile.d/git-prompt.sh"
fi
if [ -f "/etc/profile.d/git-completion.bash" ] ; then
  source "/etc/profile.d/git-completion.bash"
fi

#  ──────────────────────────────────────────────────────────────────────
#  Source the users bashrc if it exists
if [ -f "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

#  ──────────────────────────────────────────────────────────────────────
#  Source the users profile if it exists
if [ -f "${HOME}/.profile" ] ; then
  source "${HOME}/.profile"
fi

# Set PATH so it includes user's private bin if it exists
# if [ -d "${HOME}/bin" ] ; then
#   PATH="${HOME}/bin:${PATH}"
# fi

# Set MANPATH so it includes users' private man if it exists
# if [ -d "${HOME}/man" ]; then
#   MANPATH="${HOME}/man:${MANPATH}"
# fi

# Set INFOPATH so it includes users' private info if it exists
# if [ -d "${HOME}/info" ]; then
#   INFOPATH="${HOME}/info:${INFOPATH}"
# fi

##  ──────────────────────────────────────────────────────────────────────

# Various variables you might want for your PS1 prompt instead
Time12h="\T"
Time12a="\@"
PathShort="\w"
PathFull="\W"
NewLine="\n"
Jobs="\j"

# This PS1 snippet was adopted from code for MAC/BSD I saw from: http://allancraig.net/index.php?option=com_content&view=article&id=108:ps1-export-command-for-git&catid=45:general&Itemid=96
# I tweaked it to work on UBUNTU 11.04 & 11.10 plus made it mo' better
export PS1='$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
  echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
  if [ "$?" -eq "0" ]; then \
            # @4 - Clean repository - nothing to commit
            echo "\n┌─ '$IGreen$Time12h$Color_Off''$Green'"$(__git_ps1 " [%s]"); \
  else \
            # @5 - Changes to working tree
            echo "\n┌─ '$IGreen$Time12h$Color_Off'  '$BWhite$On_Red'"$(__git_ps1 " [%s]"); \
  fi) \n'$Color_Off'│ '$BYellow$PathShort$Color_Off'   \n└─▶ "; \
else \
  # @2 - Prompt when not in GIT repo
  echo "  \n[Development System] - '$BIGreen' \w\n '$IPurple'[ \[\033[36m\]\u \[\033[0;95m\]]  \[\033[0;93m\] \D{} -> \[\033[0m\] "
fi)'

export GIT_SSL_NO_VERIFY=true
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue)<%an>%Creset' --abbrev-commit"

# -------------------------------------------------------------------------
#  Good Alias Stuff
# -------------------------------------------------------------------------

# -------------------------------------------------------------------------
#  This will clear the console screen and history.
alias clear="echo -ne '\033c'"

# -------------------------------------------------------------------------
#   Git commants
alias gw='git whatchanged'
alias gs='clear; git status'
alias gitlg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# -------------------------------------------------------------------------
#  Nice Bash Commands: https://github.com/vikaskyadav/awesome-bash-alias
alias cpv='rsync -ah --info=progress2'
alias scan='grep -niRHT  --color '
alias ll='ls -Alsu --color=always'

# -------------------------------------------------------------------------
# Docker stuff
# Clean stopped containers
alias cco="docker ps -a | grep "Exited" | awk '{print $1}' | xargs docker rm"
# After that, clean unused images to reclaim disk space
alias cimg="docker images | grep none | awk '{print \$3}' | xargs docker rmi"
# Finally the regular stuff just to save typing.
alias dps="docker ps -a"
alias di="docker images"
alias drmi="docker rmi"
alias drm="docker rm"

#  ──────────────────────────────────────────────────────────────────────
#  Display System Information
#clear
 
echo
echo -e "${Yellow}-------------------------------------------------------------------------${NC}"
echo -e " ${Black}${On_Cyan}                           Development System                          ${NC}"
echo -e "${Yellow}-------------------------------------------------------------------------${NC}"
echo -e "${Cyan}      User Name:  ${IWhite}" $(whoami)
echo -e "${Yellow}                   ------------------------------------------------------${NC}"
echo -e "${Cyan}       Hostname:  ${Yellow}" $(uname -n)
echo -e "${Cyan}       DNS Name:  ${Yellow} GOVJBS004T"
echo -e
echo -e "${Yellow}                   ------------------------------------------------------"
 
OSName=$( awk -F'[="]' '/PRETTY_NAME/ { print $3 }' /etc/os-release )
echo -e "${Cyan}         Distro:  ${Green}" $OSName
echo -e "${Cyan}   Linux Kernel:  ${Green}" $(uname -v)
echo -e "${Cyan}  Linux Release:  ${Green}" $(uname -r)
echo -e "${Yellow}-------------------------------------------------------------------------${NC}"
 
echo
echo

# -------------------------------------------------------------------------
#  This will clear the console screen and history.
alias clear=clearScreen

#  ──────────────────────────────────────────────────────────────────────
#  FUNCTIONS
#  ──────────────────────────────────────────────────────────────────────

#  ──────────────────────────────────────────────────────────────────────
#===  FUNCTION   ================================================
#         Name:  clearScreen
#  --------------------------------------------------------------
#  Description:  Clears the console screen and displays 
#                disk space information about the /apps directory.
#   Parameters:  None
#      Returns:  None
#================================================================
function clearScreen() {
    # Clear the screen
    echo -ne '\033c'
    #  
    echo
    echo -e "${Yellow}-------------------------------------------------------------------------${NC}"
    echo -e " ${Black}${On_Cyan}                           Development System                          ${NC}"
    echo -e "${Yellow}-------------------------------------------------------------------------${NC}"
    echo
    df | LC_ALL=en_US.UTF-8 numfmt --header --field 2-4 --grouping | column -t -R 2,3,4,5
    #  DF_BLOCK_SIZE="'1" df
} # ---  End Function:  clearScreen
