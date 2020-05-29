SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_lov' ELSE 'SUCCESS' END as Message
 FROM (
select count(1) as cnt from 
(
select 
distinct LSM.class_value as dimension_class
,SRC.value as dimension_code
,SRC.name as dimension_name
,concat(LSM.class_value,'~',SRC.value) as src_rowid
,concat(LSM.class_value,'~',SRC.value) as row_id
,'N' as soft_deleted_flag
,'Y' as current_flag
from #MDS_TABLE_SCHEMA.wf_stage_final SRC
 join <<tenant>>_workdb.lsm_ls_system_variables LSM
on (LSM.table_value=SRC.name and LSM.column_value ='stage' and enable_flag='Y')
 join  #MDS_TABLE_SCHEMA.wf_workflow_version_final SRC2
on (LSM.table_value=SRC2.table
and SRC2.sys_id=SRC.workflow_version)
join (
	select distinct SRC.value as dimension_code
	from #MDS_TABLE_SCHEMA.sys_choice_final SRC
	join <<tenant>>_workdb.lsm_ls_system_variables LSM
	on (LSM.table_value=SRC.name
	and LSM.column_value=SRC.element and enable_flag='Y' )where language='en')bc 
on SRC.value <>bc.dimension_code
	) SRC
left join #DWH_TABLE_SCHEMA.d_lov TRGT
on(SRC.row_id=TRGT.row_id
and TRGT.source_id = 2)
where (SRC.dimension_class<>TRGT.dimension_class
or SRC.dimension_code<>TRGT.dimension_code
or SRC.dimension_name<>TRGT.dimension_name
or SRC.src_rowid<>TRGT.src_rowid
or SRC.soft_deleted_flag<>TRGT.soft_deleted_flag
or SRC.current_flag<>TRGT.current_flag
)
)a