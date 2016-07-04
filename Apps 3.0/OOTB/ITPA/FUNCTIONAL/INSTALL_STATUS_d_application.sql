select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'INSTALL_STATUS validation failed for d_application' ELSE 'SUCCESS' END as Message
from <<tenant>>_mdsdb.cmdb_ci_appl_final SRC
left join <<tenant>>_mdwdb.d_application TGT
on concat('APPLICATION~', SRC.sys_id) = TGT.row_id
left join <<tenant>>_mdsdb.sys_choice_final sys
on sys.value = SRC.install_status
and sys.element = 'install_status' 
and sys.name='cmdb_ci' 
where TGT.INSTALL_STATUS <>sys.label
and TGT.row_key not in (0,-1)
and sys.language = 'en'
and sys.inactive = 0
