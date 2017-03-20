
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_hr_case.customer_type_c_src_code' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT 
FROM asu_mdsdb.hr_case_final
join asu_mdwdb.d_hr_case on sys_id=row_id and sourceinstance=source_id
where u_customer_type<>customer_type_c_src_code) temp;


