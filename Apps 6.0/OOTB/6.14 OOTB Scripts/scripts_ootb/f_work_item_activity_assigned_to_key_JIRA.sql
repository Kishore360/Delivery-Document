SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_activity.assigned_to_key' ELSE 'SUCCESS' END as Message
 FROM #STG_TABLE_SCHEMA.issue_activity_temp tmp
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (tmp.sys_id = TRGT.row_id 
 AND tmp.sourceinstance=TRGT.source_id)
 
 /*
 LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact DCI
 ON (concat('INTERNAL_CONTACT~', tmp.tostring) = DCI.row_id 
 AND tmp.sourceinstance=DCI.source_id)
 
 -- case WHEN tmp.field = 'assignee' THEN DCI.row_key ELSE NULL END, case when tmp.tostring is null then 0 else -1 end
 */
 
WHERE tmp.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE') and coalesce(CASE WHEN tmp.field = 'assignee' THEN tmp.to ELSE NULL END, case when tmp.to is null then 0 else -1 end) <> COALESCE(TRGT.assigned_to_key ,'');