SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item.business_value' ELSE 'SUCCESS' END as Message
FROM #MDS_TABLE_SCHEMA.issue_final SRC
join #MDS_TABLE_SCHEMA.issue_ext_final EXT
on SRC.id = EXT.record_id and SRC.sourceinstance = EXT.sourceinstance
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item TRGT 
 ON (concat(SRC.id, '')=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id)

WHERE coalesce(case when EXT.customfield_10005 < 0 then null else round(EXT.customfield_10005,10) end, '') <> coalesce(TRGT.business_value,'');