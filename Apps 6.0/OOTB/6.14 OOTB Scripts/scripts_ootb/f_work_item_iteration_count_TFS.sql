SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.iteration_count' ELSE 'SUCCESS' END as Message
 
 FROM (
 select SQ.system_id, SQ.teamprojectsk, SQ.sourceinstance, count(distinct SQ.IterationSK) iteration_count
 FROM (
 select SRCD1.*
 from #MDS_TABLE_SCHEMA.dimworkitem_final SRCD
 LEFT JOIN #MDS_TABLE_SCHEMA.dimworkitem_final SRCD1
 ON SRCD.system_id=SRCD1.system_id AND SRCD1.teamprojectsk=SRCD.teamprojectsk
 ) SQ
 group by SQ.system_id, SQ.teamprojectsk, SQ.sourceinstance
 ) SRC

 left join #DWH_TABLE_SCHEMA.f_work_item TRGT
 ON CONCAT(SRC.system_id, '~', SRC.teamprojectsk)=TRGT.row_id 
 and SRC.sourceinstance=TRGT.source_id
 
 where TRGT.row_key not in (0,-1) and TRGT.soft_deleted_flag = 'N' and
coalesce(SRC.iteration_count,0)<>coalesce(TRGT.iteration_count,'')