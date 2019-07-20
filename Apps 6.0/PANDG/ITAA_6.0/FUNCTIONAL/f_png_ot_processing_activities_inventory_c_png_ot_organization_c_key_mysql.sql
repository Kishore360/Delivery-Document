SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for f_png_ot_processing_activities_inventory_c.png_ot_organization_c_key' 
ELSE 'SUCCESS' END as Message 
FROM 
(
SELECT Count(1) as CNT 
FROM png_mdsdb.pg_ot_processing_activities_inventory_final SRC
LEFT JOIN  png_mdwdb.f_png_ot_processing_activities_inventory_c TRGT ON SRC.inventory_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
JOIN png_mdwdb.d_internal_organization LKP ON 
COALESCE(CONCAT('OT_ORGANIZATION~',sha1(lower(COALESCE(SRC.Owning_Organization,SRC.Managing_Organization,'UNSPECIFIED')))),'UNSPECIFIED'
)=LKP.row_id 
AND SRC.sourceinstance=LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN COALESCE(SRC.Owning_Organization,SRC.Managing_Organization) IS NULL THEN 0 ELSE -1 END)
<>TRGT.png_ot_organization_c_key
AND SRC.cdctype='X'
) temp;


/* SELECT SRC.Inventory_Id,SRC.Owning_Organization,SRC.Managing_Organization,LKP.owning_org_name_c AS Owning_Org,LKP.organization_name,
TRGT.png_ot_organization_c_key AS Owning_Org_key,TRGT.managing_organization_c_key AS Managing_Org_Key
FROM png_mdsdb.pg_ot_processing_activities_inventory_final SRC
LEFT JOIN  png_mdwdb.f_png_ot_processing_activities_inventory_c TRGT ON SRC.inventory_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id
JOIN png_mdwdb.d_internal_organization LKP ON 
COALESCE(CONCAT('OT_ORGANIZATION~',sha1(lower(COALESCE(SRC.Owning_Organization,SRC.Managing_Organization,'UNSPECIFIED')))),'UNSPECIFIED'
)=LKP.row_id 
AND SRC.sourceinstance=LKP.source_id
WHERE SRC.Inventory_Id IN ('dbfbaf5e-0534-46c6-ae73-2b01020059bc','79341387-c914-499a-ab83-a185bdb47204');
 */