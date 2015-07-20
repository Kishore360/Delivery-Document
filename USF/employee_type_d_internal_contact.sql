
select case when count(1) <>0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) <>0 then 'employment_type not set correctly in dwh_d_internal_contact' else 'SUCCESS' end as Message
from <<tenant>>_mdsdb.sys_user_final
where CONCAT( sys_id,sourceinstance,case when u_person_status = 'C' then 'CONTRACTOR' WHEN u_person_status = 'E' THEN 'EMPLOYEE' end)  
not in (select CONCAT(row_id,source_id,employment_type)
from <<tenant>>_mdwdb.dwh_d_internal_contact )
