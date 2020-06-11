SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for f_demand_activity.row_count' ELSE 'SUCCESS' END as Message
from (select (SRC.trans_count+(zero_count.demand_count*2)) ,count_trgt.count_trgt from
(select count(*) as trans_count,a.request_id as proposal_id, c.request_id as project_req_id,c.prj_project_id as project_id,
case when reference_code='_PFM_PROPOSAL' then a.request_id when reference_code='_PROJECT_DETAILS' then d.request_id end as new_demand,
a.* from #MDS_TABLE_SCHEMA.hp_kcrt_transactions_final a
join #MDS_TABLE_SCHEMA.hp_kcrt_requests_final b on b.request_id=a.request_id
join #MDS_TABLE_SCHEMA.hp_kcrt_request_types_nls_final t on t.request_type_id=b.request_type_id
left join #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final c on a.request_id=c.request_id
left join #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_proposal_final d on d.prop_project_id= c.prj_project_id
where reference_code in ('_PFM_PROPOSAL') or d.request_id is not null) SRC,
(select count(*) as demand_count,source_id as src_id from #DWH_TABLE_SCHEMA.d_demand where soft_deleted_flag='N' and row_key not in (-1,0))zero_count,
(select count(*) as count_trgt,source_id from  #DWH_TABLE_SCHEMA.f_demand_activity where soft_deleted_flag='N')count_trgt
where (SRC.trans_count+(zero_count.demand_count*2)) <> count_trgt.count_trgt
)SQ;