select CASE WHEN count(1) THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) THEN 'MDS to DWH data validation failed for d_internal_contact.manager_business_unit_c_key' ELSE 'SUCCESS' END as Message
FROM rogers6_mdsdb.sys_user_final SRC
JOIN rogers6_mdwdb.d_internal_contact TRGT
ON CONCAT('INTERNAL_CONTACT~',SRC.sys_id)= TRGT.row_id AND SRC.sourceinstance= TRGT.source_id
join rogers6_mdwdb.d_manager_business_unit_c LKP
on SRC.u_business_unit=LKP.row_id and SRC.sourceinstance= LKP.source_id
WHERE CASE WHEN SRC.u_business_unit is NULL THEN 0 ELSE COALESCE(LKP.row_key,-1) end<>TRGT.manager_business_unit_c_key;