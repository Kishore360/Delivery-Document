SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_pandg_ot_processing_activities_inventory_c.control_evidence' 
ELSE 'SUCCESS' END as Message 
FROM (select a11.*,a12.Compliance_control from pandg_mdsdb.pg_ot_processing_activities_inventory_final a11                 
INNER JOIN pandg_mdsdb.pg_ot_compliance_controls_final  a12
ON 1=1 )   src
LEFT JOIN  pandg_mdwdb.d_pandg_ot_processing_activity_validation_control_c trgt
on CONCAT(src.Inventory_Id,'~',sha1(lower(src.Compliance_control)))=trgt.row_id 
and src.sourceinstance = trgt.source_id
where COALESCE(CASE   
                    WHEN src.Compliance_control = 'Data breach response'       THEN IF(src.Data_breach_response_Evidence <> '',
                    src.Data_breach_response_Evidence ,
                    NULL)  
                    WHEN src.Compliance_control = 'Data Retention'                              THEN IF(src.Data_retention_Evidence <> '',
                    src.Data_retention_Evidence ,
                    NULL)  
                    WHEN src.Compliance_control = 'Data Subject Rights'                         THEN IF(src.Data_Subject_Rights_Evidence <> '',
                    src.Data_Subject_Rights_Evidence ,
                    NULL)  
                    WHEN src.Compliance_control = 'Inventory'                                   THEN IF(src.Inventory_Evidence <> '',
                    src.Inventory_Evidence ,
                    NULL)  
                    WHEN src.Compliance_control = 'Lawful basis'                                THEN IF(src.Lawfulness_Basis_Evidence <> '',
                    src.Lawfulness_Basis_Evidence ,
                    NULL)  
                    WHEN src.Compliance_control = 'Minimization'                                THEN IF(src.Minimization_Evidence <> '',
                    src.Minimization_Evidence ,
                    NULL)  
                    WHEN src.Compliance_control = 'Notices'                                     THEN IF(src.Notice_Evidence <> '',
                    src.Notice_Evidence ,
                    NULL)  
                    WHEN src.Compliance_control = 'Reasonable Information Security Controls'    THEN IF(src.Reasonable_InfoSec_Evidence <> '',
                    src.Reasonable_InfoSec_Evidence ,
                    NULL)  
                    WHEN src.Compliance_control = 'Vendors'                                     THEN IF(src.Vendors_Evidence <> '',
                    src.Vendors_Evidence ,
                    NULL)  
                    ELSE 'UNSPECIFIED' 
                END,
                'UNSPECIFIED')<>trgt.control_evidence;