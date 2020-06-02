SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item.original_time_bucket_key' ELSE 'SUCCESS' END as Message

FROM #STG_TABLE_SCHEMA.workitem_temp_azure SRC

left join #DWH_TABLE_SCHEMA.d_lov lov
on lov.dimension_class = 'WH_ORIGINAL~TIME~BUCKET'
and lov.lower_range_value <= SRC.msvsts_scheduling_originalestimate
and lov.upper_range_value >= SRC.msvsts_scheduling_originalestimate
LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item TRGT 
ON (concat(SRC.__numerify__primary_key, '')=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id )

where coalesce(lov.row_key, 0)<>coalesce(TRGT.original_time_bucket_key,'');