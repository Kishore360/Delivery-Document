
SELECT CASE WHEN count(1)<10000 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1)<10000 THEN 'Data in Sys Audit Table is not extracted properly' ELSE 'SUCCESS' END as Message  
   from <<tenant>>_mdsdb.sys_audit_final  
 