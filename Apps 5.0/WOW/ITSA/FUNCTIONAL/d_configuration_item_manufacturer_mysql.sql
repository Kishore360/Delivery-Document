SELECT  CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed between cmdb_ci_final and d_configuration_item' ELSE 'SUCCESS' END AS Message
FROM wow_mdsdb.cmdb_ci_final S
left join wow_mdsdb.core_company_final CCF
on (CCF.sys_id ) = (S.manufacturer )
join wow_mdwdb.d_configuration_item DWH
on S.sys_id=DWH.row_id and S.sourceinstance=DWH.source_id
where CCF.name<>DWH.manufacturer;