SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.changed_by' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.issue_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_work_item TRGT 
 ON (concat(SRC.id, '')=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )

 WHERE COALESCE(SRC.creator_key,'UNSPECIFIED' )<> COALESCE(TRGT.changed_by ,'')
