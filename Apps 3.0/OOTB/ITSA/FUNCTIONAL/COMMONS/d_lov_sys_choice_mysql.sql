SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_lov' ELSE 'SUCCESS' END as Message
 FROM 
(select distinct LSM.class_value as dimension_class
,SRC.value as dimension_code
,SRC.label as dimension_name
,concat(LSM.class_value,'~~~',SRC.value) as src_rowid
,concat(LSM.class_value,'~~~',SRC.value) as row_id
,'N' as soft_deleted_flag
,'Y' as current_flag

from
 <<tenant>>_mdsdb.sys_choice_final SRC
join <<tenant>>_workdb.lsm_ls_system_variables LSM
on (LSM.table_value=SRC.name
and LSM.column_value=SRC.element )
where language='en' and enable_flag='Y' and inactive=0 and sys_created_on= (select max(sys_created_on) from <<tenant>>_mdsdb.sys_choice_final) 

) SRC
left join <<tenant>>_mdwdb.d_lov TRGT
on(SRC.row_id=TRGT.row_id
and TRGT.source_id = 2)
where SRC.dimension_class<>TRGT.dimension_class
or SRC.dimension_code<>TRGT.dimension_code
or SRC.dimension_name<>TRGT.dimension_name
or UPPER(SRC.src_rowid)<>TRGT.src_rowid
or SRC.soft_deleted_flag<>TRGT.soft_deleted_flag
or SRC.current_flag<>TRGT.current_flag

