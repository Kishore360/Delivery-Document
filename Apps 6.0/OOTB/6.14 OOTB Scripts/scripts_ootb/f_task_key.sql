
SELECT  CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation f_task.task_key' ELSE 'SUCCESS' END AS Message
FROM #DWH_TABLE_SCHEMA.f_task SRC
left join #DWH_TABLE_SCHEMA.d_task TRGT
on SRC.row_id=TRGT.row_id
and SRC.source_id=TRGT.source_id
where SRC.task_key<>coalesce(TRGT.row_key,'')