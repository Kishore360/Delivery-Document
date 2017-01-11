 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from
cardinalhealth_mdwdb.d_configuration_item d
JOIN cardinalhealth_mdsdb.cmdb_ci_final t ON d.row_id = t.sys_id
	AND d.source_id=t.sourceinstance
LEFT JOIN cardinalhealth_mdsdb.cmdb_ci_application_final ccaf ON d.row_id = ccaf.sys_id
	AND d.source_id=ccaf.sourceinstance
LEFT JOIN cardinalhealth_mdsdb.sys_user_final suo ON t.owned_by=suo.sys_id
	AND t.sourceinstance=suo.sourceinstance
LEFT JOIN cardinalhealth_mdsdb.sys_user_final svp ON suo.u_vp=svp.sys_id
	AND svp.sourceinstance=suo.sourceinstance
join cardinalhealth_mdwdb.d_internal_contact lkp
on lkp.row_id=COALESCE(concat('INTERNAL_CONTACT~',ccaf.u_business_contacts),'UNSPECIFIED')
where  coalesce(lkp.row_key,case when ccaf.u_business_contacts is null then 0 else -1 end) <>
 d.business_contacts_c_key)c
 
 
 
 