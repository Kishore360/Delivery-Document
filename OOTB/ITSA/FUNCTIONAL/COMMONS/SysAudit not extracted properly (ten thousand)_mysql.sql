
SELECT CASE WHEN cnt<10000 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt<10000 THEN 'Data in Sys Audit Table is not extracted properly' ELSE 'SUCCESS' END as Message  from
   (select count(1) as cnt from <<tenant>>_mdsdb.sys_audit_final  )a