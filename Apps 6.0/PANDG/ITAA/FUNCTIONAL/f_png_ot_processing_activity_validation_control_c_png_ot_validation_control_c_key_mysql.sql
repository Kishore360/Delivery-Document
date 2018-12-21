SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for f_png_ot_processing_activity_validation_control_c.png_ot_validation_control_c_key' 
ELSE 'SUCCESS' END as Message 
FROM (select a11.Inventory_Id,a11.sourceinstance,a12.Compliance_control from png_mdsdb.pg_ot_processing_activities_inventory_final a11                 
INNER JOIN pandg_mdsdb.pg_ot_compliance_controls_final  a12
ON 1=1 )   src
LEFT JOIN  pandg_mdwdb.f_png_ot_processing_activity_validation_control_c trgt
on CONCAT(src.Inventory_Id,'~',sha1(lower(src.Compliance_control)))=trgt.row_id 
and src.sourceinstance = trgt.source_id
JOIN pandg_mdwdb.d_png_ot_compliance_control_c lkp
ON sha1(lower(src.Compliance_control))=lkp.row_id and trgt.source_id=lkp.source_id
where COALESCE(lkp.row_key,case when src.Compliance_control is NULL THEN 0 ELSE -1 END)<>trgt.png_ot_validation_control_c_key;

