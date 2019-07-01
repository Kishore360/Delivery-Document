SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Data Mismatch' ELSE 'SUCCESS' END as Message
 FROM paloalto_mdsdb.us_lp_module_level1_c_final a
 join paloalto_mdwdb.d_lp_module_level1_c b
 on a.row_id=b.row_id and a.sourceinstance=b.source_id
 where a.level2_id<>b.level2_id;