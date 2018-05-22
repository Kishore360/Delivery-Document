

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for opened_by_employee_duration' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
FROM pan_mdwdb.f_sr_task_c f 
JOIN pan_mdwdb.d_internal_contact a 
ON a.row_key = f.opened_by_key 
where f.opened_by_employee_duration <> COALESCE(TIMESTAMPDIFF(second,a.employee_start_date_c,f.created_on),0))temp;