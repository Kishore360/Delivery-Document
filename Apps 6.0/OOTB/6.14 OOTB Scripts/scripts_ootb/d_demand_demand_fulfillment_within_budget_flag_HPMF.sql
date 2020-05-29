SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_demand.demand_fulfillment_within_budget_flag' ELSE 'SUCCESS' END as Message
from (select * from  #MDS_TABLE_SCHEMA.hp_kcrt_requests_final where cdctype<>'D') SRC
inner join(select * from #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_proposal_final)SRC1
on SRC.request_id=SRC1.request_id
and SRC.sourceinstance=SRC1.sourceinstance
left join #DWH_TABLE_SCHEMA.d_demand TRGT
on SRC.request_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
left join(select * from #DWH_TABLE_SCHEMA.d_project)d_proj
on SRC1.prop_project_id=d_proj.row_id
left join(select * from #DWH_TABLE_SCHEMA.f_demand)TRGT1
on TRGT.demand_id=TRGT1.row_id
left join (select * from #DWH_TABLE_SCHEMA.d_lov_map)LKP
on d_proj.project_state_src_key=LKP.src_key
AND LKP.source_id=SRC.sourceinstance
where (CASE WHEN LKP.dimension_wh_code IN ('CLOSED') and TRGT1.project_actual_doc_cost<=TRGT1.planned_doc_cost then 'Y'
else 'N' end)<>COALESCE(TRGT.fulfilled_within_budget_flag,'')
