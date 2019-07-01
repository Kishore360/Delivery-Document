SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Data Mismatch' ELSE 'SUCCESS' END as Message
 FROM paloalto_mdsdb.sm_ppm_it_master_final a
 join paloalto_mdwdb.d_work_item_initiative_c b
 on a.Primary=b.row_id and a.sourceinstance=b.source_id
 where  case 
                    when a.Business_Value_Category like '%[$ Value]%' then '$'  
                    when a.Business_Value_Category like '%[hrs]%' then 'hrs' 
                    when a.Business_Value_Category like '%[N/A]%' then 'N/A' 
                    else  'UNSPECIFIED' 
                end <>b.expected_bv_unit_type_c
and a.cdctype='X';