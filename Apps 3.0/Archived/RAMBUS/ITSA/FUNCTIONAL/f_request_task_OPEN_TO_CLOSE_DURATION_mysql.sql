SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.OPEN_TO_CLOSE_DURATION' ELSE 'SUCCESS' END as Message
 from
rambus_mdsdb.sc_task_final sc_task
 join rambus_mdwdb.f_request_task Trgt
on sc_task.sys_id=Trgt.row_id and sc_task.sourceinstance=Trgt.source_id where
CASE WHEN (sc_task.opened_at is null or sc_task.closed_at is null) THEN NULL
	 WHEN TIMESTAMPDIFF(SECOND,sc_task.opened_at,sc_task.closed_at) < 0 THEN NULL 
	  ELSE TIMESTAMPDIFF(SECOND,sc_task.opened_at,sc_task.closed_at) end <> Trgt.OPEN_TO_CLOSE_DURATION;