SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Data Mismatch' ELSE 'SUCCESS' END as Message
 -- select a.work_item_initiative_c_key,b.work_item_initiative_c_key
 from paloalto_mdsdb.sys_user_final a
 join paloalto_mdwdb.d_internal_contact b
 on concat('INTERNAL_CONTACT~',a.sys_id)=b.row_id and a.sourceinstance=b.source_id
 where a.u_region<>b.region_c;