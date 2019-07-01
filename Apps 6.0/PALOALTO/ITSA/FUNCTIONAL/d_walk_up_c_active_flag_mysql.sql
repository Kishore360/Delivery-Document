SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Data Mismatch' ELSE 'SUCCESS' END as Message
 -- select distinct a.active,b.active_flag
 FROM paloalto_mdsdb.u_walk_up_final a
 join paloalto_mdwdb.d_walk_up_c b
 on a.sys_id=b.row_id and a.sourceinstance=b.source_id
 where IF(a.active = 1,
                'Y',
                'N')<>b.active_flag
and a.cdctype='X';