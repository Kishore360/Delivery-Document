
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_SRC_c.attempted_closed_change_flag_c' ELSE 'SUCCESS' END as Message 
 FROM rogers6_mdsdb.bmc_nct_ticket_final  SRC 
JOIN rogers6_mdwdb.d_nct_ticket_c TRGT ON 
SRC.NCT_ID = TRGT.row_id 
WHERE  IF(SRC.SUBMITTED_ON is not null 
                and CEIL(SRC.STATUS) = 40 
                and SRC.CLOSING_CODE IN ('Cancelled',
                'Stand Down') ,
                'Y',
                'N')  <> (TRGT.attempted_closed_change_flag_c) and TRGT.soft_deleted_flag ='N' and (
CEIL(SRC.TRAINING_TICKET)<>0 
                or SRC.TRAINING_TICKET is null);