SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_imt_nt_com_impact_c.incident_known_unauthorized_flag_c' ELSE 'SUCCESS' END as Message 
 FROM rogers6_mdsdb.bmc_com_impact_final  SRC 
JOIN rogers6_mdwdb.d_imt_nt_com_impact_c TRGT ON 
SRC.IMPACT_ID = TRGT.row_id 
JOIN rogers6_mdwdb.d_imt_main_c LKP
on LKP.IMT_ID=SRC.RELATED_ID
WHERE   CASE WHEN TRGT.related_ticket_type_c='Incident' THEN imt_main_known_unauthorized_flag_c else  'N' END<>(TRGT.incident_known_unauthorized_flag_c) and TRGT.soft_deleted_flag ='N';
