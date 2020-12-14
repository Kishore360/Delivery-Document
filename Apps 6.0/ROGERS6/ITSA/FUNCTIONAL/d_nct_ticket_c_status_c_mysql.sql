SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_nct_ticket_c.nct_ticket_status_c_key' ELSE 'SUCCESS' END as Message 
 FROM rogers6_mdsdb.bmc_nct_ticket_final  SRC 
JOIN rogers6_mdwdb.d_nct_ticket_c TRGT ON 
SRC.NCT_ID = TRGT.row_id
LEFT OUTER JOIN rogers6_mdwdb.d_lov LKP 
ON   CONCAT('STATUS_C~NCT_TICKET~',CEIL(SRC.STATUS)) = LKP.row_id
WHERE  CASE WHEN SRC.STATUS IS NULL THEN 0 ELSE COALESCE(LKP.row_key,-1) END  <> (TRGT.nct_ticket_status_c_key) and TRGT.soft_deleted_flag ='N'
and (
CEIL(SRC.TRAINING_TICKET)<>0   or SRC.TRAINING_TICKET is null);