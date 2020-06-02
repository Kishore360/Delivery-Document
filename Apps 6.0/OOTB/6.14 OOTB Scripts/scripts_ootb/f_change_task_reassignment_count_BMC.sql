SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_change_task.reassignment_count' ELSE 'SUCCESS' END as Message
from
(select count(1) as reassignment_count_expected ,TGT.row_id,TGTF.reassignment_count
FROM  #DWH_TABLE_SCHEMA.d_change_task TGT
left join  #DWH_TABLE_SCHEMA.f_change_task TGTF
on(TGT.row_key=TGTF.change_task_key)
left join  #DWH_TABLE_SCHEMA.d_lov_map LM
on(LM.src_key=TGTF.state_src_key)
left join  #MDS_TABLE_SCHEMA.hlx_tms_audit_log_final SRC
on (TGT.row_id = SRC.original_request_id 
and TGT.source_id = SRC.sourceinstance)
where   upper(fields_changed) like '%ASSIGNEE%'  
and case when LM.dimension_wh_code<>'OPEN' then TGT.closed_on else now() end > SRC.create_date 
group by TGT.row_id,TGTF.reassignment_count) S
where reassignment_count_expected <> reassignment_count


