SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.imt_people_status_c_key' ELSE 'SUCCESS' END as Message 
 FROM rogers6_mdsdb.bmc_people_final SRC 
JOIN rogers6_mdwdb.d_imt_people_c TRGT ON 
SRC.PEOPLE_ID = TRGT.row_id 
LEFT OUTER JOIN rogers6_mdwdb.d_lov LKP 
ON   CONCAT('STATUS~PEOPLE~',CEIL(SRC.STATUS)) = LKP.row_id and LKP.source_id =  SRC.sourceinstance
WHERE  CASE WHEN SRC.STATUS IS NULL THEN 0 ELSE COALESCE(LKP.row_key,-1) END  <> (TRGT.imt_people_status_c_key) and TRGT.soft_deleted_flag ='N';