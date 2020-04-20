SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_png_ot_ccpa_numerita_c.ccpa_owning_organization_c_key' 
ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_ccpa_pa_inventory_c_final SRC
LEFT JOIN  png_mdwdb.f_png_ot_ccpa_numerita_c TRGT ON SRC.id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
JOIN png_mdwdb.d_internal_organization LKP ON 
COALESCE(CONCAT('OT_CCPA_ORGANIZATION~',sha1(lower(COALESCE(SRC.Owning_Organization,'UNSPECIFIED')))),'UNSPECIFIED')=LKP.row_id 
AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key, CASE WHEN SRC.Owning_Organization iS NULL THEN 0 ELSE -1 END )<>TRGT.ccpa_owning_organization_c_key
AND SRC.cdctype='X'
) temp;


