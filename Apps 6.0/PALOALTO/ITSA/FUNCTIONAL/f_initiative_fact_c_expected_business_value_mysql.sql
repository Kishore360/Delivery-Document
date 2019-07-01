SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Data Mismatch' ELSE 'SUCCESS' END as Message
 FROM paloalto_mdsdb.sm_ppm_it_master_final a
 join paloalto_mdwdb.f_initiative_fact_c b
 on a.Primary=b.row_id and a.sourceinstance=b.source_id
 where case 
                    when a.Business_Value_Category like '%N/A%' then substring_index(a.Hours_Saved_or_Cost_Savings,
                    '$',
                    -1) 
                    when a.Business_Value_Category like '%hrs%' 
                    and a.Hours_Saved_or_Cost_Savings like '%$%' then substring_index(a.Hours_Saved_or_Cost_Savings,
                    '$',
                    -1) 
                    when a.Business_Value_Category like '%$ Value%' then substring_index(a.Hours_Saved_or_Cost_Savings,
                    '$',
                    -1) 
                end <>b.expected_business_value;