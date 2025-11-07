if [[ $# -eq 0 ]]; then
  echo "Usage: $0 file1 [file2 ...]"
  exit 1
fi

for FILE in "$@"; do
  if [[ ! -f $FILE ]]; then
    echo "Error: $FILE not found"
    continue
  fi

  NLINES=$(wc -l < $FILE)

  if [[ $NLINES -eq 0 ]]; then
    echo "File: $FILE contains zero lines, it is empty"
  elif [[ $NLINES -eq 1 ]]; then
    echo "File: $FILE contains one line"
  else
    echo "File: $FILE contains $NLINES lines"
  fi
done
