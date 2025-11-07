FILE=$1
LINES=${2:-3}

if [[ ! -f $FILE ]]; then
  echo "Error: File not found"
  exit 1
fi

TOTAL_LINES=$(wc -l < $FILE)
THRESHOLD=$((2 * LINES))

if [[ $TOTAL_LINES -le $THRESHOLD ]]; then
  cat $FILE
else
  echo "Warning: File has $TOTAL_LINES lines, showing first $LINES and last $LINES"
  head -n $LINES $FILE
  echo "..."
  tail -n $LINES $FILE
fi
