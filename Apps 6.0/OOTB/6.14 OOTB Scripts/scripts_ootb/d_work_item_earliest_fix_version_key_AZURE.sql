SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.earliest_fixed_version_key' ELSE 'SUCCESS' END as Message
FROM #STG_TABLE_SCHEMA.workitem_temp_azure SRC
left join #DWH_TABLE_SCHEMA.d_work_item TRGT
on concat(SRC.__numerify__primary_key, '')=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id

where coalesce(null, 0)<>coalesce(TRGT.earliest_fixed_version_key,'');