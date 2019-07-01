SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Data Mismatch' ELSE 'SUCCESS' END as Message
 FROM paloalto_mdsdb.sm_ppm_it_master_final a
 join paloalto_mdwdb.d_work_item_initiative_c b
 on a.Primary=b.row_id and a.sourceinstance=b.source_id
 where  CASE 
                    WHEN Upper(a.Commit)='YES' THEN 'Y' 
                    ELSE 'N' 
                END<>b.commit_flag;