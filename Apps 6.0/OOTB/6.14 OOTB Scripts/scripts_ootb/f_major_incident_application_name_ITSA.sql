SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_major_incident.application_name' ELSE 'application_name-SUCCESS' END as Message
 from 
(
select 
c_apl.sys_id,
d_apl.row_key as application_key,
d_apl.name as application_name
from #MDS_TABLE_SCHEMA.cmdb_ci_appl_final  c_apl
left join #DWH_TABLE_SCHEMA.d_application d_apl
on coalesce(concat('APPLICATION~',c_apl.sys_id),'UNSPECIFIED')=d_apl.row_id
-- where c_apl.cdctype<>'D'
)SRC

left join #DWH_TABLE_SCHEMA.f_major_incident trgt
on SRC.sys_id=trgt.row_id
where SRC.application_name<>trgt.application_name;