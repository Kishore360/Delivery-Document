
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.'
ELSE 'Data Matched' END AS Message
FROM (
select count(1) as cnt
from pan_mdsdb.u_service_request_final a
left join pan_mdwdb.d_service_request_c c
on  a.sys_id = c.ROW_ID and a.sourceinstance=c.source_id
where c.sd_touch_c_flag <> CASE WHEN a.u_sd_touch=1 THEN 'Y' ELSE 'N'END) g
 ;
 
 