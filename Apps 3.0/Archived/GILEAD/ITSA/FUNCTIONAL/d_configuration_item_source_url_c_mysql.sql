SELECT 
CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message 
from gilead_mdsdb.cmdb_ci_final SRC join gilead_mdwdb.d_configuration_item TGT on SRC.sys_id = TGT.row_id and SRC.sourceinstance = TGT.source_id 
where 
TGT.source_url_c <> CONCAT('<a href=\"','https://sparc.service-now.com/nav_to.do?uri=','cmdb_ci.do?sys_id=',SRC.sys_id,'&sysparm_record_target=cmdb_ci\" target=\"_blank\" >',SRC.name,'</a>');