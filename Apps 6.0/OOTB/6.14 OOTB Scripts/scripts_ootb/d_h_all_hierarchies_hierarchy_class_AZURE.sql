SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'WORK_ITEM hierarchy class not present in d_h_all_hierarchies' ELSE 'SUCCESS' END as Message
 FROM #DWH_TABLE_SCHEMA.d_h_all_hierarchies TRGT 
 WHERE TRGT.row_id like '%WORK_ITEM%' and 
 COALESCE(TRGT.hierarchy_class, '')<> 'WORK_ITEM';