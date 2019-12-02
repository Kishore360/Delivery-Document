SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
  FROM( select count(1) as cnt from 
  whirlpool_mdsdb.cmdb_ci_final SRC
  left join whirlpool_mdwdb.d_configuration_item TRGT
  on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
  where SRC.name<>TRGT.name and SRC.cdctype='X')ma

