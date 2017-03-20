
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for f_hr_case.modification_count' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
FROM asu_mdsdb.hr_case_final
join asu_mdwdb.f_hr_case on sys_id=row_id and sourceinstance=source_id
where sys_mod_count<>modification_count)temp;



