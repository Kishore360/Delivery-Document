
SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message from (
select count(1) cnt
        FROM
     rogers_mdwdb.f_incident d 
JOIN  rogers_mdsdb.us_ci_tracker_incident_final p ON d.incident_number=p.incident AND d.source_id = p.sourceinstance
where digital_count <> digital_count_c  )a