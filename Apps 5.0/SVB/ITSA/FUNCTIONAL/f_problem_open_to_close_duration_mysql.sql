SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_problem.closed_by_key' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
 FROM svb_mdwdb.d_problem a
JOIN  svb_mdwdb.f_problem f ON a.row_key = f.problem_key
JOIN svb_mdwdb.d_lov_map br ON (f.state_src_key = br.src_key AND br.dimension_class = 'STATE~PROBLEM'
AND br.dimension_wh_code ='CLOSED')
JOIN svb_mdwdb.d_calendar_date cd ON DATE_FORMAT(a.changed_on,'%Y%m%d') =cd.row_id
LEFT JOIN svb_mdwdb.d_internal_contact ic ON (ic.user_name = f.changed_by AND ic.source_id = f.source_id)
where case when a.opened_on> coalesce(a.closed_on,a.changed_on)then null 
	else  TIMESTAMPDIFF(SECOND,CONVERT_TZ(a.opened_on,'GMT','America/Los_Angeles'),
	CONVERT_TZ(coalesce(a.closed_on,a.changed_on),'GMT','America/Los_Angeles')) end= 	f.open_to_close_duration
)temp