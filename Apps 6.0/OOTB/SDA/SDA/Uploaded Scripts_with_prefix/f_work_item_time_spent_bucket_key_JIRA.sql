SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item.time_spent_bucket_key' ELSE 'SUCCESS' END as Message

FROM #MDS_TABLE_SCHEMA.issue_final SRC
LEFT JOIN #MDS_TABLE_SCHEMA.issue_timetracking_final LKP_SRC
ON (SRC.id = LKP_SRC.issueid AND SRC.sourceinstance=LKP_SRC.sourceinstance)
left join #DWH_TABLE_SCHEMA.d_lov lov
on lov.dimension_class = 'WH_TIME~SPENT~BUCKET'
and lov.lower_range_value <= SRC.timespent
and lov.upper_range_value >= SRC.timespent
LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item TRGT 
ON (concat(SRC.id, '')=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id )

where coalesce(lov.row_key, 0)<>coalesce(TRGT.time_spent_bucket_key,'');