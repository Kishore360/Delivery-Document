
SELECT CASE WHEN count(1)<1000 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1)<1000 THEN 'Data in Sys Audit Table is not extracted properly' ELSE 'SUCCESS' END as Message  
   from molinahealth_mdsdb.sys_audit_final  
 