 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed ' ELSE 'SUCCESS' END as Message
 FROM svb_mdsdb.cmdb_ci_final SRC
  LEFT JOIN  svb_mdsdb.cmdb_ci_server_final SRC_LKP on SRC.sys_id=SRC_LKP.sys_id
 LEFT JOIN svb_mdwdb.d_configuration_item TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
where SRC_LKP.u_server_category<>TRGT.server_category_c;