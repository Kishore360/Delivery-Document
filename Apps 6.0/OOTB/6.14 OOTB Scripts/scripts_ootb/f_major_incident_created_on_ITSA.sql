SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_major_incident.created_on' ELSE 'created_on-SUCCESS' END as Message
 from 
(
select 
c_apl.sys_id,
CONVERT_TZ (c_apl.sys_created_on,'@#TENANT_SSI_TIME_ZONE@#','@#DW_TARGET_TIME_ZONE@#') as created_on
from #MDS_TABLE_SCHEMA.cmdb_ci_appl_final  c_apl
-- where c_apl.cdctype<>'D'
)SRC

left join #DWH_TABLE_SCHEMA.f_major_incident trgt
on SRC.sys_id=trgt.row_id
where SRC.created_on<>trgt.created_on;
