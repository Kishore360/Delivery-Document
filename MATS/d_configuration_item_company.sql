

SELECT  CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result,
CASE WHEN cnt > 0 THEN 'MDS to DWH data validation failed between cmdb_ci_final and d_configuration_item' ELSE 'SUCCESS' END AS Message from
(select COUNT(1) cnt from (
SELECT A.ABC,A.DEF FROM 
(select concat(ifnull(S.sys_id,''),ifnull(S.sourceinstance,''),ifnull(CCF_COM.name,'') )ABC ,
concat(ifnull(DWH.row_id,''),ifnull(DWH.source_id,''),ifnull(DWH.company,'') )DEF
from uclahealth_mdsdb.cmdb_ci_final S

left join uclahealth_mdsdb.core_company_final CCF_COM
on (CCF_COM.sys_id  = S.company )
join
uclahealth_mdwdb.d_configuration_item DWH on S.sys_id=DWH.row_id and S.sourceinstance=DWH.source_id)A
WHERE A.ABC<>A.DEF)b)c