SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_task_fss_c.open_to_closed_duration' ELSE 'SUCCESS' END as Message
 from
gilead_mdsdb.u_task_fss_final SRC
 join gilead_mdwdb.f_task_fss_c Trgt
on SRC.sys_id=Trgt.row_id and SRC.sourceinstance=Trgt.source_id where
TIMESTAMPDIFF(SECOND,SRC.opened_at,SRC.closed_at) <> Trgt.open_to_closed_duration;