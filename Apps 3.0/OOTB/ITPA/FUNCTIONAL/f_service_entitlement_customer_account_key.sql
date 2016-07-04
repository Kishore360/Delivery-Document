SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_service_entitlement.customer_account_key' ELSE 'SUCCESS' END as Message
FROM <<tenant>>_mdsdb.service_entitlement_final SRC 
LEFT JOIN <<tenant>>_mdwdb.f_service_entitlement TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN <<tenant>>_mdwdb.d_organization_customer LKP 
	ON ( coalesce(concat('CUST_ACC~',SRC.account),'UNSPECIFIED') = LKP.row_id
	AND SRC.sourceinstance=LKP.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.account IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.customer_account_key ,'')
