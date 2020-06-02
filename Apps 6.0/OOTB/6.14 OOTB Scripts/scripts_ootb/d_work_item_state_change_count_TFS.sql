SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.state_change_count' ELSE 'SUCCESS' END as Message
 
FROM (
 select SRC.system_id, SRC.teamprojectsk, SRC.sourceinstance, sum(case when SRC_NEXT.System_State is not null and SRC_NEXT.System_State <> SRC.System_State then 1 else 0 end) state_chage_count
 FROM #MDS_TABLE_SCHEMA.dimworkitem_final SRC
 LEFT JOIN #MDS_TABLE_SCHEMA.dimworkitem_final SRC_NEXT 
 on SRC.system_id = SRC_NEXT.system_id and SRC.teamprojectsk = SRC_NEXT.teamprojectsk and SRC.System_Rev + 1 = SRC_NEXT.System_Rev
 group by SRC.system_id, SRC.teamprojectsk, SRC.sourceinstance
 ) SRC
 
left join #DWH_TABLE_SCHEMA.d_work_item TRGT
 ON CONCAT(SRC.system_id, '~', SRC.teamprojectsk)=TRGT.row_id 
 and SRC.sourceinstance=TRGT.source_id
 
 where TRGT.row_key not in (0,-1) and TRGT.soft_deleted_flag = 'N' and
coalesce(SRC.state_chage_count,0)<>coalesce(TRGT.state_change_count,'')