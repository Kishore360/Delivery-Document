SELECT CASE WHEN CNT >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_certification_task_c.opened_by_key' ELSE 'SUCCESS' END as Message 
FROM (
select count(*) as CNT from gilead_mdsdb.cert_task_final SRC
LEFT JOIN  gilead_mdwdb.f_certification_task_c trgt
on SRC.sys_id = trgt.row_id and SRC.sourceinstance = trgt.source_id
LEFT JOIN gilead_mdwdb.d_internal_contact LKP 
 ON ( concat('INTERNAL_CONTACT~',SRC.opened_by)= LKP.row_id 
AND SRC.sourceinstance= LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN SRC.opened_by IS NULL THEN 0 else -1 end)<> (trgt.opened_by_key))t;