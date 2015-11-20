SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
ucsf_mdwdb.f_change_request a 
join ucsf_mdsdb.change_request_final b 
on a.row_id=b.sys_id and a.source_id=b.sourceinstance
join ucsf_mdwdb.d_internal_contact emp 
on COALESCE(CONCAT('INTERNAL_CONTACT~',b.REQUESTED_BY),'UNSPECIFIED')=emp.row_id and b.sourceinstance=emp.source_id 
join ucsf_mdwdb.d_internal_organization dept 
on concat('DEPARTMENT~',emp.department_code) = dept.row_id AND emp.source_id = dept.source_id AND dept.current_flag = 'Y' 
where a.requested_by_department_key<>dept.row_key ;