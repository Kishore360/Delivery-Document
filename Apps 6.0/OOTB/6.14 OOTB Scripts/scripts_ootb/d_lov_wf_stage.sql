SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_lov' ELSE 'SUCCESS' END as Message
 FROM 
/* 
select SRC.dimension_class,TRGT.dimension_class
, SRC.dimension_code,TRGT.dimension_code
, SRC.dimension_name,TRGT.dimension_name
, SRC.src_rowid,TRGT.src_rowid
, SRC.dimension_type , TRGT.dimension_type
, SRC.dimension_subtype , TRGT.dimension_subtype
, SRC.soft_deleted_flag,TRGT.soft_deleted_flag
, SRC.current_flag,TRGT.current_flag  from */
(
select distinct LSM.class_value as dimension_class
,SRC.value as dimension_code
,SRC.name as dimension_name
,concat(LSM.class_value,'~',SRC.value) as src_rowid
,concat(LSM.class_value,'~',SRC.value) as row_id
,'N' as soft_deleted_flag
,'Y' as current_flag
,LSM.`type` as dimension_type
,LSM.`sub_type` as dimension_subtype
from ( SELECT * FROM #MDS_TABLE_SCHEMA.wf_stage_final WHERE CDCTYPE<>'D') SRC
join #STG_TABLE_SCHEMA.lsm_ls_system_variables LSM
on (LSM.column_value ='stage')
join  ( SELECT * FROM #MDS_TABLE_SCHEMA.wf_workflow_version_final WHERE CDCTYPE<>'D') SRC2
on (LSM.table_value=SRC2.`table`
and SRC2.sys_id=SRC.workflow_version)
where SRC.value not in (
	select SRC.value as dimension_code
	from ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_choice_final WHERE CDCTYPE<>'D') SRC
	join #STG_TABLE_SCHEMA.lsm_ls_system_variables LSM
	on (LSM.table_value=SRC.name
	and LSM.column_value=SRC.element)
	where language='en'
	)
) SRC
left join #DWH_TABLE_SCHEMA.d_lov TRGT
on(SRC.row_id=TRGT.row_id
and TRGT.source_id = 2)
where (SRC.dimension_class<>TRGT.dimension_class
or SRC.dimension_code<>TRGT.dimension_code
or SRC.dimension_name<>TRGT.dimension_name
or SRC.src_rowid<>TRGT.src_rowid
or SRC.dimension_type <> TRGT.dimension_type
or SRC.dimension_subtype <> TRGT.dimension_subtype
or SRC.soft_deleted_flag<>TRGT.soft_deleted_flag
or SRC.current_flag<>TRGT.current_flag
)