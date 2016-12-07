SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.short_description' ELSE 'SUCCESS' END as Message
 FROM  molinahealth_mdsdb.u_hr_task_final src
left join molinahealth_mdwdb.d_hr_task_c trgt on trgt.row_id = src.sys_id and trgt.source_id = src.sourceinstance
WHERE length(src.short_description)<=255 and src.short_description <> trgt.short_description;