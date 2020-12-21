select CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_ama_inventory_c_fact.denominator_for_cal_c' ELSE 'SUCCESS' END as Message 
FROM 
png_jul_mdwdb.f_ama_inventory_c_fact f
JOIN (SELECT (SUM(CASE 
                WHEN a.control_in_scope_c ='TRUE' THEN 1 
                ELSE 0 
            END)) AS denominator_for_cal_c, inventory_id
FROM			
(SELECT a1.inventory_id,  CASE  
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
where f.denominator_for_cal_c <> t.denominator_for_cal_c
			