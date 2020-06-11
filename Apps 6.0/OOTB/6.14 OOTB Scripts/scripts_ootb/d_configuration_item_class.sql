SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_configuration_item.class' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.cmdb_ci_final WHERE CDCTYPE<>'D') SRC 
 left join ( SELECT * FROM #MDS_TABLE_SCHEMA.sys_db_object_final WHERE CDCTYPE<>'D') SRC2
 on SRC.sys_class_name = SRC2.name 
and SRC.sourceinstance = SRC2.sourceinstance 
left join #MDS_TABLE_SCHEMA.sys_db_object_final SRC4
                    ON SRC.sys_class_name = SRC4.name 
                    and SRC.sourceinstance = SRC4.sourceinstance 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_configuration_item TRGT 
 ON (SRC.sys_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE(SRC4.label,'')<> COALESCE(TRGT.class,'')