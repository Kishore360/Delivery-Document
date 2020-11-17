SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_imt_nt_com_impact_c.change_type_c' ELSE 'SUCCESS' END as Message
 FROM rogers6_mdsdb.bmc_com_impact_final  SRC
JOIN rogers6_mdwdb.d_imt_nt_com_impact_c TRGT ON
SRC.IMPACT_ID = TRGT.row_id
LEFT JOIN rogers6_mdsdb.bmc_nct_ticket_final LKP
on LKP.NCT_ID=SRC.RELATED_ID
WHERE CASE when SUBSTR(SRC.RELATED_ID,1,3)='NCT' THEN LKP.CHANGE_TYPE ELSE 'UNSPECIFIED' END <>TRGT.change_type_c and TRGT.soft_deleted_flag ='N'
and( LKP.TRAINING_TICKET is null or CEIL(LKP.TRAINING_TICKET) <> 0);