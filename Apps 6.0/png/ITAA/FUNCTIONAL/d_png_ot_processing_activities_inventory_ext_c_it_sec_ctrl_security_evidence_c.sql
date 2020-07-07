SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_ext_c_it_sec_ctrl_security_evidence_c' ELSE 'SUCCESS' END as Message 
 
FROM png_mdsdb.pg_ot_processing_activities_inventory_final  SRC 
JOIN png_jul_mdwdb.d_png_ot_processing_activities_inventory_ext_c TRGT ON 
SRC.Inventory_Id = TRGT.row_id and SRC.sourceinstance = TRGT.source_id
WHERE Reasonable_InfoSec_General_Security_Controls_Evidence  <> (TRGT.it_sec_ctrl_security_evidence_c) and TRGT.soft_deleted_flag ='N';
