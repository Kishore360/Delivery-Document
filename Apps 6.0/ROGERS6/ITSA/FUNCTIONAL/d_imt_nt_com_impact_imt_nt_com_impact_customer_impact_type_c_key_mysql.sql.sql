SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_imt_nt_com_impact_c.imt_nt_com_impact_customer_impact_type_c_key' ELSE 'SUCCESS' END as Message 
 FROM rogers6_mdsdb.bmc_com_impact_final SRC 
JOIN rogers6_mdwdb.d_imt_nt_com_impact_c TRGT ON 
SRC.IMPACT_ID = TRGT.row_id 
JOIN rogers6_mdwdb.d_lov LKP 
ON   CONCAT('CUSTOMER_IMPACT_TYPE_C~COM_IMPACT~',SRC.CUSTOMER_IMPACT_TYPE) = LKP.row_id and LKP.source_id =  SRC.sourceinstance
WHERE  CASE WHEN SRC.CUSTOMER_IMPACT_TYPE IS NULL THEN 0 ELSE COALESCE(LKP.row_key,-1) END  <> (TRGT.imt_nt_com_impact_customer_impact_type_c_key) and TRGT.soft_deleted_flag ='N';
