SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_project_component.soft_deleted_flag' ELSE 'SUCCESS' END as Message
 from 

(select SRC.id,SRC.sourceinstance,'N' as soft_deleted_flag from 
#MDS_TABLE_SCHEMA.project_components_final SRC
union all
select DEL.id,DEL.sourceinstance,'Y' as soft_deleted_flag from 
 #MDS_TABLE_SCHEMA.project_components_delete DEL
)SRC

left join #DWH_TABLE_SCHEMA.d_project_component TRGT
on concat(SRC.id, '')=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where coalesce(SRC.soft_deleted_flag,'')<>coalesce(TRGT.soft_deleted_flag,'')

