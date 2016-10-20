

SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,
CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 

from(select count(1) as cnt
 
from rambus_mdwdb.f_change_request a 

left outer join rambus_mdsdb.change_request_final b 

on a.row_id =b.sys_id 

and a.source_id=b.sourceinstance

where a.acceptance_duration_c <> CASE WHEN b.u_acceptance_duration IS NULL THEN 0 ELSE TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',b.u_acceptance_duration) end ) z;