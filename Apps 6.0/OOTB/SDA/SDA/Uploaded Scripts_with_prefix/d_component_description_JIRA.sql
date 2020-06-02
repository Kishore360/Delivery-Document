SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_component.description' ELSE 'SUCCESS' END as Message
 from #MDS_TABLE_SCHEMA.project_components_final SRC
  
 left join #DWH_TABLE_SCHEMA.d_component TRGT
 on concat(SRC.id, '')=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
 
 where coalesce(SRC.description,'')<>coalesce(TRGT.description,'')