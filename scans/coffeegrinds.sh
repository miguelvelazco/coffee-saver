outfile="search-${1}"
grep -r --exclude=search* $1 > $outfile.txt
cat $outfile.txt
