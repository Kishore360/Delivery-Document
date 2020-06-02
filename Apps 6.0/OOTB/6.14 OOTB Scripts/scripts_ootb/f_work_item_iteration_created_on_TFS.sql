SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_iteration.created_on' ELSE 'SUCCESS' END as Message

/*select TRGT.row_id, TRGT.row_key,SRC.system_createddate,
coalesce(convert_tz(SRC.system_createddate, '<<TENANT_SSI_TIME_ZONE>>', '<<DW_TARGET_TIME_ZONE>>'),'') expc,
coalesce(convert_tz(SRC.system_createddate, '<<DW_TARGET_TIME_ZONE>>', '<<TENANT_SSI_TIME_ZONE>>'),'') expc_rvs,
coalesce(TRGT.created_on,'') actl*/
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
 
 where coalesce(convert_tz(SRC.system_createddate, '<<TENANT_SSI_TIME_ZONE>>', '<<DW_TARGET_TIME_ZONE>>'),'')<>coalesce(TRGT.created_on,'')