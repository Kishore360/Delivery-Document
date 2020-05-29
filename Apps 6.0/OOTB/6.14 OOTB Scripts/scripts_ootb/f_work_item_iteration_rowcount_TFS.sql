 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_work_item_iteration' ELSE 'SUCCESS' END as Message
 from (
 select *
 from
 (select count(*) count_src 
 from  (
 select SRCD.*
 from #MDS_TABLE_SCHEMA.dimworkitem_final SRCD
 join (select dwi.System_Id, dwi.TeamProjectSK, dwi.IterationSK, min(dwi.System_Rev) sys_rev
 from #MDS_TABLE_SCHEMA.dimworkitem_final dwi
 group by dwi.System_Id, dwi.TeamProjectSK, dwi.IterationSK) SQ
 on SQ.System_Id = SRCD.System_Id and SQ.TeamProjectSK = SRCD.TeamProjectSK and SQ.IterationSK = SRCD.IterationSK and SQ.sys_rev = SRCD.System_Rev
 ) SRC) count_src,
 
 (select count(*) count_trgt from #DWH_TABLE_SCHEMA.f_work_item_iteration TRGT  
join (select distinct source_id from #DWH_TABLE_SCHEMA.d_o_data_freshness where sourcename = 'TFS_DWS') ODF on ODF.source_id = TRGT.source_id
where TRGT.soft_deleted_flag = 'N' and TRGT.row_key not in (0,-1)) count_trgt
  where count_src.count_src <>count_trgt.count_trgt
 )SQ