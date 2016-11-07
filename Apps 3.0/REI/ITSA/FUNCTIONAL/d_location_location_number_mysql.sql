SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM
(select count(1) as cnt
from rei_mdwdb.d_location a 
join rei_mdsdb.cmn_location_final b 
ON a.row_id = b.sys_id AND a.source_id = b.sourceinstance

where b.name<>a.location_number)c ;