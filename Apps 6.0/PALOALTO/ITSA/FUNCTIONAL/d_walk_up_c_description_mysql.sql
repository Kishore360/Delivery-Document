SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Data Mismatch' ELSE 'SUCCESS' END as Message
 FROM paloalto_mdsdb.u_walk_up_final a
 join paloalto_mdwdb.d_walk_up_c b
 on a.sys_id=b.row_id and a.sourceinstance=b.source_id
 where a.description<>b.description;