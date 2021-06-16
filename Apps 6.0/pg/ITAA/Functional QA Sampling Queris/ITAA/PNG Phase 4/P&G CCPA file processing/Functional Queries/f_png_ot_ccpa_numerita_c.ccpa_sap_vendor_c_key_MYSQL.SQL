SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS ' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_internal_organization.sap vendor key' 
ELSE 'SUCCESS d_internal_organization.sap vendor key' END as Message
FROM 
(
Select Count(1) as CNT
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC 
JOIN pgrita_mdwdb.f_png_ot_ccpa_numerita_c TRGT ON (SRC.ID=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
JOIN pgrita_mdwdb.d_internal_organization LKP1 ON (TRGT.ccpa_sap_vendor_c_key=LKP1.row_key AND SRC.sourceinstance=LKP1.source_id)
where TRGT.ccpa_sap_vendor_c_key<>LKP1.row_key
 ) temp;
 
 
 