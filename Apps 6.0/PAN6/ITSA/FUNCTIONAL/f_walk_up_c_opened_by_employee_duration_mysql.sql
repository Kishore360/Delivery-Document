SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_walk_up_c.opened_by_employee_duration' ELSE 'SUCCESS' END as Message
 FROM 
 (select count(1) as cnt 
 
from (select * from pan6_mdsdb.u_walk_up_final where cdctype<>'D') SRC 
 
left join pan6_mdwdb.f_walk_up_c f on SRC.sys_id=f.row_id and SRC.sourceinstance=f.source_id
 
JOIN pan6_mdwdb.d_internal_contact a ON a.row_key = f.opened_by_key 

where  COALESCE(TIMESTAMPDIFF(day,a.employee_start_date_c,f.created_on),0) <> f.opened_by_employee_duration) temp;