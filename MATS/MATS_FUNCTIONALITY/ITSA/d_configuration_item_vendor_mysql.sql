SELECT  CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed between cmdb_ci_final and d_configuration_item' ELSE 'SUCCESS' END AS Message
  from ( select S.sys_id from cardinalhealth_mdsdb.cmdb_ci_final S
left join <<tenant>>_mdsdb.core_company_final CCF_VEN
on (CCF_VEN.sys_id = S.vendor )
  where S.sys_id not in
 (select row_id from cardinalhealth_mdwdb.d_configuration_item)
union 
select S.sourceinstance from cardinalhealth_mdsdb.cmdb_ci_final S
left join <<tenant>>_mdsdb.core_company_final CCF_VEN
on (CCF_VEN.sys_id = S.vendor ) where S.sourceinstance not in
 (select   source_id from cardinalhealth_mdwdb.d_configuration_item)
union 
select sys_class_name from cardinalhealth_mdsdb.cmdb_ci_final S
left join <<tenant>>_mdsdb.core_company_final CCF_VEN
on (CCF_VEN.sys_id = S.vendor ) where CCF_VEN.name not in
 (select  vendor class from cardinalhealth_mdwdb.d_configuration_item)) a
 