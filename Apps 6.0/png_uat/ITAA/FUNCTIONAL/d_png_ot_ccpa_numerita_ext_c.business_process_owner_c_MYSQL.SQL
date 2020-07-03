SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_png_ot_ccpa_numerita_ext_c.business_process_owner_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final a 
LEFT JOIN png_mdwdb.d_png_ot_ccpa_numerita_c b ON a.id=b.row_id AND a.sourceinstance=b.source_id
JOIN png_mdwdb.d_png_ot_ccpa_numerita_ext_c c ON b.png_ot_ccpa_numerita_ext_c_key=c.row_key
JOIN png_mdwdb.d_internal_contact LKP ON a.Business_Process_Owner= CONCAT(LKP.last_name,', ',LKP.first_name)
WHERE a.Business_Process_Owner <> c.business_process_owner_c
AND a.cdctype='X'
) temp;

 
  