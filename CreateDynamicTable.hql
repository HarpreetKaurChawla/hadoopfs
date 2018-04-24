#create dynamic partition table

create table if not exists DynaPartTableStaging(sdate date,Name String,make String,model String
row format delimited
fields terminated by ' '
lines terminated by '\n')
stored as textfile;

load data local inpath '/home/cloudera/workspace/DynamicSampleFile' overwrite into table DynaPartTable
staging;

set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;

create table if not exists DynaPartTable(Name String,make String,model String)
partitioned by (sdate date)
row format delimited
fields terminated by ' '
lines terminated by '\n')
stored as textfile;

insert into table DynaPartTable
Partition (sdate)
select name,make,model,sdate from DynapartTableStaging;

set hive.exec.dynamic.partition=false;
set hive.exec.dynamic.partition.mode=strict;
