SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_change_request.imt_main_remedy_manager_c' ELSE 'SUCCESS' END as Message 
 FROM rogers6_mdsdb.bmc_people_final SRC 
JOIN rogers6_mdwdb.d_imt_people_c TRGT ON 
SRC.PEOPLE_ID = TRGT.row_id 
LEFT OUTER JOIN rogers6_mdsdb.bmc_people_final LKP 
ON  LKP.REMEDY_LOGIN and SRC.REPORTING_TO WHERE
CASE WHEN LKP.FULL_NAME IS NULL THEN 'UNSPECIFIED' when LKP.REPORTING_TO is null  THEN 'UNSPECIFIED' ELSE LKP.FULL_NAME END  <> (TRGT.imt_main_remedy_manager_c) and TRGT.soft_deleted_flag ='N';
