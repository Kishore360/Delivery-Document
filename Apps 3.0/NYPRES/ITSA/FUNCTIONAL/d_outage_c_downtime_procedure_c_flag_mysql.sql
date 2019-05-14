
   SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_outage.downtime_procedure_c_flag' ELSE 'SUCCESS' END as Message
 -- select CASE WHEN u_downtime_procedure is not null then 'Y' else 'N' END eflag, (TRGT.downtime_procedure_c_flag )  
 FROM nypres_mdsdb.cmdb_ci_outage_final SRC 
 LEFT JOIN nypres_mdwdb.d_outage TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE ( CASE WHEN u_downtime_procedure is not null then 'Y' else 'N' END)<> (TRGT.downtime_procedure_c_flag )
and TRGT.soft_deleted_flag='N' ;
 