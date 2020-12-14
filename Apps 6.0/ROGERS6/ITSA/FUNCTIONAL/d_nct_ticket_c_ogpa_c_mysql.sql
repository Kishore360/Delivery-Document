
SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_nct_ticket_c.noc_responsibility_c' ELSE 'SUCCESS' END as Message 
 FROM rogers6_mdsdb.bmc_nct_ticket_final  SRC 
JOIN rogers6_mdwdb.d_nct_ticket_c TRGT ON 
SRC.NCT_ID = TRGT.row_id 
WHERE  CONCAT(SRC.ORGANIZATION,'-',SRC.GROUP_X,'-',SRC.PRIME_ELEMENT, '-', SRC.ACTIVITY)
<> (TRGT.ogpa_c) and TRGT.soft_deleted_flag ='N' and (CEIL(SRC.TRAINING_TICKET)<>0 
                or SRC.TRAINING_TICKET is null);