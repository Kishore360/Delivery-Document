SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_c.control_in_scope' 
ELSE 'SUCCESS' END as Message 
FROM (select a11.*,a12.Compliance_control from png_mdsdb.pg_ot_processing_activities_inventory_final a11                 
INNER JOIN png_mdsdb.pg_ot_compliance_controls_final  a12
ON 1=1 )   src
LEFT JOIN  png_mdwdb.d_png_ot_processing_activity_validation_control_c trgt
on CONCAT(src.Inventory_Id,'~',sha1(lower(src.Compliance_control)))=trgt.row_id 
and src.sourceinstance = trgt.source_id
where COALESCE(CASE   
                    WHEN src.Compliance_control = 'Data breach response' THEN 'FALSE'
                    WHEN src.Compliance_control = 'Data Retention' THEN IF(src.PII_Handled= 'Yes' and (src.Vendor_Qualification <> 'Data Controller'
                    OR (src.Vendor_Qualification = 'Data Controller' AND src.SAP_Vendor_Name = 'No Vendor')),'TRUE','FALSE')  
                    WHEN src.Compliance_control = 'Data Subject Rights' THEN IF(src.PII_Handled= 'Yes' and (src.Vendor_Qualification <> 'Data Controller'
                    OR (src.Vendor_Qualification = 'Data Controller' AND src.SAP_Vendor_Name = 'No Vendor')),'TRUE','FALSE') 
                    WHEN src.Compliance_control = 'Inventory' THEN IF(src.PII_Handled= 'Yes','TRUE','FALSE') 
                    WHEN src.Compliance_control = 'Lawful basis'THEN IF(src.PII_Handled= 'Yes','TRUE','FALSE')
                    WHEN src.Compliance_control = 'Minimization' THEN IF(src.PII_Handled= 'Yes' and (src.Vendor_Qualification <> 'Data Controller'
                    OR (src.Vendor_Qualification = 'Data Controller' AND src.SAP_Vendor_Name = 'No Vendor')),'TRUE','FALSE') 
                    WHEN src.Compliance_control = 'Notices' THEN IF(src.PII_Handled= 'Yes' and (src.Vendor_Qualification <> 'Data Controller'
                    OR (src.Vendor_Qualification = 'Data Controller' AND src.SAP_Vendor_Name = 'No Vendor')),'TRUE','FALSE') 
                    WHEN src.Compliance_control = 'Reasonable Information Security Controls' THEN IF(src.PII_Handled= 'No' or 
                    src.Processing_Activity_Repository_Type<>'Application' and src.Reasonable_InfoSec_Criteria ,'TRUE','FALSE')
                    WHEN src.Compliance_control = 'Vendors' THEN IF (src.SAP_Vendor_Name = 'No Vendor','TRUE','FALSE')
                    WHEN src.Compliance_control = 'Data Privacy Impact Assessment' THEN IF(src.PII_Handled= 'Yes' and (src.Vendor_Qualification <> 'Data Controller'
                    OR (src.Vendor_Qualification = 'Data Controller' AND src.SAP_Vendor_Name = 'No Vendor')),'TRUE','FALSE') 
                    ELSE 'UNSPECIFIED' 
                END,
                'UNSPECIFIED')<>trgt.control_in_scope;