
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.opened_on' ELSE 'SUCCESS' END as Message  FROM molinahealth_mdsdb.u_hr_task_final SRC  LEFT JOIN molinahealth_mdwdb.d_hr_task_c TRGT  ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) WHERE SRC.number<> TRGT.hr_task_number

