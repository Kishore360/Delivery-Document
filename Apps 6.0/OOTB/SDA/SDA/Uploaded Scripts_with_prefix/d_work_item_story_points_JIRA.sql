SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.story_points' ELSE 'SUCCESS' END as Message
FROM #MDS_TABLE_SCHEMA.issue_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_work_item TRGT 
 ON (concat(SRC.id, '')=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id)
WHERE coalesce(CASE WHEN ASCII(SRC.story_points)>=49 AND ASCII(SRC.story_points)<=57 THEN CAST(SRC.story_points AS DECIMAL(28,10)) ELSE NULL END, '') <> coalesce(TRGT.story_points,'');