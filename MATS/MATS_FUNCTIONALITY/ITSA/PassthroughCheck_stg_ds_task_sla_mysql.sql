

SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result, CASE WHEN COUNT(1) > 0 THEN 'Pass through columns from CONTRACT_SLA_final to DS_TASK_SLA did not match' ELSE 'SUCCESS' END AS Message FROM <<tenant>>_mdsdb.contract_sla_final WHERE CRC32(CONCAT( IFNULL(sys_id,''), IFNULL(sourceinstance,''), IFNULL(name,''), IFNULL(start_condition,''), IFNULL(duration_type,''), IFNULL(duration,''), IFNULL(sys_created_by,''), IFNULL(sys_updated_by,''), IFNULL(sys_created_on,''), IFNULL(sys_updated_on,''), IFNULL(sys_domain,''))) NOT IN (SELECT CRC32(CONCAT( IFNULL(row_id,''), IFNULL(source_id,''), IFNULL(sla_name,''), IFNULL(sla_condition,''), IFNULL(duration_type,''), IFNULL(sla_duration,''), IFNULL(created_by,''), IFNULL(changed_by,''), IFNULL(created_on,''), IFNULL(changed_on,''), IFNULL(domain_id,''))) FROM <<tenant>>_mdwdb.ds_task_sla)
