
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_hr_case.overall_met_sla_flag' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.hr_case_final SRC 
LEFT JOIN <<tenant>>_mdwdb.d_hr_case TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN <<tenant>>_mdwdb.f_task_sla SLA
ON(SLA.hr_case_key=TRGT.row_key)
LEFT JOIN <<tenant>>_mdwdb.d_lov_map LM
ON(LM.dimension_code=SLA.stage_src_code
and LM.dimension_class='STAGE~TASK_SLA')
WHERE COALESCE(case when LM.dimension_wh_code= 'BREACHED' then 'N'
									  when LM.dimension_wh_code in ('PAUSED','IN_PROGRESS') then 'P'
									  when LM.dimension_wh_code in ('COMPLETED','ACHIEVED') then 'Y'
									  else 'X'
									  END ,'')<> COALESCE(TRGT.overall_met_sla_flag ,'')
