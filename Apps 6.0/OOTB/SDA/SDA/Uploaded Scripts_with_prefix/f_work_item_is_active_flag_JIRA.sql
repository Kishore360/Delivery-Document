SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item.is_active_flag' ELSE 'SUCCESS' END as Message
FROM #MDS_TABLE_SCHEMA.issue_final SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item TRGT 
 ON (concat(SRC.id, '')=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id)
LEFT JOIN #MDS_TABLE_SCHEMA.status st on st.id = SRC.status
WHERE coalesce(case when lower(s.name) <> 'closed' then 'Y' else 'N' end, '') <> coalesce(TRGT.is_active_flag,'');