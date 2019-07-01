SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Data Mismatch' ELSE 'SUCCESS' END as Message
-- select distinct a.Commit,a.Project_Size,a.Strategic_Imperatives,b.key_project_c
 FROM paloalto_mdsdb.sm_ppm_it_master_final a
 join paloalto_mdwdb.d_work_item_initiative_c b
 on a.Primary=b.row_id and a.sourceinstance=b.source_id
 where case 
                    when upper(a.Commit)='YES' 
                    and upper(a.Project_Size)='LARGE' 
                    and upper(a.Strategic_Imperatives)=upper('go for glory(transform)') then 'Y' 
                    else 'N' 
                end  <>b.key_project_c
and a.cdctype='X';