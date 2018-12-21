SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for f_pandg_ot_processing_activities_inventory_c.sap_vendor_c_key' 
ELSE 'SUCCESS' END as Message 
FROM pandg_mdsdb.pg_ot_processing_activities_inventory_final  src
LEFT JOIN  pandg_mdwdb.f_pandg_ot_processing_activities_inventory_c trgt
on src.inventory_id = trgt.row_id and src.sourceinstance = trgt.source_id
JOIN pandg_mdwdb.d_internal_organization lkp
ON ((COALESCE(CONCAT('OT_VENDOR~',sha1(lower(concat(IF(src.SAP_Vendor_Number IS NULL OR src.SAP_Vendor_Number = '','UNSPECIFIED',src.SAP_Vendor_Number) ,
'~',IF(src.SAP_Vendor_Name IS NULL OR src.SAP_Vendor_Name = '','UNSPECIFIED',src.SAP_Vendor_Name))))),'UNSPECIFIED')=lkp.row_id and src.sourceinstance=lkp.source_id)
AND DATE_FORMAT(trgt.pivot_date, '%Y-%m-%d %H:%i:%s') 
BETWEEN effective_from AND effective_to
            )
where COALESCE(lkp.row_key,CASE WHEN src.SAP_Vendor_Number IS NULL THEN 0 else -1 end)<> trgt.sap_vendor_c_key;