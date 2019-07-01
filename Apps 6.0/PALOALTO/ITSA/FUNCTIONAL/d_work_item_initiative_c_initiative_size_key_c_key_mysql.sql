SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Data Mismatch' ELSE 'SUCCESS' END as Message
-- select distinct a.urgency,COALESCE(CONCAT('URGENCY','~','INCIDENT_TASKS','~',UPPER(a.urgency)),'UNSPECIFIED') erowid,c.row_id,c.row_key,b.urgency_src_key
 FROM paloalto_mdsdb.sm_ppm_it_master_final a
 join paloalto_mdwdb.d_work_item_initiative_c b
 on a.Primary=b.row_id and a.sourceinstance=b.source_id
 left join paloalto_mdwdb.d_lov c
 on COALESCE(CONCAT('INITIATIVE~SIZE', '~',a.Project_Size),'UNSPECIFIED')=c.row_id and a.sourceinstance=c.source_id
 where COALESCE(c.row_key,case when a.Project_Size is null then 0 else -1 end)<>b.initiative_size_key_c_key
 and a.CDCTYPE='X';
 