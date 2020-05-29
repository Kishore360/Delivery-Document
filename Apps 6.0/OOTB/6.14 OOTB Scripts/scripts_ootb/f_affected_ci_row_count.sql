SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_affected_ci.row_count' ELSE 'SUCCESS' END as Message
 from ( select * from
 (select count(*) count_src,sourceinstance from #MDS_TABLE_SCHEMA.task_ci_final SRC where cdctype<>'D') count_src,
 (select count(*) count_trgt,source_id from #DWH_TABLE_SCHEMA.f_affected_ci TRGT where TRGT.soft_deleted_flag<>'Y') count_trgt
 where count_src.count_src <>count_trgt.count_trgt
 and count_src.sourceinstance=count_trgt.source_id
 )SQ ;