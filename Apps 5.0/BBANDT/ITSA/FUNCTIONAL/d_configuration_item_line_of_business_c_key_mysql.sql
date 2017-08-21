

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_configuration_item.line_of_business_c_key' ELSE 'SUCCESS' END as Message
 FROM
 bbandt_mdsdb.cmdb_ci_final src 
left join bbandt_mdsdb.cmdb_ci_spkg_final ccsd on src.u_cmdb_sys_id=ccsd.sys_id and src.sourceinstance=ccsd.sourceinstance
 join bbandt_mdwdb.d_configuration_item trgt
on trgt.row_id = src.sys_id and trgt.source_id = src.sourceinstance
 join bbandt_mdwdb.d_line_of_business_c lkp
  ON (COALESCE(ccsd.u_line_of_business,'UNSPECIFIED') =lkp.row_id  
 AND ccsd.sourceinstance= lkp.source_id)
 WHERE COALESCE(lkp.row_key,case when ccsd.u_line_of_business is null then 0 else -1 end) <> COALESCE(trgt.line_of_business_c_key)
 
 
 

 
 

 
 