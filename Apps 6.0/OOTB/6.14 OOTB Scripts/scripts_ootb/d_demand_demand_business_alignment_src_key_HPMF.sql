SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_demand.row_id' ELSE 'SUCCESS' END as Message
from (select * from  #MDS_TABLE_SCHEMA.hp_kcrt_requests_final where cdctype<>'D') SRC
inner join(select * from #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_proposal_final)SRC1
on SRC.request_id=SRC1.request_id
and SRC.sourceinstance=SRC1.sourceinstance
left join (select * from #DWH_TABLE_SCHEMA.d_demand) TRGT
on SRC.request_id=TRGT.row_id
and SRC.sourceinstance=TRGT.source_id
left join (select * from #DWH_TABLE_SCHEMA.d_lov)LKP
on SRC1.prop_value_rating between LKP.lower_range_value AND LKP.upper_range_value
AND LKP.dimension_class = 'WH_DEMAND~BUSINESSALIGNMENT'
WHERE COALESCE(LKP.row_key,CASE WHEN SRC1.prop_value_rating IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.demand_business_alignment_src_key,0)