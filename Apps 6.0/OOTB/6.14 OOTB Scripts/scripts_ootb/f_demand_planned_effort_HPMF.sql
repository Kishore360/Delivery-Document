SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM   #MDS_TABLE_SCHEMA.hp_kcrt_requests_final where cdctype <> 'D') SRC 
  inner join(select SRC1.request_id,sum(SRC3.scheduled_effort) as scheduled_effort,
  sum(SRC3.actual_effort) as actual_effort from 
  (select * from  #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_proposal_final)SRC1
left join(select * from #MDS_TABLE_SCHEMA.hp_kcrt_rt_request_resources_final)SRC2
on SRC1.request_id=SRC2.request_id
and SRC1.sourceinstance=SRC2.sourceinstance
left join(select * from #MDS_TABLE_SCHEMA.hp_kcrt_request_rsc_actuals_final where cdctype<>'D')SRC3
on SRC2.request_rsc_actuals_id=SRC3.request_rsc_actuals_id 
group by SRC1.request_id)SRC_COMP
on SRC.request_id=SRC_COMP.request_id
LEFT JOIN  #DWH_TABLE_SCHEMA.f_demand TRGT 
ON (SRC.request_id=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id)  
WHERE COALESCE(SRC_COMP.scheduled_effort,0)<>COALESCE(TRGT.planned_effort,0)




