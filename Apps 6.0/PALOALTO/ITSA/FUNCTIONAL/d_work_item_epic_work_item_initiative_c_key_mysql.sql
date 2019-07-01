SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Data Mismatch' ELSE 'SUCCESS' END as Message
 -- select a.work_item_initiative_c_key,b.work_item_initiative_c_key
 from paloalto_mdwdb.d_work_item_epic a
 join paloalto_mdwdb.f_initiative_epic_c b
 on a.row_key=b.work_item_epic_key and a.row_key not in (0,-1)
 where a.work_item_initiative_c_key<>b.work_item_initiative_c_key
and a.cdctype='X';