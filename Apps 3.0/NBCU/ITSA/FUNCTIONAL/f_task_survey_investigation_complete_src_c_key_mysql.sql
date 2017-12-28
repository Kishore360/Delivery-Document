SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_incident.opened_on_key' ELSE 'SUCCESS' END as Message
FROM (SELECT Count(1) as CNT 
FROM 
	nbcu_mdsdb.task_survey_final a11
left join 
	nbcu_mdsdb.u_survey_final SRC
	on a11.task=SRC.u_request_no and a11.sourceinstance=SRC.sourceinstance
LEFT JOIN 
	nbcu_mdwdb.f_task_survey TRGT 
	ON (a11.sys_id =TRGT.row_id AND a11.sourceinstance= TRGT.source_id  )
LEFT JOIN 
	nbcu_mdwdb.d_lov LKP 
	on concat('SURVEY~INVESTIGATION_COMPLETE_C~~~',SRC.u_investigation_complete) = LKP.row_id and LKP.source_id=SRC.sourceinstance
WHERE  COALESCE(LKP.row_key,CASE WHEN SRC.u_investigation_complete IS NULL THEN 0 else -1 end)<> TRGT.investigation_complete_src_c_key
)temp;

