SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Data Mismatch' ELSE 'SUCCESS' END as Message
 FROM paloalto_mdsdb.sm_ppm_it_master_final a
 join paloalto_mdwdb.d_work_item_initiative_c b
 on a.Primary=b.row_id and a.sourceinstance=b.source_id
 where                  COALESCE(case 
                    when a.Revised_Delivery_QTR is null then a.Commit_Quarter 
                    else a.Revised_Delivery_QTR 
                end,
                'UNSPECIFIED')<>b.current_fiscal_quarter_c;