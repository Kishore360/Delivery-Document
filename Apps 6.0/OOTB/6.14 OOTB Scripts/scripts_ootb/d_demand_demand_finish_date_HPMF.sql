SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_demand.row_id' ELSE 'SUCCESS' END as Message
from (select * from  #MDS_TABLE_SCHEMA.hp_kcrt_requests_final) SRC
inner join(select * from #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_proposal_final)SRC1
on SRC.request_id=SRC1.request_id
and SRC.sourceinstance=SRC1.sourceinstance
left join(select * from #MDS_TABLE_SCHEMA.hp_ppm_fiscal_periods_nls_final)SRC2
on SRC1.PROP_PLAN_FINISH_PERIOD_ID = SRC2.FISCAL_PERIOD_ID
and SRC1.sourceinstance=SRC2.sourceinstance
left join #DWH_TABLE_SCHEMA.d_demand TRGT
on SRC.REQUEST_ID=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
WHERE COALESCE(convert_tz(SRC2.end_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'),'') <> coalesce(TRGT.demand_finish_date,'')
