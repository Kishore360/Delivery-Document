SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.u_raise_impact_c' ELSE 'SUCCESS' END as Message
FROM
(select * from fidelity_mdsdb.cmdb_ci_appl_final where sys_class_name = 'cmdb_ci_appl') SRC
join
(SELECT parent , child , type,a.sourceinstance,b.child_descriptor from fidelity_mdsdb.cmdb_rel_ci_final a 
join (SELECT sys_id,child_descriptor,name,sourceinstance from fidelity_mdsdb.cmdb_rel_type_final  
where name in ('Contains::Contained by',
'Virtualizes::Virtualized by',
'Uses::Used by',
'Depends on::Used by',
'Runs on::Runs',
'Used by::Uses')) b
on a.type = b.sys_id and a.sourceinstance = b.sourceinstance
WHERE parent is not null and child is not null
group by 1,2) SRC1
on SRC.sys_id = SRC1.child and SRC.sourceinstance = SRC1.sourceinstance
JOIN fidelity_mdwdb.f_cmdb_application_hierarchy_c trgt1
on SRC.sys_id = trgt1.row_id and SRC.sourceinstance = trgt1.source_id
JOIN fidelity_mdwdb.d_application lkp
on COALESCE(CONCAT('APPLICATION~',SRC.sys_id),'UNSPECIFIED')  = lkp.row_id and SRC.sourceinstance = lkp.source_id
WHERE COALESCE(lkp.row_key,case when SRC.sys_id is null then 0 else -1 end) <>trgt1.application_key and SRC.cdctype<>'D'
