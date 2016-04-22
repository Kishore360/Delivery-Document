SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_on_key' ELSE 'SUCCESS' END as Message
FROM 
	nbcu_mdsdb.task_survey_final a11
left join 
	nbcu_mdsdb.u_survey_final SRC
	on a11.task=SRC.u_request_no and a11.sourceinstance=SRC.sourceinstance
LEFT JOIN 
	nbcu_mdwdb.f_task_survey TRGT 
	ON (a11.sys_id =TRGT.row_id AND a11.sourceinstance= TRGT.source_id  )
WHERE  SRC.u_investigation_complete <> TRGT.investigation_complete_src_code_c