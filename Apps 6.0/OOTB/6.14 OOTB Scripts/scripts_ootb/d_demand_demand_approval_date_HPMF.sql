SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_demand.demand_fulfillment_within_budget_flag' ELSE 'SUCCESS' END as Message
from (select * from #MDS_TABLE_SCHEMA.hp_kcrt_requests_final where cdctype<>'D') SRC
inner join(select * from #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_proposal_final)SRC1
on SRC.request_id=SRC1.request_id
and SRC.sourceinstance=SRC1.sourceinstance
left join(select max(last_update_date) as max_date,request_id,sourceinstance from #MDS_TABLE_SCHEMA.hp_kcrt_transactions_final
left join(select * from #DWH_TABLE_SCHEMA.d_lov_map)lov
on lov.row_id=CONCAT('DEMAND~STATUS~',new_column_value)
and lov.source_id=hp_kcrt_transactions_final.sourceinstance
where lov.dimension_wh_code=UPPER('APPROVED') and 
UPPER(COLUMN_NAME)='STATUS_ID' and hp_kcrt_transactions_final.cdctype<>'D'
group by request_id,sourceinstance)trans
on SRC1.request_id=trans.request_id
left join #DWH_TABLE_SCHEMA.d_demand TRGT
on SRC.request_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
where COALESCE(CONVERT_TZ(trans.max_date,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>'))
<> COALESCE(TRGT.demand_approval_date,'')

