SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_imt_nt_com_impact_c.related_ticket_type_c' ELSE 'SUCCESS' END as Message 
 FROM rogers6_mdsdb.bmc_com_impact_final  SRC 
JOIN rogers6_mdwdb.d_imt_nt_com_impact_c TRGT ON 
SRC.IMPACT_ID = TRGT.row_id 
WHERE   COALESCE(CASE WHEN SUBSTR(SRC.RELATED_ID,1,3) = 'IMT' THEN 'Incident' WHEN SUBSTR(SRC.RELATED_ID,1,3) = 'NCT' THEN 'Change'
WHEN SUBSTR(SRC.RELATED_ID,1,3) = 'PBM' THEN 'Problem' ELSE NULL END ,'UNSPECIFIED')<>(TRGT.related_ticket_type_c) and TRGT.soft_deleted_flag ='N';
