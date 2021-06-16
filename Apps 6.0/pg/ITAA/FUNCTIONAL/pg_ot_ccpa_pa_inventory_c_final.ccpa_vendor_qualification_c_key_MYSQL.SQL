SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for pg_ot_ccpa_pa_inventory_c_final.ccpa_vendor_qualification_c_key' 
ELSE 'SUCCESS' END as Message  from(
select count(1) as CNT 
FROM  png_mdsdb.pg_ot_ccpa_pa_inventory_c_final  src
LEFT JOIN  png_mdwdb.d_png_ot_ccpa_numerita_c trgt
on src.id = trgt.row_id and src.sourceinstance = trgt.source_id
JOIN png_mdwdb.d_lov lkp
ON COALESCE(CONCAT('OT_CCPA_VENDOR_QUALIFICATION_C~PROCESSING_ACTIVITIES~',src.Vendor_qualification),'UNSPECIFIED') =lkp.row_id
where COALESCE(lkp.row_key,CASE WHEN src.Vendor_qualification IS NULL THEN 0 else -1 end)<> trgt.ccpa_vendor_qualification_c_key) temp;




 