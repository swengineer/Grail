#!/bin/sh

#echo "Running all tests"
#exit 0

if [ $# -ne 1 ]
then
	echo "error:expected only 1 argument"
	exit 1
fi

algo=$1
#algo_lst=('sssp' 'wcc' 'pagerank')
#check if input argument was valid
#if [[ !(" ${algo_lst[*]} " == *$algo*)  ]]; then
#	echo "error:input algo name is incorrect"
#	exit 1
#fi

#loads vertices and edges for the algorithm into the table using psql command
dir=./tests/"$algo"
file_suffix="_test"
num_files=`ls -lR $dir/*.sql | wc -l`
num_sql_files_per_test=2
num_tests=`echo $((num_files / num_sql_files_per_test))`
echo "Number of tests for algo "$algo"="$num_tests

for iter in $(seq 1 $num_tests); do
vertex_load_sql=$dir"/create_and_load_vertex_test"$iter".sql"
echo $vertex_load_sql
edge_load_sql=$dir"/create_and_load_edge"$iter".sql"
echo $edge_load_sql

#executes generated algorithmic sql and loads into next table of the db
algo_sql="./analytics/"$algo".sql"
echo $algo_sql

#compares the diff between golden file and exported file
python ./compareoutput.py -f $dir"/"$algo"_golden_test"$iter".out" -F $dir"/"$algo".out"
ret=$?
if [ $ret -ne 0 ]; then
	echo "Discrepancy in Algorithmic Output generated by GRAIL"
	exit 1
fi
done

echo "All Tests Successful for "$algo
exit 0
