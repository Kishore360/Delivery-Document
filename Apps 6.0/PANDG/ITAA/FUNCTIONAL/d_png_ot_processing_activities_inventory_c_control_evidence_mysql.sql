SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_c.control_evidence' 
ELSE 'SUCCESS' END as Message 
FROM (select a11.*,a12.Compliance_control,
COALESCE(CASE   
                    WHEN a12.Compliance_control = 'Data breach response'       THEN IF(a11.Data_breach_response_Evidence <> '',
                    a11.Data_breach_response_Evidence ,
                    NULL)  
                    WHEN a12.Compliance_control = 'Data Retention'                              THEN IF(a11.Data_retention_Evidence <> '',
                    a11.Data_retention_Evidence ,
                    NULL)  
                    WHEN a12.Compliance_control = 'Data Subject Rights'                         THEN IF(a11.Data_Subject_Rights_Evidence <> '',
                    a11.Data_Subject_Rights_Evidence ,
                    NULL)  
                    WHEN a12.Compliance_control = 'Inventory'                                   THEN IF(a11.Inventory_Evidence <> '',
                    a11.Inventory_Evidence ,
                    NULL)  
                    WHEN a12.Compliance_control = 'Lawful basis'                                THEN IF(a11.Lawfulness_Basis_Evidence <> '',
                    a11.Lawfulness_Basis_Evidence ,
                    NULL)  
                    WHEN a12.Compliance_control = 'Minimization'                                THEN IF(a11.Minimization_Evidence <> '',
                    a11.Minimization_Evidence ,
                    NULL)  
                    WHEN a12.Compliance_control = 'Notices'                                     THEN IF(a11.Notice_Evidence <> '',
                    a11.Notice_Evidence ,
                    NULL)  
                    WHEN a12.Compliance_control = 'Reasonable Information Security Controls'    THEN IF(a11.Reasonable_InfoSec_Evidence <> '',
                    a11.Reasonable_InfoSec_Evidence ,
                    NULL)  
                    WHEN a12.Compliance_control = 'Vendors'                                     THEN IF(a11.Vendors_Evidence <> '',
                    a11.Vendors_Evidence ,
                    NULL)  
                    WHEN a12.Compliance_control = 'Data Privacy Impact Assessment'              THEN IF(a11.DPIA_Evidence <> '',
                    a11.DPIA_Evidence ,
                    NULL)  
                    ELSE 'UNSPECIFIED' 
                END,
                'UNSPECIFIED') as control_evidence

 from png_mdsdb.pg_ot_processing_activities_inventory_final a11                 
INNER JOIN png_mdsdb.pg_ot_compliance_controls_final  a12
ON 1=1 )   src
LEFT JOIN  png_mdwdb.d_png_ot_processing_activity_validation_control_c trgt
on CONCAT(src.Inventory_Id,'~',sha1(lower(src.Compliance_control)))=trgt.row_id 
and src.sourceinstance = trgt.source_id
where src.control_evidence <>trgt.control_evidence and trgt.soft_deleted_flag ='N';