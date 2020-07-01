

 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed ' ELSE 'SUCCESS' END as Message
 FROM   truist_mdsdb.cmdb_ci_final src 
 inner join (select value,label from truist_mdsdb.sys_choice_final where name = 'cmdb_ci' and element = 'operational_status' and language = 'en' and label = 'Operational' group by value) as op on op.value = src.operational_status
inner join (select value,label from truist_mdsdb.sys_choice_final where name = 'cmdb_ci' and element = 'install_status' and language = 'en' and label = 'Installed' group by value) as ins on ins.value = src.install_status
  JOIN truist_mdwdb.d_configuration_item TRGT 
 ON (src.sys_id =TRGT.row_id  
 AND src.sourceinstance= TRGT.source_id  )
where case when src.support_group is null then 'Y' else 'N' end <>TRGT.missing_support_group_c_flag;

