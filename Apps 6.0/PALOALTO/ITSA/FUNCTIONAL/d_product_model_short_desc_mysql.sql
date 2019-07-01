SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'Data Mismatch' ELSE 'SUCCESS' END as Message
 FROM paloalto_mdsdb.cmdb_model_final a
 join paloalto_mdwdb.d_product_model b
 on a.sys_id=b.row_id and a.sourceinstance=b.source_id
 where a.short_description<>b.short_desc;