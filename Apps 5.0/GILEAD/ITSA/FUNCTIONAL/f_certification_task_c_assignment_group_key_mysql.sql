SELECT CASE WHEN CNT >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_certification_task_c.assignment_group_key' ELSE 'SUCCESS' END as Message 
FROM (
select count(*) as CNT from gilead_mdsdb.cert_task_final SRC
LEFT JOIN  gilead_mdwdb.f_certification_task_c trgt
on SRC.sys_id = trgt.row_id and SRC.sourceinstance = trgt.source_id
LEFT JOIN gilead_mdwdb.d_internal_organization LKP 
 ON ( concat('INTERNAL_ORGANIZATION~',SRC.assignment_group)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.assignment_group IS NULL THEN 0 else -1 end)<> (trgt.assignment_group_key))t;