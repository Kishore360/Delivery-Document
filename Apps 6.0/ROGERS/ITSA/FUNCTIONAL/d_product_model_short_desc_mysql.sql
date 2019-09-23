SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message from (
select count(1) cnt
        FROM
     rogers6_mdwdb.d_product_model d 
JOIN rogers6_mdsdb.cmdb_model_final p ON d.row_id=sys_id 
where short_desc <> short_description 
and p.cdctype='X' )a




