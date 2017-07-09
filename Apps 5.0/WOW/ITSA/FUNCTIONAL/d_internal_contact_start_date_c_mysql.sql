
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_internal_contact.start_date_c' ELSE 'SUCCESS' END as Message 
FROM wow_mdwdb.d_internal_contact trgt
RIGHT JOIN wow_mdsdb.sys_user_final src
on CONCAT('INTERNAL_CONTACT~',src.sys_id) = trgt.row_id and src.sourceinstance = trgt.source_id
WHERE CONVERT_TZ(src.u_start_date,'GMT','US/Central')<>start_date_c
;