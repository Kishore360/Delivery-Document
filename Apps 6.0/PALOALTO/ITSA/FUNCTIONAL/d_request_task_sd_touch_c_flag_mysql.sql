SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result, 

CASE WHEN cnt > 0 THEN 'Data did not Match.'ELSE 'Data Matched' END AS Message 

FROM (select count(1) as cnt
 
from (select sys_id, sourceinstance, u_sd_touch from paloalto_mdsdb.sc_task_final where CDCTYPE<>'D') a 

left join paloalto_mdwdb.d_request_task c
on  a.sys_id = c.row_id and a.sourceinstance=c.source_id 

where CASE WHEN a.u_sd_touch=1 THEN 'Y' ELSE 'N'END <> c.sd_touch_c_flag  ) g;