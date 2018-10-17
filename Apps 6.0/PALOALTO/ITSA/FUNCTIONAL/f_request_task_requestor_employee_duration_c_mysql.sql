SELECT 
CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 

CASE WHEN cnt>0  THEN 'MDS to DWH data validation failed for f_request_task.requestor_employee_duration_c' ELSE 'SUCCESS' END as Message 

FROM 
(select count(1) as cnt 
from 
  
(select sys_id, sourceinstance,requested_for from paloalto_mdsdb.sc_task_final where cdctype<>'D') src 

join paloalto_mdwdb.f_request_task trgt
on src.sys_id = trgt.row_id and src.sourceinstance = trgt.source_id 

JOIN paloalto_mdwdb.d_request_task d 
 ON trgt.request_task_key = d.row_key 

LEFT JOIN paloalto_mdwdb.d_internal_contact lkp 
ON COALESCE(CONCAT('INTERNAL_CONTACT~',requested_for),'UNSPECIFIED') =lkp.row_id and src.sourceinstance = lkp.source_id
 
WHERE COALESCE(TIMESTAMPDIFF(day,date(lkp.employee_start_date_c),date(d.opened_on)),0) <> trgt.requestor_employee_duration_c) temp;