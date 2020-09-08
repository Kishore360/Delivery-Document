SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END
as Message from(
select count(1) as cnt from
 ntrs_mdsdb.cmdb_ci_model_final SRC
 join ntrs_mdwdb.d_cmdb_ci_model_c TRGT 
on SRC.sys_id = TRGT.row_id and SRC.sourceinstance=TRGT.source_id 
where SRC.name<>TRGT.name_c)a;
