SELECT CASE WHEN cnt THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN cnt THEN 'MDS to DWH data validation failed for f_incident.incident_key' ELSE 'SUCCESS' END as Message from (select count(1) cnt 
 FROM 
   mcdonalds_mdsdb.change_request_final a
  left join mcdonalds_mdsdb.cmdb_ci_final b  ON a.cmdb_ci=b.sys_id and a.sourceinstance=b.sourceinstance
  left join mcdonalds_mdwdb.d_location c on concat('CMDB_LOCATION_C~',b.u_site_location)=c.row_id
  left join mcdonalds_mdwdb.d_configuration_item d on b.sys_id=d.row_id and b.sourceinstance=d.source_id
  left join mcdonalds_mdwdb.f_change_request f on a.sys_id=f.row_id and a.sourceinstance=f.source_id
  where  coalesce(c.row_key,case when u_site_location is null then 0 else -1 end )<>d.cmdb_location_c_key;