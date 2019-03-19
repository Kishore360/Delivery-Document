
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message FROM  
cardinalhealth_mdwdb.d_internal_contact a 
JOIN cardinalhealth_mdsdb.sys_user_final b
ON a.row_id = CONCAT('INTERNAL_CONTACT~',b.sys_id) and a.source_id = b.sourceinstance 
where
a.enterprise_id_c <> b.u_enterprise_id;


