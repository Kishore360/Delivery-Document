SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_lov_state_build.soft_deleted_flag' ELSE 'SUCCESS' END as Message
FROM (select * from #MDS_TABLE_SCHEMA.azure_build_final where status is not null and status <> '') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov TRGT 
ON  (CONCAT('STATE~BUILD~',SRC.status)=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id)
WHERE  coalesce(case when SRC.cdctype = 'D' then 'Y' else 'N' end, '')<>coalesce(TRGT.soft_deleted_flag,'')