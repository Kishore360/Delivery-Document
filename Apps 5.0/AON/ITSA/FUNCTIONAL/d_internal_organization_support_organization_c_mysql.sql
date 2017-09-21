SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
  FROM (select  count(1) as cnt
  FROM aon_mdwdb.d_internal_organization TRGT 
 LEFT JOIN aon_mdsdb.sys_user_group_final SRC
 ON right(TRGT.row_id,32) = SRC.sys_id
	AND TRGT.source_id=SRC.sourceinstance
WHERE TRGT.support_organization_c <> SRC.u_support_organization)t;