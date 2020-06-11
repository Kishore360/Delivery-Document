SELECT  CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed between cmdb_ci_final and d_configuration_item' ELSE 'SUCCESS' END AS Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.cmdb_ci_final WHERE CDCTYPE<>'D') S
left join ( SELECT * FROM #MDS_TABLE_SCHEMA.core_company_final WHERE CDCTYPE<>'D') CCF
on (CCF.sys_id  = S.manufacturer )
left outer join  #DWH_TABLE_SCHEMA.d_configuration_item DWH
on DWH.row_id = S.sys_id
where (coalesce(S.sourceinstance,'') <> coalesce(DWH.source_id,''))
and (coalesce(CCF.name,'') <> coalesce(DWH.manufacturer,''));