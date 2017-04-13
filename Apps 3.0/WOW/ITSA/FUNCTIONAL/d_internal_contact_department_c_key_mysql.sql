

SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_internal_contact.department_c_key' ELSE 'SUCCESS' END as Message 
FROM wow_mdwdb.d_internal_contact trgt
RIGHT JOIN (SELECT *,CONCAT('INTERNAL_CONTACT~',sys_id) as res1 ,CONCAT('DEPARTMENT~',department) as res2 from wow_mdsdb.sys_user_final)  src
on src.res1 = trgt.row_id and src.sourceinstance = trgt.source_id
LEFT JOIN wow_mdwdb.d_internal_organization lkp
ON src.res2 = lkp.row_id and src.sourceinstance = lkp.source_id
where COALESCE(lkp.row_key,CASE WHEN src.department IS NULL THEN 0 else -1 end)<> trgt.department_c_key
;