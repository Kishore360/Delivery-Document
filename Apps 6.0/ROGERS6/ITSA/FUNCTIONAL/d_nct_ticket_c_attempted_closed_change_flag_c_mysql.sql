SELECT 
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0  THEN 'MDS to DWH data validation failed for d_SRC_c.attempted_closed_change_flag_c' ELSE 'SUCCESS' END as Message 
FROM 
(
FROM rogers6_mdsdb.bmc_nct_ticket_final  SRC 
JOIN rogers6_mdwdb.d_nct_ticket_c TRGT ON SRC.NCT_ID = TRGT.row_id AND SRC.sourceinstance=TRGT.source_id 
WHERE  
CASE WHEN (SRC.SUBMITTED_ON IS NOT NULL AND ceil(SRC.STATUS) =  40  AND COALESCE(SRC.CLOSING_CODE,'UNSPECIFIED') NOT IN ('Cancelled','Stand Down'))
THEN 'Y' ELSE 'N' END <> TRGT.attempted_closed_change_flag_c
AND SRC.cdctype='X'
and (CEIL(SRC.TRAINING_TICKET)<>0 or SRC.TRAINING_TICKET is null)
group by 1,2
) temp;