SELECT CASE WHEN CNT >0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_certification_task_c.percentage_complete' ELSE 'SUCCESS' END as Message 
FROM (
select count(*) as CNT from gilead_mdsdb.cert_task_final SRC
LEFT JOIN  gilead_mdwdb.f_certification_task_c trgt
on SRC.sys_id = trgt.row_id and SRC.sourceinstance = trgt.source_id
 WHERE SRC.percent_complete  <> (trgt.percentage_complete))t;
