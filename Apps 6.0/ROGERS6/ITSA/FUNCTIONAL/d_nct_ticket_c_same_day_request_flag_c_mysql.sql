
SELECT 
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0  THEN 'MDS to DWH data validation failed for d_nct_ticket_c.same_day_request_flag_c' ELSE 'SUCCESS' END as Message
FROM (
SELECT Count(1) as CNT  
FROM rogers6_mdsdb.bmc_nct_ticket_final  SRC 
JOIN rogers6_mdwdb.d_nct_ticket_c TRGT ON SRC.NCT_ID = TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
WHERE  
IF(SRC.WINDOW_START_DATE_TIME = SRC.SUBMITTED_ON ,'Y', 'N') <> (TRGT.same_day_request_flag_c) 
and TRGT.soft_deleted_flag ='N' and (CEIL(SRC.TRAINING_TICKET)<>0  or SRC.TRAINING_TICKET is null)
) temp;
