


SELECT CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result , CASE WHEN COUNT(1) > 0 THEN 'Pass through columns from DS_DOMAIN to D_DOMAIN did not match' ELSE 'SUCCESS' END AS Message FROM <<tenant>>_mdwdb.ds_domain WHERE CRC32(CONCAT( IFNULL(row_id,''), IFNULL(source_id,''), IFNULL(domain_value,''), IFNULL(domain_name,''), IFNULL(soft_deleted_flag,''), IFNULL(created_by,''), IFNULL(changed_by,''), IFNULL(created_on,''), IFNULL(changed_on,''))) NOT IN (SELECT CRC32(CONCAT( IFNULL(row_id,''), IFNULL(source_id,''), IFNULL(domain_value,''), IFNULL(domain_name,''), IFNULL(soft_deleted_flag,''), IFNULL(created_by,''), IFNULL(changed_by,''), IFNULL(created_on,''), IFNULL(changed_on,''))) FROM <<tenant>>_mdwdb.d_domain)
