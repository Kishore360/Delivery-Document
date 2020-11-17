SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
 CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_imt_nt_com_impact_c.change_auto_coordinated_flag_c' ELSE 'SUCCESS' END as Message 
 FROM rogers6_mdsdb.bmc_com_impact_final  SRC 
JOIN rogers6_mdwdb.d_imt_nt_com_impact_c TRGT ON 
SRC.IMPACT_ID = TRGT.row_id 
JOIN rogers6_mdsdb.bmc_nct_ticket_final LKP
on LKP.NCT_ID=SRC.RELATED_ID
LEFT JOIN rogers6_mdwdb.d_lov lov
on lov.row_id = CONCAT('AUTO_COORDINATED_C~NCT_TICKET~',CEIL(LKP.AUTO_COORDINATED))
WHERE 
 CASE when SUBSTR(SRC.RELATED_ID,1,3)='NCT' THEN CASE WHEN lov.dimension_name = 'True' THEN 'Y' ELSE 'N' END ELSE 'N' END <>TRGT.change_auto_coordinated_flag_c and 
TRGT.soft_deleted_flag ='N'
and (LKP.TRAINING_TICKET is null or CEIL(LKP.TRAINING_TICKET) <> 0);

