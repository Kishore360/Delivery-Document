SELECT CASE WHEN cnt > 0 THEN 'FaILURE' ELSE 'SUCCESS' END AS Result, 
       CASE WHEN cnt > 0 THEN 'Data did not Match.' ELSE 'Data Matched' END AS Message 
		FROM   (
		SELECT Count(1) AS cnt 
		FROM  pgi_mdwdb.f_task_sla trgt 
		JOIN pgi_mdsdb.task_sla_final src
		ON trgt.row_id=src.sys_id and trgt.source_id=src.sourceinstance
		WHERE trgt.actual_duration<>TIMESTAMPDIFF(SECOND,'1970-01-01 00:00:00',CONVERT_TZ(src.business_duration,'@#TENANT_SSI_TIME_ZONE@#','@#DW_TARGET_TIME_ZONE@#'))
		) tmp