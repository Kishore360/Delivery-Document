 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt from usf_mdwdb.d_master_item a INNER JOIN
usf_mdsdb.sc_cat_item_final b ON a.row_id = b.sys_id AND a.source_id = b.sourceinstance
where a.item_type_c <> b.u_item_type) c;
