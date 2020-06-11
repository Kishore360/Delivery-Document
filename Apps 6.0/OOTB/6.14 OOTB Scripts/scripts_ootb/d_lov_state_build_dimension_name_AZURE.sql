SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_lov_state_build.dimension_name' ELSE 'SUCCESS' END as Message
FROM (select * from #MDS_TABLE_SCHEMA.azure_build_final where status is not null and status <> ''
group by status,sourceinstance) SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov TRGT 
ON  CONCAT('STATE~BUILD~',SRC.status)=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id
WHERE  COALESCE(SRC.status,'')<>COALESCE(TRGT.dimension_name,'') 