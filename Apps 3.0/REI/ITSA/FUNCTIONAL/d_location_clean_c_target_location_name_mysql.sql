SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
from(
select count(1) as cnt
from rei_mdsdb.us_location_clean_final a
JOIN rei_mdwdb.d_location_clean_c b
on a.sourceinstance=b.source_id
and a.row_id = b.row_id
where a.target_location_name <>b.target_location_name)a;