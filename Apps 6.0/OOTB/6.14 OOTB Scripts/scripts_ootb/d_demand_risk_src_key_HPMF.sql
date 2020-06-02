SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_demand.demand_risk_src_key' ELSE 'SUCCESS' END as Message
from (select * from  #MDS_TABLE_SCHEMA.hp_kcrt_requests_final where cdctype<>'D') SRC
inner join(select * from #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_proposal_final)SRC1
on SRC.request_id=SRC1.request_id
and SRC.sourceinstance=SRC1.sourceinstance
left join #DWH_TABLE_SCHEMA.d_demand TRGT
on SRC.request_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
left join (select * from #DWH_TABLE_SCHEMA.d_lov)LKP
on CONCAT('DEMAND~RISK~',UPPER(SRC1.prop_risk_rating))= LKP.row_id
AND LKP.source_id=SRC.sourceinstance
WHERE COALESCE(LKP.row_key,CASE WHEN SRC1.prop_risk_rating IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.demand_risk_src_key,0)