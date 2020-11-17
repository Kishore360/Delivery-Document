SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_imt_nt_com_impact_c.impact_start_date_time_c' ELSE 'SUCCESS' END as Message 
 FROM rogers6_mdsdb.bmc_com_impact_final  SRC 
JOIN rogers6_mdwdb.d_imt_nt_com_impact_c TRGT ON 
SRC.IMPACT_ID = TRGT.row_id 
WHERE   (FROM_UNIXTIME(SRC.IMPACT_START))<>(TRGT.impact_start_date_time_c) and TRGT.soft_deleted_flag ='N';
