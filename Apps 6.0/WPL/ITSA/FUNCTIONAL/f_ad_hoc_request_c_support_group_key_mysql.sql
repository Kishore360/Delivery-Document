SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
  CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed for f_ad_hoc_request_c.support_group_key' ELSE 'SUCCESS' END as Message from(
  SELECT count(1) as cnt 
  from
  wpl_mdsdb.u_ad_hoc_request_final b
  join wpl_mdsdb.cmdb_ci_final cmdb_ci 
 ON b.cmdb_ci = cmdb_ci.sys_id and b.sourceinstance=cmdb_ci.sourceinstance
 join wpl_mdwdb.f_ad_hoc_request_c a
 on a.row_id=b.sys_id
 and a.source_id=b.sourceinstance
  JOIN wpl_mdwdb.d_internal_organization LKP 
  ON (COALESCE(CONCAT('GROUP~',cmdb_ci.support_group),'UNSPECIFIED'))= LKP.row_id 
 AND b.sourceinstance= LKP.source_id 
  WHERE COALESCE(LKP.row_key,CASE WHEN support_group is null THEN 0 else -1 end) <> (a.support_group_key)
  and b.cdctype='X')x
  
  
 