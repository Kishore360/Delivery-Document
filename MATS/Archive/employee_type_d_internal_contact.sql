

select case when count(1) <>0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) <>0 then 'employment_type not set correctly in d_internal_contact' else 'SUCCESS' end as Message
from #MDS_TABLE_SCHEMA.sys_user_final
where CONVERT(CONCAT( sys_id,sourceinstance,case when u_person_status = 'C' then 'CONTRACTOR' WHEN u_person_status = 'E' THEN 'EMPLOYEE' end) using utf8 ) 
not in (select CONVERT(CONCAT(row_id,source_id,employment_type)using utf8)
from #TABLE_SCHEMA.d_internal_contact )
