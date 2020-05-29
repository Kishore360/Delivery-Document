SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM   #MDS_TABLE_SCHEMA.hp_kcrt_requests_final where cdctype <> 'D') SRC 
 inner join(select * from  #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_proposal_final)SRC1
on SRC.request_id=SRC1.request_id
and SRC.sourceinstance=SRC1.sourceinstance
left join   #MDS_TABLE_SCHEMA.hp_fm_financial_summary_final  SRC2
 on SRC1.prop_financial_summary_id = SRC2.financial_summary_id 
 and SRC.sourceinstance = SRC2.sourceinstance
left join   #MDS_TABLE_SCHEMA.hp_fm_benefit_period_sum_final src3
 on SRC2.BENEFIT_ID = src3.BENEFIT_ID and SRC2.sourceinstance =src3.sourceinstance and src3.period_id = -1 
 LEFT JOIN   #DWH_TABLE_SCHEMA.f_demand TRGT 
 ON (SRC.request_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE COALESCE(src3.PLANNED_VALUE_BSE,0)<> COALESCE(TRGT.PLANNED_BENIFIT,0);
  
 