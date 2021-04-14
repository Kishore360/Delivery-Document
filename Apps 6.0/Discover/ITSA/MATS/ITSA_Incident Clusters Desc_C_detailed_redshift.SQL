/* Tables Accessed:
d_cluster
d_cluster_keyword */


select 'ldb."d_cluster_keyword" a11 ' as Table_name, count(a11.row_key) Row_Count
from ldb."d_cluster_keyword" a11 
union
select 'ldb."d_cluster" a12 ' as Table_name, count(a11.row_key) Row_Count
from ldb."d_cluster_keyword" a11 
join "ldb"."d_cluster" a12 
on (a11.cluster_key = a12.row_key)

