
SELECT 
CASE WHEN CNT  > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_hr_case.active_flag' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT 
FROM asu_mdsdb.hr_case_final
join asu_mdwdb.d_hr_case on sys_id=row_id and sourceinstance=source_id
where case when active=1 then 'Y' else 'N' end <>active_flag)temp;



