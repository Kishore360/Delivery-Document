

SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message from (
select count(1) cnt
        FROM
rogers_mdwdb.f_task_survey f
join rogers_mdwdb.d_incident di on f.incident_key=di.row_key and f.source_id=di.source_id
JOIN rogers_mdsdb.us_dissats_comments_c_final dc ON di.incident_number=dc.ticket AND di.source_id=dc.sourceinstance
where f.survey_agent_c<>coalesce(dc.agent,'UNSPECIFIED')
and dc.CDCTYPE='X')a