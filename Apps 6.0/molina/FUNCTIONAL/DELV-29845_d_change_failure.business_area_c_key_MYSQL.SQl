SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_failure.business_area_c_key' ELSE 'SUCCESS' END as Message
FROM 
(
Select Count(1) as CNT 
FROM "MOLINA_P_DB"."MDSDB"."CHANGE_REQUEST_FINAL" SRC 
LEFT JOIN mdw.d_change_failure TRGT ON SRC.sys_id =TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT JOIN mdw.d_change_request x ON SRC.sys_id =x.row_id AND SRC.sourceinstance=x.source_id
JOIN mdw.d_service LKP ON COALESCE(CONCAT('BUSINESS_SERVICE~',SRC.u_business_area),'UNSPECIFIED')=LKP.row_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.u_business_area IS NULL THEN 0 ELSE -1 END)<>TRGT.business_area_c_key
AND SRC.cdctype='X'
) temp; 
