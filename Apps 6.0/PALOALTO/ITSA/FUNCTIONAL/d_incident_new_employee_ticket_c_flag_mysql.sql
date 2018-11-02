SELECT 
CASE WHEN cnt> 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 

CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_incident.last_resolved_on' ELSE 'data matched' END as Message  

from 

(select count(1) as cnt 

from 

(select sys_id, sourceinstance, opened_at, opened_by from paloalto_mdsdb.incident_final where cdctype<>'D') a
 
left join 
paloalto_mdwdb.d_incident c on a.sys_id=c.row_id and a.sourceinstance=c.source_id 

join 
paloalto_mdwdb.d_internal_contact a13 
on concat('INTERNAL_CONTACT~',a.opened_by)=a13.row_id and a.sourceinstance=a13.source_id 


where if (COALESCE(TIMESTAMPDIFF(DAY,date(a13.employee_start_date_c),date(c.opened_on)),-1) >=0  
 and  COALESCE(TIMESTAMPDIFF(DAY,date(a13.employee_start_date_c),date(c.opened_on)),-1) <=30 , 'Y' , 'N' ) <> c.new_employee_ticket_c_flag) temp;