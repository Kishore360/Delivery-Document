SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item.story_points' ELSE 'SUCCESS' END as Message
FROM #STG_TABLE_SCHEMA.workitem_temp_azure SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item TRGT 
 ON (concat(SRC.__numerify__primary_key, '')=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id)
WHERE coalesce(CASE WHEN ASCII(SRC.msvsts_scheduling_storypoints)>=49 AND ASCII(SRC.msvsts_scheduling_storypoints)<=57 THEN CAST(SRC.msvsts_scheduling_storypoints AS DECIMAL(28,10)) ELSE NULL END, '') <> coalesce(TRGT.story_points,'');