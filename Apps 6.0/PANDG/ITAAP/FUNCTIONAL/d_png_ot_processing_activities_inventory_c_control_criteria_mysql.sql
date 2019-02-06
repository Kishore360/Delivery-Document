SELECT 
CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_c.control_criteria' ELSE 'SUCCESS' END as Message 
FROM 
(select a11.*,a12.Compliance_control 
from png_mdsdb.pg_ot_processing_activities_inventory_final a11                 
INNER JOIN png_mdsdb.pg_ot_compliance_controls_final  a12
ON 1=1 AND a11.cdctype<>'D' and a12.cdctype<>'D')   src
LEFT JOIN  png_mdwdb.d_png_ot_processing_activity_validation_control_c trgt
on CONCAT(src.Inventory_Id,'~',sha1(lower(src.Compliance_control)))=trgt.row_id 
and src.sourceinstance = trgt.source_id
where 
COALESCE(CASE   
WHEN src.Compliance_control = 'Data breach response'  THEN IF(src.Data_breach_response_Criteria <> '',src.Data_breach_response_Criteria,NULL)  
WHEN src.Compliance_control = 'Data Retention' THEN IF(src.Data_retention_Criteria <> '',src.Data_retention_Criteria,NULL)  
                    WHEN src.Compliance_control = 'Data Subject Rights'                         THEN IF(src.Data_Subject_Rights_Criteria <> '',
                    src.Data_Subject_Rights_Criteria ,
                    NULL)  
                    WHEN src.Compliance_control = 'Inventory'                                   THEN IF(src.Inventory_Criteria <> '',
                    src.Inventory_Criteria ,
                    NULL)  
                    WHEN src.Compliance_control = 'Lawful basis'                                THEN IF(src.Lawfulness_Basis_Criteria <> '',
                    src.Lawfulness_Basis_Criteria ,
                    NULL)  
                    WHEN src.Compliance_control = 'Minimization'                                THEN IF(src.Minimization_Criteria <> '',
                    src.Minimization_Criteria ,
                    NULL)  
                    WHEN src.Compliance_control = 'Notices'                                     THEN IF(src.Notice_Criteria <> '',
                    src.Notice_Criteria ,
                    NULL)  
                    WHEN src.Compliance_control = 'Reasonable Information Security Controls'    THEN IF(src.Reasonable_InfoSec_Criteria <> '',
                    src.Reasonable_InfoSec_Criteria ,
                    NULL)  
                    WHEN src.Compliance_control = 'Vendors'                                     THEN IF(src.Vendors_Criteria <> '',
                    src.Vendors_Criteria ,
                    NULL)  
                    ELSE 'UNSPECIFIED' 
                END,
                'UNSPECIFIED')<>trgt.control_criteria 
				;