SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.defect_detected_build_run_key' ELSE 'SUCCESS' END as Message
 
 from #MDS_TABLE_SCHEMA.issue_final SRC
 
 /*left join #DWH_TABLE_SCHEMA.d_build_run LKP
 on coalesce(SRC.msvsts_build_foundin,'UNSPECIFIED')=LKP.row_id
 and SRC.sourceinstance=LKP.source_id*/
 
 left join #DWH_TABLE_SCHEMA.d_work_item TRGT
 on concat(SRC.id, '')=TRGT.row_id
 and SRC.sourceinstance=TRGT.source_id
 
 where TRGT.soft_deleted_flag <> 'Y' and
 -- coalesce(LKP.row_key,case when SRC.msvsts_build_foundin is null then 0 else -1 end )<>coalesce(TRGT.defect_detected_build_run_key,'');
 coalesce(null, 0)<>coalesce(TRGT.defect_detected_build_run_key,'');