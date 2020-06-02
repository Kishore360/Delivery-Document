SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_demand.demand_project_status_count' ELSE 'SUCCESS' END as Message
from (select 
case when reference_code='_PFM_PROPOSAL' then a.sourceinstance when reference_code='_PROJECT_DETAILS' then d.sourceinstance end as sourceinstance,
case when reference_code='_PFM_PROPOSAL' then a.request_id when reference_code='_PROJECT_DETAILS' then d.request_id end as new_demand,
sum(case when t.reference_code='_PFM_PROPOSAL' AND column_name='STATUS_ID' then 1 ELSE 0 END) AS STATUS_COUNT,
sum(case when t.reference_code='_PROJECT_DETAILS' AND column_name='STATUS_ID' then 1 ELSE 0 END) AS PRJ_STATUS_COUNT
from #MDS_TABLE_SCHEMA.hp_kcrt_transactions_final a
inner join #MDS_TABLE_SCHEMA.hp_kcrt_requests_final b on b.request_id=a.request_id
inner join #MDS_TABLE_SCHEMA.hp_kcrt_request_types_nls_final t on t.request_type_id=b.request_type_id
left join #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final c on a.request_id=c.request_id
left join #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_proposal_final d on d.prop_project_id= c.prj_project_id
where reference_code in ('_PFM_PROPOSAL') or d.request_id is not null
GROUP BY 1,2)SRC
left join #DWH_TABLE_SCHEMA.d_demand TRGT
on TRGT.row_id=SRC.new_demand
and TRGT.source_id=SRC.sourceinstance
where coalesce(SRC.PRJ_STATUS_COUNT)<>coalesce(TRGT.demand_project_status_count,'');