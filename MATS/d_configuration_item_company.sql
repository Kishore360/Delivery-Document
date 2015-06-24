

SELECT  CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed between cmdb_ci_final and d_configuration_item' ELSE 'SUCCESS' END AS Message 
FROM <<tenant>>_mdsdb.cmdb_ci_final S

left join <<tenant>>_mdsdb.core_company_final CCF_COM
on (CCF_COM.sys_id  = S.company )

where (concat(
ifnull(S.sys_id,''),
ifnull(S.sourceinstance,''),
ifnull(CCF_COM.name,'') ))not in (
select (concat(
ifnull(DWH.row_id,''),
ifnull(DWH.source_id,''),
ifnull(DWH.company,'') )) from <<tenant>>_mdwdb.d_configuration_item DWH);
