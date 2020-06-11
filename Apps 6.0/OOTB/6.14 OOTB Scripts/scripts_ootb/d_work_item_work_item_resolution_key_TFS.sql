
 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.work_item_resolution_key' ELSE 'SUCCESS' END as Message
 
 from ( select DWI.*  from #MDS_TABLE_SCHEMA.dimworkitem_final DWI join  (select WI.system_id, WI.teamprojectsk, max(WI.System_Rev) rev_no from #MDS_TABLE_SCHEMA.dimworkitem_final WI group by WI.system_id, WI.teamprojectsk) SQ on SQ.System_Id = DWI.System_Id and SQ.TeamProjectSK = DWI.TeamProjectSK and SQ.rev_no = DWI.System_Rev ) SRC

 left join #DWH_TABLE_SCHEMA.d_lov LKP
 on concat('RESOLUTION~WORK_ITEM','~','~','~',upper(SRC.microsoft_vsts_common_resolvedreason))=LKP.src_rowid
 and SRC.sourceinstance=LKP.source_id
 
 left join #DWH_TABLE_SCHEMA.d_work_item TRGT
 ON CONCAT(SRC.system_id, '~', SRC.teamprojectsk)=TRGT.row_id 
 and SRC.sourceinstance=TRGT.source_id
 
 where TRGT.row_key not in (0,-1) and
coalesce(LKP.row_key, case when SRC.microsoft_vsts_common_resolvedreason is null then 0 else -1 end,'')<>coalesce(TRGT.work_item_resolution_key,'')