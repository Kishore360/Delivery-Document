SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_imt_nt_com_impact_c.incident_type_c' ELSE 'SUCCESS' END as Message 
 FROM rogers6_mdsdb.bmc_com_impact_final  SRC 
JOIN rogers6_mdwdb.d_imt_nt_com_impact_c TRGT ON 
SRC.IMPACT_ID = TRGT.row_id 
JOIN rogers6_mdsdb.bmc_imt_main_final LKP
on LKP.IMT_ID=SRC.RELATED_ID
WHERE   CASE when TRGT.related_ticket_type_c='Incident' THEN  (CASE WHEN LKP.UNPLANNEDDUETOCHANGE is NULL THEN 'Break Fix' 
                    ELSE 'Change Related' END) ELSE'UNSPECIFIED'end <>TRGT.incident_type_c and TRGT.soft_deleted_flag ='N';

