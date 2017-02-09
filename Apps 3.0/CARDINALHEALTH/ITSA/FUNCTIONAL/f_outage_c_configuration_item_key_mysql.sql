 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM cardinalhealth_mdsdb.cmdb_ci_outage_final SRC 
 LEFT JOIN cardinalhealth_mdwdb.f_outage_c TRGT 
 ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
join cardinalhealth_mdwdb.d_configuration_item lkp
on lkp.row_id=COALESCE(SRC.cmdb_ci,'UNSPECIFIED') and SRC.sourceinstance=lkp.source_id
where COALESCE(lkp.row_key,CASE WHEN SRC.cmdb_ci IS NULL THEN 0 else -1 end) <> TRGT.configuration_item_key





