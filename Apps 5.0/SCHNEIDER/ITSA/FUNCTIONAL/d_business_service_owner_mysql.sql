SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_service.owner' 
ELSE 'SUCCESS' END as Message
FROM schneider_mdsdb.bmc_core_bmc_businessservice_final SRC
JOIN schneider_mdwdb.d_service TRGT 
ON concat('BUSINESS_SERVICE','~',SRC.requestid) = TRGT.row_id  and SRC.sourceinstance = TRGT.source_id
JOIN schneider_mdsdb.ast_assetpeople_final LKP 
ON SRC.reconciliationidentity=LKP.assetinstanceid 
JOIN schneider_mdsdb.ctm_people_final LKP1 
ON LKP.peoplegroupinstanceid=LKP1.instanceid 
WHERE LKP.personrole = "Owned by" 
AND COALESCE(LKP1.full_name,'UNSPECIFIED')<> COALESCE(TRGT.owner,'');
