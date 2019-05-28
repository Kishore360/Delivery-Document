SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_certification_task_c.open_to_close_duration' ELSE 'SUCCESS' END as Message
from gilead_mdsdb.cert_task_final SRC
LEFT JOIN  gilead_mdwdb.f_certification_task_c trgt
on SRC.sys_id = trgt.row_id and SRC.sourceinstance = trgt.source_id
where CASE WHEN (SRC.opened_at is null or SRC.closed_at is null) THEN NULL
	 WHEN TIMESTAMPDIFF(SECOND,SRC.opened_at,SRC.closed_at) < 0 THEN NULL
	  ELSE TIMESTAMPDIFF(SECOND,SRC.opened_at,SRC.closed_at) end <>trgt.open_to_close_duration