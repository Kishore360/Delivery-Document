

SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_configuration_item.reputation_risk_c_flag' ELSE 'SUCCESS' END as Message
 FROM
 truist_mdsdb.cmdb_ci_final src 
left join truist_mdsdb.cmdb_ci_spkg_final ccsd on src.u_cmdb_sys_id=ccsd.sys_id and src.sourceinstance=ccsd.sourceinstance
 join truist_mdwdb.d_configuration_item trgt
on trgt.row_id = src.sys_id and trgt.source_id = src.sourceinstance
  WHERE trgt.reputation_risk_c_flag<>IF(ccsd.u_reputation_risk=1,'Y','N');
 
 
 
 
 

 
 

 
 