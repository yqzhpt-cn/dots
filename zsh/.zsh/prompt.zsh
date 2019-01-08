function precmd() {
  export PS1="%F{$(($RANDOM%256))}%n@%M %F{$(($RANDOM%256))}(%c) %f"
}
