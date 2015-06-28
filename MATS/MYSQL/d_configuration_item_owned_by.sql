





SELECT  CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN cnt > 0 THEN 'MDS to DWH data validation failed between cmdb_ci_final and d_configuration_item' ELSE 'SUCCESS' END AS Message from
(select COUNT(1) cnt from (
SELECT A.ABC,A.DEF FROM 
(select concat(ifnull(S.sys_id,''),ifnull(S.sourceinstance,''),ifnull(concat(concat(SYF_OWN.first_name,' '),SYF_OWN.last_name),'')) ABC,
concat(
ifnull(DWH.row_id,''),
ifnull(DWH.source_id,''),
ifnull(DWH.owned_by,'') )DEF
FROM <<tenant>>_mdsdb.cmdb_ci_final S

left join <<tenant>>_mdsdb.sys_user_final SYF
on (SYF.sys_id  = S.assigned_to )

left join <<tenant>>_mdsdb.sys_user_final SYF_OWN
on (SYF_OWN.sys_id  = S.owned_by )
join <<tenant>>_mdwdb.d_configuration_item DWH
on   S.sys_id=DWH.row_id and S.sourceinstance=DWH.source_id)A
WHERE A.ABC<>A.DEF)b)c