SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN cnt>0  
THEN 'MDS to DWH data validation failed for d_incident.incident_investigation_start_c' ELSE 'SUCCESS' END as Message FROM (

select count(1) cnt  from  rogers_mdwdb.f_response f
JOIN rogers_mdsdb.survey_response_final s
on f.row_id=s.sys_id and f.source_id=s.sourceinstance
LEFT JOIN rogers_mdsdb.question_final q on s.question=q.sys_id and s.sourceinstance=q.sourceinstance
left join rogers_mdwdb.d_question_c q1 on q1.row_id=case when f.survey_type ='LEGACY' then coalesce(q.sys_id,'UNSPECIFIED')
when f.survey_type='ASSESSMENT' then f.question_key else 'UNSPECIFIED' end
where
f.question_c_key<> coalesce(q1.row_key,case when q.sys_id is null then 0 else -1 end)
)a;