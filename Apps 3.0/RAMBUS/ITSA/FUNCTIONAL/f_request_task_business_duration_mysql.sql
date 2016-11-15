SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_request_task.business_duration' ELSE 'SUCCESS' END as Message
 from
rambus_mdsdb.sc_task_final sc_task
 join rambus_mdwdb.f_request_task Trgt
on sc_task.sys_id=Trgt.row_id and sc_task.sourceinstance=Trgt.source_id where
CASE WHEN sc_task.business_duration is null  THEN NULL
	 WHEN TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',sc_task.business_duration) < 0 THEN NULL 
	  ELSE TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',sc_task.business_duration) end <> Trgt.business_duration;