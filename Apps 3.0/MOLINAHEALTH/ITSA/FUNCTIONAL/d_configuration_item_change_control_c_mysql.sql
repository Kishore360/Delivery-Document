

SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.sub_category_src_key' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM molinahealth_mdsdb.cmdb_ci_final SRC 
  JOIN molinahealth_mdwdb.d_configuration_item TRGT 
   ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE  case when u_change_control='Yes' then 1 else 0 end  <> (TRGT.change_control_c))b

 
 
 
 