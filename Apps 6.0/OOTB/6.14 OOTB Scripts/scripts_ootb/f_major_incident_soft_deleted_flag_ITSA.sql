SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_major_incident.soft_deleted_flag' ELSE 'soft_deleted_flag-SUCCESS' END as Message
 from 
(
select 
c_apl.sys_id,
CASE WHEN cdctype = 'D' THEN 'Y' ELSE 'N' END as soft_deleted_flag from #MDS_TABLE_SCHEMA.cmdb_ci_appl_final  c_apl
-- where c_apl.cdctype<>'D'
)SRC

left join #DWH_TABLE_SCHEMA.f_major_incident trgt
on SRC.sys_id=trgt.row_id
where SRC.soft_deleted_flag<>trgt.soft_deleted_flag;