select a.number,b.caused_by,u_require_downtime,b.contact_type,b.opened_at,work_start,work_end,
Case when b.caused_by is not null and 
  ((u_require_downtime) not in ('Yes') or (b.contact_type)<>'Auto Ticket' or 
b.opened_at not between (a.work_start) 
and (a.work_end)) then 'Y' else 'N' end change_caused_incident_flag
from  png_mdsdb.change_request_final a
 left    join png_mdsdb.sys_choice_final sys_choice
  on  a.state=sys_choice.value and sys_choice.name='change_request' and sys_choice.element='state' 
  and sys_choice.language='en'and sys_choice.label <> 'Canceled' 
  left  join (select (opened_at) opened_at,caused_by caused_by,contact_type,number,sourceinstance from png_mdsdb.incident_final 
 l)b
 on a.sys_id=b.caused_by and a.sourceinstance=b.sourceinstance
  where a.cdctype<>'D' and a.number='CHG0090434'
 ; 