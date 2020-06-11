SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_demand.demand_status_src_key' ELSE 'SUCCESS' END as Message
from (select * from   #MDS_TABLE_SCHEMA.hp_kcrt_requests_final) SRC 
inner join(select * from  #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_proposal_final)SRC2
on SRC.request_id=SRC2.request_id
and SRC.sourceinstance=SRC2.sourceinstance
left join #DWH_TABLE_SCHEMA.d_demand TRGT
on SRC.REQUEST_ID=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
left join #DWH_TABLE_SCHEMA.d_portfolio LKP
on SRC2.prop_portfolio_id=LKP.row_id
and SRC.sourceinstance=LKP.source_id
where coalesce(LKP.row_key,case when SRC2.prop_portfolio_id is null then 0 else -1 end)<>coalesce(TRGT.portfolio_key,0) 