SELECT 
CASE WHEN CNT > 0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0   THEN 'MDS to DWH data validation failed for d_pbm_main_c.active_ticket_flag_c' ELSE 'SUCCESS' END as Message 
FROM
(
SELECT Count(1) as CNT
From rogers6_mdsdb.bmc_pbm_main_final SRC
JOIN rogers6_mdwdb.d_pbm_main_c TRGT ON SRC.PBM_ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
JOIN rogers6_mdwdb.d_lov LKP ON CONCAT('STATE~PBM_TICKET','~',CEIL(SRC.STATE))=LKP.row_id
WHERE 
CASE 
WHEN COALESCE(LKP.dimension_name,'UNSPECIFIED') NOT IN ('Closed','Draft') AND TRGT.initial_submission_date_c  IS NOT NULL THEN 'Y'
WHEN COALESCE(LKP.dimension_name,'UNSPECIFIED') ='Closed' AND TRGT.initial_submission_date_c  IS NOT NULL THEN 'N'
WHEN COALESCE(LKP.dimension_name,'UNSPECIFIED') ='Draft'  THEN 'D'
ELSE 'O' END <> TRGT.active_ticket_flag_c
AND SRC.cdctype='X'
) temp;


 