select CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.'ELSE 'Data Matched' END AS Message 
FROM (select count(1) as cnt from pgi_mdwdb.f_task_sla trgt
JOIN pgi_mdsdb.task_sla_final src
ON trgt.source_id=src.sourceinstance and trgt.row_id = src.sys_id
LEFT JOIN pgi_mdsdb.task_final lkp
ON src.task = lkp.sys_id
JOIN pgi_mdwdb.d_incident inc
ON COALESCE(CASE WHEN UPPER(lkp.sys_class_name) like '%INCIDENT%' then src.task else 'UNSPECIFIED'END ,'UNSPECIFIED') =  inc.row_id
where
inc.row_key<>trgt.incident_key)tmp
;