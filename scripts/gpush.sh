gpush() {
  if git rev-parse --git-dir > /dev/null 2>&1; then
    git add -A && git commit -m $1 && git push 
  else 
    printf "ERROR: Not in git repo\n"
  fi
}
