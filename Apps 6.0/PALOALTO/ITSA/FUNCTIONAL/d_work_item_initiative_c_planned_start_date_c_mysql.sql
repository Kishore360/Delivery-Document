SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Data Mismatch' ELSE 'SUCCESS' END as Message
 FROM paloalto_mdsdb.sm_ppm_it_master_final a
 join paloalto_mdwdb.d_work_item_initiative_c b
 on a.Primary=b.row_id and a.sourceinstance=b.source_id
 where case when a.Revised_Start_Date is null then STR_TO_DATE(a.Start_Date,
                    '%Y-%m-%d') 
                    else STR_TO_DATE(a.Revised_Start_Date,
                    '%Y-%m-%d') 
                end<>b.planned_start_date_c;