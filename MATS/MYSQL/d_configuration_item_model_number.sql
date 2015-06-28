




SELECT  CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN cnt > 0 THEN 'MDS to DWH data validation failed between cmdb_ci_final and d_configuration_item' ELSE 'SUCCESS' END AS Message from
(select COUNT(1) cnt from (
SELECT A.ABC,A.DEF FROM 
(select concat(
ifnull(S.sys_id,''),
ifnull(S.sourceinstance,''),
ifnull(S.model_number,'') ) ABC,
concat(
ifnull(DWH.row_id,''),
ifnull(DWH.source_id,''),
ifnull(DWH.model_number,'') )DEF
FROM <<tenant>>_mdsdb.cmdb_ci_final S
JOIN <<tenant>>_mdwdb.d_configuration_item DWH
 on   S.sys_id=DWH.row_id and S.sourceinstance=DWH.source_id)A
WHERE A.ABC<>A.DEF)b)c