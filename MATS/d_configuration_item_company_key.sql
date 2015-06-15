

SELECT  CASE WHEN COUNT(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN COUNT(1) > 0 THEN 'MDS to DWH data validation failed between cmdb_ci_final and d_configuration_item' ELSE 'SUCCESS' END AS Message 
FROM <<tenant>>_mdsdb.cmdb_ci_final S

left join d_internal_organization DIO_C
on (convert(DIO_C.row_id using utf8) = convert(S.company using utf8)
and convert(DIO_C.source_id using utf8) = convert((case when S.company is null then 0 else S.sourceinstance end) )using utf8) 

where convert(concat(
ifnull(S.sys_id,''),
ifnull(S.sourceinstance,''),
ifnull(DIO_C.row_key,'-1') )using utf8)not in (
select convert(concat(
ifnull(DWH.row_id,''),
ifnull(DWH.source_id,''),
ifnull(DWH.company_key,'') )using utf8) from <<tenant>>_mdwdb.d_configuration_item DWH);
