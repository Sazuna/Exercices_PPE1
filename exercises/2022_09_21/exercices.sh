tree 2016 | grep 2016 | grep .ann$ | wc -l
tree 2017 | grep 2017 | grep .ann$ | wc -l
tree 2018 | grep 2018 | grep .ann$ | wc -l

cat 201?/??/*.ann | grep Location | cut --output-delimiter="\t" --field 3 | sort | uniq --count
cat 201?/??/*.ann | grep Location | cut --output-delimiter="\t" --field 3 | sed "s/T1//g" | sort | uniq --count
cat 201?/??/*.ann | grep Location | cut --output-delimiter="\t" --field 3 | sed "s/T1//g" | sort | uniq --count | sort -n
