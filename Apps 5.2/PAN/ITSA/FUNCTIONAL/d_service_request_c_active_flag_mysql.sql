
SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,
CASE WHEN cnt > 0 THEN 'Data did not Match.' ELSE 'Data Matched' END AS Message 

FROM 
(select count(1) cnt 

from 
(select sys_id, sourceinstance, active from pan6_mdsdb.u_service_request_final where CDCTYPE<>'D') a
 
left join pan6_mdwdb.d_service_request_c b 
on a.sys_id=b.row_id and a.sourceinstance=b.source_id  

where case when a.active = 1 then 'Y' else 'N' end <>b.active_flag)i; 
