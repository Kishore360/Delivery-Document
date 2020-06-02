SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_lov_severity_work_item.src_rowid' ELSE 'SUCCESS' END as Message
FROM (select * from #STG_TABLE_SCHEMA.workitem_temp_azure where msvsts_common_severity is not null 
and msvsts_common_severity <> ''
group by msvsts_common_severity,sourceinstance) SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov TRGT 
ON  ((CONCAT('SEVERITY~WORK_ITEM~',(SRC.msvsts_common_severity)))=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id)
WHERE COALESCE(CONCAT('SEVERITY~WORK_ITEM~',(SRC.msvsts_common_severity)),'')<>COALESCE(TRGT.src_rowid,'')