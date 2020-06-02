SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item.prod_issue_count' ELSE 'SUCCESS' END as Message
 FROM #MDS_TABLE_SCHEMA.issue_final SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.f_work_item TRGT 
 ON (concat(SRC.id, '')=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 LEFT JOIN (
 select LKP.work_item_key_c, count(LKP.row_key) inc_count
 from #DWH_TABLE_SCHEMA.d_incident LKP
 group by LKP.work_item_key_c) INC
 ON INC.work_item_key_c = TRGT.work_item_key
 WHERE COALESCE(INC.inc_count,0)<> COALESCE(TRGT.prod_issue_count ,'');