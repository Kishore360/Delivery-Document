SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_non_acd_changed_by' ELSE 'SUCCESS' END as Message
FROM (
select TRGT.CHANGED_BY from 
 #MDS_TABLE_SCHEMA.new_call_final SRC
  LEFT JOIN #DWH_TABLE_SCHEMA.f_agent_non_acd TRGT
 ON (TRGT.row_id= SRC.sys_id
	AND SRC.sourceinstance =TRGT.source_id )
WHERE coalesce(SRC.sys_updated_by,'' )<> coalesce(TRGT.CHANGED_BY,'')
union 
SELECT TRGT.CHANGED_BY
FROM #MDS_TABLE_SCHEMA.incident_final SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.f_agent_non_acd TRGT 
ON (SRC.sys_id = TRGT.row_id
AND SRC.sourceinstance =TRGT.source_id )
WHERE
coalesce(SRC.sys_updated_by,'') <> coalesce(TRGT.CHANGED_BY,''))CB
