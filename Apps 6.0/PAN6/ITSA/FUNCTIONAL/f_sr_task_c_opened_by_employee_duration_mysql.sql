

SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for opened_by_employee_duration' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
FROM pan6_mdwdb.f_sr_task_c f 
join pan6_mdwdb.d_sr_task_c b
on f.sr_task_c_key=b.row_key
JOIN pan6_mdwdb.d_internal_contact a 
ON a.row_key = f.opened_by_key 
where f.opened_by_employee_duration <> COALESCE(TIMESTAMPDIFF(second,a.employee_start_date_c,b.opened_on),0))temp;