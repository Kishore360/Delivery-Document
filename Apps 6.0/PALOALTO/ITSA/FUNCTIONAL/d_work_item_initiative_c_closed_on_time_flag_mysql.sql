SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Data Mismatch' ELSE 'SUCCESS' END as Message
 FROM paloalto_mdsdb.sm_ppm_it_master_final a
 join paloalto_mdwdb.d_work_item_initiative_c b
 on a.Primary=b.row_id and a.sourceinstance=b.source_id
 where     CASE 
            WHEN b.planned_end_date_c>=b.actual_end_date_c 
            AND DATEDIFF(DATE(b.planned_end_date_c)+3,
            b.actual_end_date_c)>=0 THEN 'Y' 
            ELSE 'N' end <>b.closed_on_time_flag;