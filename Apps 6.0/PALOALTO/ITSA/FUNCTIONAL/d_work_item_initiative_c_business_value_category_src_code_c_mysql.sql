SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Data Mismatch' ELSE 'SUCCESS' END as Message
 -- select distinct a.Business_Value_Category,b.business_value_category_src_code_c
 FROM paloalto_mdsdb.sm_ppm_it_master_final a
 join paloalto_mdwdb.d_work_item_initiative_c b
 on a.Primary=b.row_id and a.sourceinstance=b.source_id
 where coalesce(a.Business_Value_Category,
                'UNSPECIFIED')<>b.business_value_category_src_code_c
and a.cdctype='X';
                