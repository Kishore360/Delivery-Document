SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_resource_plan.group_resource_key' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.resource_plan_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_resource_plan TRGT 
 ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
 LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_organization D
 on (D.row_id  = CONCAT('GROUP~',SRC.group_resource) and D.source_id  = SRC.sourceinstance)
 WHERE COALESCE(D.row_key,case when SRC.end_date is null then '' else '' end)<> COALESCE(TRGT.group_resource_key ,'');