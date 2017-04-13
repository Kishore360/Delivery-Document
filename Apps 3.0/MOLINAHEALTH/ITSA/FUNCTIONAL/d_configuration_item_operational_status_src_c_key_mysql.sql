

SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.sub_category_src_key' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM molinahealth_mdsdb.cmdb_ci_final SRC 
 left join molinahealth_mdwdb.d_lov d on 
 concat('OPERATIONAL_STATUS~CMDB_CI~~~',SRC.operational_status) = d.row_id and SRC.sourceinstance=d.source_id
  JOIN molinahealth_mdwdb.d_configuration_item TRGT 
   ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
 WHERE  coalesce(d.row_key,case when operational_status is null then 0 else -1 end )  <> (TRGT.operational_status_src_c_key))b

 
 