SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.production_issue_flag_c' ELSE 'SUCCESS' END as Message
FROM #MDS_TABLE_SCHEMA.issue_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_work_item TRGT 
 ON (concat(SRC.id, '')=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN (
 select LKP.work_item_key_c, count(LKP.row_key) inc_count
 from #DWH_TABLE_SCHEMA.d_incident LKP
 group by LKP.work_item_key_c) INC
 ON INC.work_item_key_c = TRGT.row_key
LEFT JOIN (
 select LKP.work_item_key_c, count(LKP.row_key) sreq_count
 from #DWH_TABLE_SCHEMA.d_service_request_c LKP
 group by LKP.work_item_key_c) REQ
 ON REQ.work_item_key_c = TRGT.row_key
 WHERE COALESCE(case when coalesce(INC.inc_count,0)> 0 or coalesce(REQ.sreq_count,0)> 0 then 'Y' else 'N' end, 'N') <> COALESCE(TRGT.production_issue_flag_c ,'');