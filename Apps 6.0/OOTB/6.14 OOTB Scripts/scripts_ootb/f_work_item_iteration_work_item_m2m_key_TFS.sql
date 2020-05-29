SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_work_item_iteration.work_item_m2m_key' ELSE 'SUCCESS' END as Message
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
 
left join #DWH_TABLE_SCHEMA.d_calendar_date LKP
 ON date_format(convert_tz(greatest(SRC.microsoft_vsts_common_closeddate,SRC.microsoft_vsts_common_resolveddate,SRC.system_createddate),'<<TENANT_SSI_TIME_ZONE>>', '<<DW_TARGET_TIME_ZONE>>'),'%Y%m%d')  = LKP.row_id
 
 where coalesce(LKP.row_key, null)<>coalesce(TRGT.work_item_m2m_key,'')