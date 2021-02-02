SELECT 
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0   THEN 'MDS to DWH data validation failed for d_nct_ticket_c.nct_ticket_status_c_key' ELSE 'SUCCESS' END as Message 
FROM
(
SELECT Count(1) as CNT 
FROM rogers6_mdsdb.bmc_nct_ticket_final  SRC 
JOIN rogers6_mdwdb.d_nct_ticket_c TRGT ON  SRC.NCT_ID = TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
LEFT OUTER JOIN rogers6_mdwdb.d_lov LKP ON CONCAT('STATUS_C~NCT_TICKET~',CEIL(SRC.STATUS)) = LKP.row_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.STATUS IS NULL THEN 0 ELSE -1 END) <> TRGT. nct_ticket_status_c_key
AND SRC.cdctype='X' AND (CEIL(SRC.TRAINING_TICKET)<>0 OR SRC.TRAINING_TICKET is null)
) temp;
