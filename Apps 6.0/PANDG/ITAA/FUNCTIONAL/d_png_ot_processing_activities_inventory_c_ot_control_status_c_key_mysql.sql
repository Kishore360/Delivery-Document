SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_pandg_ot_processing_activities_inventory_c.ot_control_status_c_key' 
ELSE 'SUCCESS' END as Message 
FROM (select a11.*,a12.Compliance_control from pandg_mdsdb.pg_ot_processing_activities_inventory_final a11                 
INNER JOIN pandg_mdsdb.pg_ot_compliance_controls_final  a12
ON 1=1 )   src
LEFT JOIN  pandg_mdwdb.d_pandg_ot_processing_activity_validation_control_c trgt
on CONCAT(src.Inventory_Id,'~',sha1(lower(src.Compliance_control)))=trgt.row_id 
and src.sourceinstance = trgt.source_id
JOIN pandg_mdwdb.d_lov lkp
on UPPER(COALESCE(CONCAT('OT_CONTROL_STATUS_C~PROCESSING_ACTIVITIES~',
                CASE   
                    WHEN src.Compliance_control = 'Data breach response'       THEN IF(src.Data_breach_response_Status <> '',
                    src.Data_breach_response_Status ,
                    NULL)  
                    WHEN src.Compliance_control = 'Data Retention'                              THEN IF(src.Data_retention_Status <> '',
                    src.Data_retention_Status ,
                    NULL)  
                    WHEN src.Compliance_control = 'Data Subject Rights'                         THEN IF(src.Data_Subject_Rights_Status <> '',
                    src.Data_Subject_Rights_Status ,
                    NULL)  
                    WHEN src.Compliance_control = 'Inventory'                                   THEN IF(src.Inventory_Status <> '',
                    src.Inventory_Status ,
                    NULL)  
                    WHEN src.Compliance_control = 'Lawful basis'                                THEN IF(src.Lawfulness_Basis_Status <> '',
                    src.Lawfulness_Basis_Status ,
                    NULL)  
                    WHEN src.Compliance_control = 'Minimization'                                THEN IF(src.Minimization_Status <> '',
                    src.Minimization_Status ,
                    NULL)  
                    WHEN src.Compliance_control = 'Notices'                                     THEN IF(src.Notice_Status <> '',
                    src.Notice_Status ,
                    NULL)  
                    WHEN src.Compliance_control = 'Reasonable Information Security Controls'    THEN IF(src.Reasonable_InfoSec_Status <> '',
                    src.Reasonable_InfoSec_Status ,
                    NULL)  
                    WHEN src.Compliance_control = 'Vendors'                                     THEN IF(src.Vendors_Status <> '',
                    src.Vendors_Status ,
                    NULL)  
                    ELSE NULL 
                END),
                'UNSPECIFIED'))=lkp.row_id and src.sourceinstance=lkp.source_id
where COALESCE(lkp.row_key,case when src.Compliance_control is NULL THEN 0 ELSE -1 END)<>trgt.ot_control_status_c_key;