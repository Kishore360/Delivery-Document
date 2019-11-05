SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_problem_task.application_key' ELSE 'SUCCESS' END as Message 
from rogers_mdwdb.f_task_survey f
join rogers_mdwdb.d_incident di on f.incident_key=di.row_key and f.source_id=di.source_id
JOIN rogers_mdsdb.us_dissats_comments_c_final dc ON di.incident_number=dc.ticket AND di.source_id=dc.sourceinstance
join rogers_mdsdb.sys_user_group_final sug on sug.name=dc.affected_assignment_group and sug.sourceinstance=dc.sourceinstance
join rogers_mdwdb.d_internal_organization c on COALESCE(CONCAT('GROUP~',sug.sys_id),'UNSPECIFIED') = c.row_id
where f.survey_affected_assignment_group_c_key<>  coalesce(c.row_key,case when sug.sys_id is null then 0 else -1 end)
and dc.CDCTYPE='X' ;


