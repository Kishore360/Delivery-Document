
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_cert_element_c.certification_task_c_key' 
ELSE 'MDS to DWH data validation passed for d_cert_element_c.certification_task_c_key' END as Message from 
(select count(1) cnt 
FROM gilead_mdsdb.cert_element_final SRC 
JOIN gilead_mdwdb.d_cert_element_c TRGT 
ON SRC.sys_id = TRGT.row_id 
and  SRC.sourceinstance = TRGT.source_id  
join 
gilead_mdwdb.d_certification_task_c LKP
on  coalesce(SRC.cert_task,'UNSPECIFIED')=LKP.row_id
WHERE coalesce(LKP.row_key,case when SRC.cert_task is null then 0 else -1 end ) <> TRGT.certification_task_c_key
and SRC.cdctype='X')b
