SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
ucsf_mdwdb.f_task_survey a 
join ucsf_mdsdb.task_survey_final b 
on a.row_id=b.sys_id and a.source_id=b.sourceinstance 
join ucsf_mdwdb.d_internal_contact emp 
on case when upper(b.state)='requested' then coalesce(CONCAT('INTERNAL_CONTACT~',b.sent_to),'UNSPECIFIED')
ELSE coalesce(CONCAT('INTERNAL_CONTACT~',b.taken_by),'UNSPECIFIED') END=emp.row_id and b.sourceinstance=emp.source_id 
join ucsf_mdwdb.d_internal_organization dept 
on concat('DEPARTMENT~',emp.department_code) = dept.row_id AND emp.source_id = dept.source_id AND dept.current_flag = 'Y' 
where a.taken_by_department_key<>dept.row_key ; 

