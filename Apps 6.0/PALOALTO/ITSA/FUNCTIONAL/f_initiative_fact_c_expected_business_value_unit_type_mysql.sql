SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Data Mismatch' ELSE 'SUCCESS' END as Message
 FROM paloalto_mdsdb.sm_ppm_it_master_final a
 join paloalto_mdwdb.f_initiative_fact_c b
 on a.Primary=b.row_id and a.sourceinstance=b.source_id
 where  CASE 
                    WHEN a.Business_Value_Category LIKE '%N/A%' THEN 'N/A' 
                    WHEN a.Business_Value_Category LIKE '%hrs%' THEN 'hrs' 
                    WHEN a.Business_Value_Category LIKE '%$ Value%' THEN '$' 
                    ELSE 'UNSPECIFIED' 
                END <>b.expected_business_value_unit_type;