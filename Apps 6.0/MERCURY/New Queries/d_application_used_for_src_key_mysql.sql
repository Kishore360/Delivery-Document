 SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt 
from 
(SELECT sys_id, sourceinstance
FROM mercury_mdsdb.cmdb_ci_appl_final
UNION
SELECT A.sys_id, A.sourceinstance FROM mercury_mdsdb.cmdb_ci_appl_final A
JOIN mercury_mdsdb.sys_choice_final syd_1 on syd_1.element = 'operational_status' and syd_1.name = 'cmdb_ci' and syd_1.value = A.operational_status
UNION
SELECT A.sys_id, A.sourceinstance FROM mercury_mdsdb.cmdb_ci_appl_final A
JOIN mercury_mdsdb.sys_choice_delta syd_2 on syd_2.element = 'install_status' and syd_2.name = 'cmdb_ci' and syd_2.value = A.install_status
UNION
SELECT A.sys_id, A.sourceinstance FROM mercury_mdsdb.cmdb_ci_appl_final A
JOIN mercury_mdsdb.cmn_location_final loc on A.location = loc.sys_id AND A.sourceinstance = loc.sourceinstance
UNION
SELECT A.sys_id, A.sourceinstance FROM mercury_mdsdb.cmdb_ci_appl_final A
JOIN mercury_mdsdb.core_company_final comp on A.vendor = comp.sys_id AND A.sourceinstance = comp.sourceinstance
UNION
SELECT A.sys_id, A.sourceinstance FROM mercury_mdsdb.cmdb_ci_appl_final A
JOIN mercury_mdsdb.sys_user_final asgn on A.assigned_to = asgn.sys_id AND A.sourceinstance = asgn.sourceinstance
UNION
SELECT A.sys_id, A.sourceinstance FROM mercury_mdsdb.cmdb_ci_appl_final A
JOIN mercury_mdsdb.sys_user_final m on A.managed_by = m.sys_id AND A.sourceinstance = m.sourceinstance
UNION
SELECT A.sys_id, A.sourceinstance FROM mercury_mdsdb.cmdb_ci_appl_final A
JOIN mercury_mdsdb.sys_user_final ow on A.owned_by = ow.sys_id AND A.sourceinstance = ow.sourceinstance
UNION
SELECT A.sys_id, A.sourceinstance FROM mercury_mdsdb.cmdb_ci_appl_final A
JOIN mercury_mdsdb.sys_user_final sb on A.supported_by = sb.sys_id AND A.sourceinstance = sb.sourceinstance
UNION
SELECT A.sys_id, A.sourceinstance FROM mercury_mdsdb.cmdb_ci_appl_final A
JOIN mercury_mdsdb.core_company_final cmp on A.company = cmp.sys_id AND A.sourceinstance = cmp.sourceinstance
UNION
SELECT A.sys_id, A.sourceinstance FROM mercury_mdsdb.cmdb_ci_appl_final A
JOIN mercury_mdsdb.core_company_final manu on A.manufacturer = manu.sys_id AND A.sourceinstance = manu.sourceinstance
UNION
SELECT A.sys_id, A.sourceinstance FROM mercury_mdsdb.cmdb_ci_appl_final A
JOIN mercury_mdsdb.sys_user_group_final grp on A.support_group = grp.sys_id AND A.sourceinstance = grp.sourceinstance
UNION
SELECT A.sys_id, A.sourceinstance FROM mercury_mdsdb.cmdb_ci_appl_final A
JOIN mercury_mdsdb.cmn_department_final dept on A.department = dept.sys_id AND A.sourceinstance = dept.sourceinstance
)Driver
join mercury_mdsdb.cmdb_ci_appl_final SRC
ON SRC.sys_id = Driver.sys_ID AND SRC.sourceinstance = Driver.sourceinstance
join mercury_mdwdb.d_application TGT
ON TGT.row_id = concat('APPLICATION~',ifnull(Driver.sys_id,'')) 
AND TGT.source_id = Driver.sourceinstance
join mercury_mdwdb.d_lov lkp
on COALESCE(UPPER(CONCAT('USED_FOR~business_service~',SRC.used_for)),'UNSPECIFIED') = lkp.row_id
where  COALESCE(lkp.row_key,case when SRC.used_for is null then 0 else -1 end)	<>TGT.used_for_src_key

 )c
		
