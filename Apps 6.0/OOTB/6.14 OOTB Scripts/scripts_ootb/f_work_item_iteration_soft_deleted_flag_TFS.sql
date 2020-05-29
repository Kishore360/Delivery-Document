SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_iteration.soft_deleted_flag' ELSE 'SUCCESS' END as Message

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
 
 where coalesce(case when SRC.System_IsDeleted = 1 then 'Y' else 'N' end,'N')<>coalesce(TRGT.soft_deleted_flag,'')