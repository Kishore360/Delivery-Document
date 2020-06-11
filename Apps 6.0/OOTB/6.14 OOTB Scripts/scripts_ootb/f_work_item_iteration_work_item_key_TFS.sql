SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_iteration.work_item_key' ELSE 'SUCCESS' END as Message
 
/*select TRGT.row_id, TRGT.row_key,
coalesce(LKP.row_key, case when concat(SRC.TeamProjectSK, '~', SRC.System_Id) is null then 0 else -1 end) expc, coalesce(TRGT.work_item_key,'') actl*/
FROM (
 select SRCD.*
 from #MDS_TABLE_SCHEMA.dimworkitem_final SRCD
 join (select dwi.System_Id, dwi.TeamProjectSK, dwi.IterationSK, min(dwi.System_Rev) sys_rev
 from #MDS_TABLE_SCHEMA.dimworkitem_final dwi
 group by dwi.System_Id, dwi.TeamProjectSK, dwi.IterationSK) SQ
 on SQ.System_Id = SRCD.System_Id and SQ.TeamProjectSK = SRCD.TeamProjectSK and SQ.IterationSK = SRCD.IterationSK and SQ.sys_rev = SRCD.System_Rev
 ) SRC
 
left join #DWH_TABLE_SCHEMA.f_work_item_iteration TRGT
 ON CONCAT(SRC.System_Id, '~', SRC.TeamProjectSK, '~', SRC.IterationSK )=TRGT.row_id 
 and SRC.sourceinstance=TRGT.source_id
 
left join #DWH_TABLE_SCHEMA.d_work_item LKP
 ON concat(SRC.System_Id, '~', SRC.TeamProjectSK) = LKP.row_id
 and SRC.sourceinstance = LKP.source_id
 
 where coalesce(LKP.row_key, case when concat(SRC.TeamProjectSK, '~', SRC.System_Id) is null then 0 else -1 end)<>coalesce(TRGT.work_item_key,'')