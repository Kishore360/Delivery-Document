

SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.sub_category_src_key' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM <<tenant>>_mdsdb.cmdb_ci_final SRC 
  JOIN <<tenant>>_mdwdb.d_configuration_item TRGT 
   ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE  SRC.subcategory <> (TRGT.subcategory))b

 
 