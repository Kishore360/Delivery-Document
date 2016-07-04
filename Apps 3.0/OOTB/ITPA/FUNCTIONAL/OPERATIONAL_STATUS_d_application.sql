select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'OPERATIONAL_STATUS validation failed for d_application' ELSE 'SUCCESS' END as Message
from <<tenant>>_mdsdb.cmdb_ci_appl_final SRC
left join <<tenant>>_mdwdb.d_application TGT
on concat('APPLICATION~', SRC.sys_id) = TGT.row_id
left join <<tenant>>_mdsdb.sys_choice_final sys
on sys.value = SRC.operational_status
and sys.element = 'operational_status' 
and sys.name='cmdb_ci' 
where TGT.OPERATIONAL_STATUS <>sys.label
and row_key not in (0,-1)
and sys.language = 'en'
and sys.inactive = 0;
