select CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_ama_inventory_c_fact.control_count_ok_blue_c' ELSE 'SUCCESS' END as Message 
FROM 
png_jul_mdwdb.f_ama_inventory_c_fact f
JOIN (SELECT coalesce(SUM(CASE 
                WHEN ( a.control_result_c like '%ALIGNED%' ) 
                and a.control_in_scope_c ='TRUE' THEN 1 
                ELSE 0 
            END),0) AS cnt_ok_b, inventory_id
FROM			
(SELECT a1.inventory_id, UPPER(CASE                    
                WHEN a2.compliance_control = 'Data breach response'  THEN IF(a1.data_breach_response_status <> '',
                a1.data_breach_response_status ,
                'UNSPECIFIED')                     
                WHEN a2.compliance_control = 'Data Retention'   THEN IF(a1.data_retention_status <> '',
                a1.data_retention_status ,
                'UNSPECIFIED')                      
                WHEN a2.compliance_control = 'Data Subject Rights' THEN IF(a1.data_subject_rights_status <> '',
                a1.data_subject_rights_status ,
                'UNSPECIFIED')                       
                WHEN a2.compliance_control = 'Inventory'  THEN IF(a1.inventory_status <> '',
                a1.inventory_status ,
                'UNSPECIFIED')                      
                WHEN a2.compliance_control = 'Lawful basis' THEN IF(a1.lawfulness_basis_status <> '',
                a1.lawfulness_basis_status ,
                'UNSPECIFIED')                       
                WHEN a2.compliance_control = 'Minimization' THEN IF(a1.minimization_status <> '',
                a1.minimization_status ,
                'UNSPECIFIED')                        
                WHEN a2.compliance_control = 'Notices'  THEN IF(a1.notice_status <> '',
                a1.notice_status ,
                'UNSPECIFIED')                      
                WHEN a2.compliance_control = 'Reasonable Information Security Controls' THEN IF(a1.reasonable_infosec_status <> '',
                a1.reasonable_infosec_status ,
                'UNSPECIFIED')                       
                WHEN a2.compliance_control = 'Vendors'     THEN IF(a1.vendors_status <> '',
                a1.vendors_status ,
                'UNSPECIFIED')                 
                WHEN a2.compliance_control = 'Data Localization'     THEN IF(a1.data_localization_data_transfer_status <> '',
                a1.data_localization_data_transfer_status ,
                'UNSPECIFIED')                      
                ELSE 'UNSPECIFIED'              
            END) as control_result_c 
                , CASE  
                WHEN a2.compliance_control = 'Inventory'  THEN (CASE 
                    WHEN a1.vendor_qualification = 'DATA CONTROLLER'   
                    and a1.vendor_involved = 'TRUE' THEN 'TRUE'   
                    WHEN( a1.vendor_qualification in ('DATA PROCESSOR',
                    'TO BE CLARIFIED')  
                    OR a1.vendor_qualification is NULL ) 
                    and a1.vendor_involved ='TRUE' THEN 'TRUE' 
                    WHEN a1.vendor_involved ='FALSE' 
                    OR a1.vendor_involved is NULL THEN 'TRUE' 
                    ELSE 'FALSE' 
                END)  
                WHEN a2.compliance_control in ('Data Retention',
                'Minimization',
                'Notices',
                'Reasonable Information Security Controls',
                'Lawful basis',
                'Data breach response',
                'Data Localization',
                'Data Subject Rights') THEN (CASE   
                    WHEN (a1.vendor_qualification in ('DATA PROCESSOR',
                    'TO BE CLARIFIED')  
                    OR a1.vendor_qualification is NULL)   
                    and a1.vendor_involved ='TRUE' THEN 'TRUE' 
                    WHEN a1.vendor_involved ='FALSE' 
                    OR a1.vendor_involved is NULL THEN 'TRUE'  
                    ELSE 'FALSE' 
                END) 
                WHEN a2.compliance_control ='Vendors' THEN  (CASE 
                    WHEN ((a1.vendor_qualification in ('DATA CONTROLLER',
                    'DATA PROCESSOR')) 
                    AND (a1.vendor_involved='TRUE')) then 'TRUE' 
                    WHEN (((a1.vendor_qualification = 'TO BE CLARIFIED') 
                    or ( a1.vendor_qualification is NULL)) 
                    and  a1.vendor_involved='TRUE' ) then 'TRUE' 
                    else 'FALSE' 
                end)  
                ELSE 'FALSE' 
            END as control_in_scope_c		
FROM
            png_mdsdb.pg_ot_ama_processing_activity_inventory_c_final a1      
        INNER JOIN
            png_mdsdb.pg_ot_privacy_compliance_controls_c_final a2 
                ON a2.region ='ama' 
                and a2.cdctype ='X' )a GROUP BY a.inventory_id	) t on f.row_id=t.inventory_id
where f.control_count_ok_blue_c <> t.cnt_ok_b
			