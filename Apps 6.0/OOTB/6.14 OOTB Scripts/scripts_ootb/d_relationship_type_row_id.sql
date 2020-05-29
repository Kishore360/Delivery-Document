select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_relationship_type.row_id' ELSE 'SUCCESS' END as Message
 from (SELECT * FROM #MDS_TABLE_SCHEMA.cmdb_rel_type_final WHERE CDCTYPE<>'D') SRC
left join (SELECT * FROM #DWH_TABLE_SCHEMA.d_relationship_type 
) TRGT 
 ON SRC.sys_id =TRGT.row_id 
 AND SRC.sourceinstance = TRGT.source_id  
 where coalesce(SRC.sys_id,'UNSPECIFIED') <> coalesce(TRGT.row_id ,'UNSPECIFIED')
