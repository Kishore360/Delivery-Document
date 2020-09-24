SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_imt_people_c.imt_people_company_c' ELSE 'SUCCESS' END as Message 
 FROM rogers6_mdsdb.bmc_people_final  SRC 
JOIN rogers6_mdwdb.d_imt_people_c TRGT ON 
SRC.PEOPLE_ID = TRGT.row_id 
WHERE   COALESCE(SRC.COMPANY,'UNSPECIFIED')<> (TRGT.imt_people_company_c) and TRGT.soft_deleted_flag ='N';
