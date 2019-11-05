SELECT CASE WHEN cnt>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt>0 THEN 'MDS to DWH data validation failed for d_product_model.short_desc' ELSE 'SUCCESS' END as Message 
 FROM (select count(1) as cnt from 
 whirlpool_mdsdb.cmdb_model_final a11
 left join whirlpool_workdb.d_product_model a12
 ON a11.sys_id = a12.row_id  AND a11.sourceinstance = a12.source_id
where a11.short_description<>a12.short_desc
 )ma
  ;


