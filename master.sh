#create and load data in an external table on date static partition
#create hive managed table and loading data

beeline -u jdbc:hive2://localhost:10000 username password -n hive -p hive -f /home/cloudera/workspace/
createTable.hql;

echo "static  partition table created and data loaded"

#create and load data in an external table on date dynamic partition

beeline -u jdbc:hive2://localhost:10000 username password -n hive -f /home/cloudera/workspace/createDy
namicTable.hql;
echo "Dynamic partition table created and data loaded"

