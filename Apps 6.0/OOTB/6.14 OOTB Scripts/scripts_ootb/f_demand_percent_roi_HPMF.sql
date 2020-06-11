SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM  #MDS_TABLE_SCHEMA.hp_kcrt_requests_final where cdctype <> 'D') SRC 
inner join(select * from #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_proposal_final)SRC1
on SRC.request_id=SRC1.request_id
and SRC.sourceinstance=SRC1.sourceinstance
left join(select * from  #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_project_final)SRC3
on SRC1.prop_project_id=SRC3.prj_project_id
and SRC1.sourceinstance=SRC3.sourceinstance
left join   #MDS_TABLE_SCHEMA.hp_fm_financial_summary_final  SRC2
 on SRC1.prop_financial_summary_id = SRC2.financial_summary_id 
 and SRC.sourceinstance = SRC2.sourceinstance
 left join  #MDS_TABLE_SCHEMA.hp_fm_forecast_actual_lines_final SRC5
 on SRC2.forecast_actual_id=SRC5.forecast_actual_id
left join   #MDS_TABLE_SCHEMA.hp_fm_forecast_actual_period_sum_final src6
 on SRC5.FORECAST_ACTUAL_ID = src6.FORECAST_ACTUAL_ID 
 and SRC2.sourceinstance =src6.sourceinstance 
 and src6.period_id = -1 
 LEFT JOIN  #DWH_TABLE_SCHEMA.f_demand TRGT 
 ON (SRC.request_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 WHERE round(COALESCE(SRC1.PROP_RETURN_ON_INVESTMENT/src6.PROJECTED_TOTAL,0),9)<> round(COALESCE(TRGT.PERCENT_ROI,0),9); 