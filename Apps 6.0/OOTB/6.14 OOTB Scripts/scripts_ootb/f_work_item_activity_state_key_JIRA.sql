SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_activity.state_key' ELSE 'SUCCESS' END as Message
 FROM #STG_TABLE_SCHEMA.issue_activity_temp tmp
 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item_activity TRGT 
 ON (tmp.sys_id = TRGT.row_id 
 AND tmp.sourceinstance=TRGT.source_id)
 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP
 on LKP.row_id = concat('STATUS~WORK_ITEM~', tmp.tostring) and LKP.source_id = tmp.sourceinstance
 
 where tmp.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE') and coalesce(CASE WHEN tmp.field in ('STATUS', 'ITERATION', 'STORY POINTS', 'TIMEORIGINALESTIMATE', 'BUSINESS VALUE') THEN LKP.row_key when tmp.tostring is null then 0 else -1 end) <>coalesce(TRGT.state_key,'');