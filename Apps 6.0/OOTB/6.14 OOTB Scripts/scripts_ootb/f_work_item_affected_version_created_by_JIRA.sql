SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_affected_version.created_by' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.issue_affectedversions_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_affected_version TRGT 
 ON (concat(SRC.issueId,'~',SRC.Id)=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )

 WHERE COALESCE(SRC.creator,'' )<> COALESCE(TRGT.created_by ,'')
