
 SELECT CASE WHEN count(1) > 0 THEN 'FaILURE' ELSE 'SUCCESS' END aS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END aS Message  from 
  wow_mdsdb.cmdb_ci_service_final  src
 JOIN wow_mdwdb.d_cmdb_ci_service_c trgt
on trgt.row_id= src.sys_id and trgt.source_id = src.sourceinstance
where trgt.name<>src.name;