SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN cnt THEN 'MDS to DWH data validation failed for d_configuration_item.platform_c' ELSE 'SUCCESS' END as Message from 
(select count(1) cnt  
 FROM  usf_mdsdb.cmdb_ci_computer_final SRC   
 JOIN usf_mdwdb.d_configuration_item TRGT  
 ON (SRC.sys_id =TRGT.row_id   AND SRC.sourceinstance= TRGT.source_id  ) 
 WHERE SRC.u_platform<> TRGT.platform_c)b;
