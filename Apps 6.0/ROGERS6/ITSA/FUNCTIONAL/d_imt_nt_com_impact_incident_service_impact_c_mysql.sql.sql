SELECT  CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
 CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_imt_nt_com_impact_c.incident_service_impact_c' ELSE 'SUCCESS' END as Message 
 FROM rogers6_mdsdb.bmc_com_impact_final  SRC 
JOIN rogers6_mdwdb.d_imt_nt_com_impact_c TRGT ON 
SRC.IMPACT_ID = TRGT.row_id 
JOIN rogers6_mdsdb.bmc_imt_main_final LKP
on LKP.IMT_ID=SRC.RELATED_ID
JOIN rogers6_mdwdb.d_lov lov
on lov.row_id = CONCAT('SERVICE_IMPACT_C~IMT_MAIN~',LKP.SERVICE_IMPACT)
WHERE   CASE when TRGT.related_ticket_type_c='Incident' THEN lov.dimension_name  ELSE 'UNSPECIFIED'END <>TRGT.incident_service_impact_c and TRGT.soft_deleted_flag ='N';

