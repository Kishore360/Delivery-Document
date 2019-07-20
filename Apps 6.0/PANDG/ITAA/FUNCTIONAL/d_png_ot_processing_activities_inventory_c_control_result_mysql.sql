SELECT CASE WHEN count(1)>0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0 THEN 'MDS to DWH data validation failed for d_png_ot_processing_activities_inventory_c.control_result' 
ELSE 'SUCCESS' END as Message 
FROM (select 

UPPER(CASE   
                    WHEN a12.Compliance_control = 'Data breach response'       THEN IF(a11.Data_breach_response_Status <> '',
                    a11.Data_breach_response_Status ,
                    NULL)  
                    WHEN a12.Compliance_control = 'Data Retention'                              THEN IF(a11.Data_retention_Status <> '',
                    a11.Data_retention_Status ,
                    NULL)  
                    WHEN a12.Compliance_control = 'Data Subject Rights'                         THEN IF(a11.Data_Subject_Rights_Status <> '',
                    a11.Data_Subject_Rights_Status ,
                    NULL)  
                    WHEN a12.Compliance_control = 'Inventory'                                   THEN IF(a11.Inventory_Status <> '',
                    a11.Inventory_Status ,
                    NULL)  
                    WHEN a12.Compliance_control = 'Lawful basis'                                THEN IF(a11.Lawfulness_Basis_Status <> '',
                    a11.Lawfulness_Basis_Status ,
                    NULL)  
                    WHEN a12.Compliance_control = 'Minimization'                                THEN IF(a11.Minimization_Status <> '',
                    a11.Minimization_Status ,
                    NULL)  
                    WHEN a12.Compliance_control = 'Notices'                                     THEN IF(a11.Notice_Status <> '',
                    a11.Notice_Status ,
                    NULL)  
                    WHEN a12.Compliance_control = 'Reasonable Information Security Controls'    THEN IF(a11.Reasonable_InfoSec_Status <> '',
                    a11.Reasonable_InfoSec_Status ,
                    NULL)  
                    WHEN a12.Compliance_control = 'Vendors'                                     THEN IF(a11.Vendors_Status <> '',
                    a11.Vendors_Status ,
                    NULL)  
                    WHEN a12.Compliance_control = 'Data Privacy Impact Assessment'              THEN IF(a11.DPIA_Status <> '',
                    a11.DPIA_Status ,
                    NULL)  
                    ELSE NULL 
                END) as control_result

,a11.*,a12.Compliance_control from png_mdsdb.pg_ot_processing_activities_inventory_final a11                 
INNER JOIN png_mdsdb.pg_ot_compliance_controls_final  a12
ON 1=1 
where a11.cdctype ='X' and a12.cdctype ='X'
)   src
LEFT JOIN  png_mdwdb.d_png_ot_processing_activity_validation_control_c trgt
on CONCAT(src.Inventory_Id,'~',sha1(lower(src.Compliance_control)))=trgt.row_id 
and src.sourceinstance = trgt.source_id
where
trgt.soft_deleted_flag ='N' and
CASE   
                    WHEN src.control_result like '%NOT%APPLICABLE%' THEN 'Not Applicable'  
                    WHEN src.control_result like '%NOT%START%' THEN 'Not Started'  
                    WHEN src.control_result like '%PROGRESS%' THEN 'In Progress'  
                    WHEN src.control_result like '%NOT%NEED%' THEN 'Not Needed'  
                    WHEN src.control_result like '%DEVIATION%' THEN 'Deviation'  
                    WHEN src.control_result like '%ALIGNED%' THEN 'Aligned'  
                    ELSE 'UNSPECIFIED' 
                END  <>trgt.control_result;