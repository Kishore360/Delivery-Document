SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
 ucsf_mdwdb.f_incident a 
join ucsf_mdsdb.incident_final b 
on a.row_id=b.sys_id and b.sourceinstance=a.source_id 
join ucsf_mdwdb.d_internal_contact emp 
on case when b.caller_id is null then 'UNSPECIFIED' else concat('INTERNAL_CONTACT~',b.caller_id) end=emp.row_id and b.sourceinstance=emp.source_id 
join ucsf_mdwdb.d_internal_organization dept 
on concat('DEPARTMENT~',emp.department_code) = dept.row_id AND emp.source_id = dept.source_id AND dept.current_flag = 'Y' 
where a.opened_by_department_key<>dept.row_key ;