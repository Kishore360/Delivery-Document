SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_demand.demand_impact_src_key' ELSE 'SUCCESS' END as Message
 from (select * from  #MDS_TABLE_SCHEMA.hp_kcrt_requests_final) SRC
 inner join(select * from #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_proposal_final)SRC1
on SRC.request_id=SRC1.request_id
and SRC.sourceinstance=SRC1.sourceinstance
left join #DWH_TABLE_SCHEMA.d_demand TRGT
on SRC.REQUEST_ID=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where TRGT.demand_impact_src_key <> 0