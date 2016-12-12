
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request.assigned_to_key' ELSE 'SUCCESS' END as Message
FROM nbcu_mdwdb.f_incident a
join
(SELECT t.task AS row_id,SUM(t.time_in_seconds) AS time_in_seconds_c,sourceinstance as source_id
FROM nbcu_mdwdb.f_incident i
join nbcu_mdsdb.task_time_worked_final t ON i.row_id=t.task and i.source_id=t.sourceinstance
GROUP BY t.task) b
 ON a.row_id=b.row_id and a.source_id=b.source_id
where b.time_in_seconds_c<>a.time_in_seconds_c