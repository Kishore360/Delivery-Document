SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM
(select count(1) as cnt
from rei_mdwdb.d_location a 
join rei_mdsdb.cmn_location_final b 
ON a.row_id = b.sys_id AND a.source_id = b.sourceinstance
join rei_mdwdb.d_location_clean_c src on src.row_id = a.location_name
where src.target_location_name<>a.location_number )c ;

