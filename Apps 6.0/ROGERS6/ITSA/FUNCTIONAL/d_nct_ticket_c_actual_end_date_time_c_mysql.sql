
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_nct_ticket_c.actual_end_date_time_c' ELSE 'SUCCESS' END as Message 
 FROM rogers6_mdsdb.bmc_nct_ticket_final  SRC 
JOIN rogers6_mdwdb.d_nct_ticket_c TRGT ON 
SRC.NCT_ID = TRGT.row_id 
WHERE  CONVERT_TZ(FROM_UNIXTIME(SRC.ACTUAL_END_DATE_TIME),'GMT','America/New_York') <> (TRGT.actual_end_date_time_c) and TRGT.soft_deleted_flag ='N'