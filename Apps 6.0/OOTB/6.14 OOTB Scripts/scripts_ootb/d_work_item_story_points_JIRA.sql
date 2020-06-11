SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.story_points' ELSE 'SUCCESS' END as Message
FROM #MDS_TABLE_SCHEMA.issue_final SRC 
join #MDS_TABLE_SCHEMA.issue_ext_final EXT
on SRC.id = EXT.record_id and SRC.sourceinstance = EXT.sourceinstance
 LEFT JOIN #DWH_TABLE_SCHEMA.d_work_item TRGT 
 ON (concat(SRC.id, '')=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id)
WHERE coalesce(CASE WHEN ASCII(EXT.customfield_10004)>=49 AND ASCII(EXT.customfield_10004)<=57 THEN CAST(EXT.customfield_10004 AS DECIMAL(28,10)) ELSE NULL END, '') <> coalesce(TRGT.story_points,'');