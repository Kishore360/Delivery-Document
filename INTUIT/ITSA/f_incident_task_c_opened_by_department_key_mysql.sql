SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from intuit_mdsdb.u_incident_task_final s
left join intuit_mdwdb.f_incident_task_c t
on s.sys_id=t.row_id and s.sourceinstance = t.source_id
JOIN intuit_mdwdb.d_internal_contact emp 
ON COALESCE(CONCAT('INTERNAL_CONTACT~',s.opened_by),'UNSPECIFIED')=emp.row_id AND s.sourceinstance=emp.source_id
JOIN intuit_mdwdb.d_internal_organization dept 
ON CONCAT('DEPARTMENT~',emp.department_code) = dept.row_id
 AND emp.source_id = dept.source_id
 AND dept.current_flag = 'Y'
where t.opened_by_department_key <> dept.row_key
) temp