SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for d_product_model.short_desc ' ELSE 'SUCCESS' END as Message
 from(select count(1) as cnt from ibmwatson_mdsdb.cmdb_model_final src
 left join ibmwatson_mdwdb.d_product_model trgt on src.sys_id=trgt.row_id and src.sourceinstance=trgt.source_id
 where src.name<>trgt.model_c )ma