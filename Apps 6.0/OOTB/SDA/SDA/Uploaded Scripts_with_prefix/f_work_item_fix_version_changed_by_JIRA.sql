


SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_fix_version.changed_by' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.issue_fixversions_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_fix_version TRGT 
 ON (concat(SRC.issueId,'~',SRC.Id)=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )

 WHERE COALESCE(SRC.creator,'' )<> COALESCE(TRGT.changed_by ,'')
