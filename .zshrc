
CONFIGS=$HOME/.config/zsh
source $HOME/.config/zsh/00-init.zsh
FILES_STR=$(fd --glob '*.zsh' --exclude '00-init.zsh' $CONFIGS)
FILES=($(echo $FILES_STR | tr '\n' ' '))
for FILE in $FILES; do                                 
    source $FILE
done



