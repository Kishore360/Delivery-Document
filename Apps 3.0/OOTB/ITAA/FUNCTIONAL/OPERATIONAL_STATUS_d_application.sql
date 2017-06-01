select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'OPERATIONAL_STATUS validation failed for d_application' ELSE 'SUCCESS' END as Message
from #MDS_TABLE_SCHEMA.cmdb_ci_appl_final SRC
left join #DWH_TABLE_SCHEMA.d_application TGT
on concat('APPLICATION~', SRC.sys_id) = TGT.row_id
left join #MDS_TABLE_SCHEMA.sys_choice_final sys
on sys.value = SRC.operational_status
and sys.element = 'operational_status' 
and sys.name='cmdb_ci' 
where TGT.OPERATIONAL_STATUS <>sys.label
and row_key not in (0,-1);