SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_incident.opened_by_key' ELSE 'SUCCESS' END as Message 
 
from 
 
(select count(1) as cnt 
from 
(select * from paloalto_mdsdb.sc_req_item_final where CDCTYPE<>'D') SRC
  
join  paloalto_mdwdb.f_request_item f 
on SRC.sys_id=f.row_id and SRC.sourceinstance=f.source_id
 
join paloalto_mdwdb.d_request_item d
 on f.request_item_key=d.row_key
 
left JOIN paloalto_mdwdb.d_internal_contact a 
ON a.row_key = f.opened_by_key 

WHERE f.opened_by_employee_duration <> COALESCE(TIMESTAMPDIFF(DAY,date(a.employee_start_date_c),date(d.opened_on)),0)) temp;