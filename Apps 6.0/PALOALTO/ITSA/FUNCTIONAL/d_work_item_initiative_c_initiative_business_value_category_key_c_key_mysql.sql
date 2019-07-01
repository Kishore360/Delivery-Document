SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Data Mismatch' ELSE 'SUCCESS' END as Message
 FROM paloalto_mdsdb.sm_ppm_it_master_final a
 join paloalto_mdwdb.d_work_item_initiative_c b
 on a.Primary=b.row_id and a.sourceinstance=b.source_id
 left join paloalto_mdwdb.d_lov c
 on COALESCE(concat('INITIATIVE~BVCATEGORY','~',a.Business_Value_Category),'UNSPECIFIED')=c.row_id and a.sourceinstance=c.source_id
 where COALESCE(c.row_key,case when a.Business_Value_Category is null then 0 else -1 end)<>b.initiative_business_value_category_key_c_key
 and a.CDCTYPE='X';