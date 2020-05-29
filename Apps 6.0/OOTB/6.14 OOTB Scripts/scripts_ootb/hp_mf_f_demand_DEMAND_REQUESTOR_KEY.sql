SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_demand.created_by' ELSE 'SUCCESS' END as Message
from (select * from  #MDS_TABLE_SCHEMA.hp_kcrt_requests_final) SRC
inner join(select * from #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_proposal_final)SRC1
on SRC.request_id=SRC1.request_id
and SRC.sourceinstance=SRC1.sourceinstance
left join  #DWH_TABLE_SCHEMA.f_demand TRGT
on SRC.REQUEST_ID=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
left join #DWH_TABLE_SCHEMA.d_internal_contact LKP
on concat('INTERNAL_CONTACT~',SRC.created_by) = LKP.row_id
and SRC.sourceinstance=LKP.source_id
where coalesce(LKP.row_key, case when SRC.created_by is null then 0 else -1 end)<>coalesce(TRGT.demand_requestor_key,0)
