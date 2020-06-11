
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_cost_center.changed_on' ELSE 'SUCCESS' END as Message
  FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.us_d_cost_center_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_cost_center TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE SRC.changed_on<> TRGT.changed_on 
