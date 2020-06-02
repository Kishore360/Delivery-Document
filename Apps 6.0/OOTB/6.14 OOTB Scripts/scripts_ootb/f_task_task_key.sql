-- using -1 in coalesce to handle a scenario where row_id is not present in task but present in f_task ex: incident is present in task table but somehow deleted from incident_final

SELECT  CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation f_task.task_key' ELSE 'SUCCESS' END AS Message
FROM #DWH_TABLE_SCHEMA.f_task SRC
left join #DWH_TABLE_SCHEMA.d_task TRGT
on SRC.row_id=TRGT.row_id
and SRC.source_id=TRGT.source_id
where coalesce(SRC.task_key,'')<>coalesce(TRGT.row_key,-1)