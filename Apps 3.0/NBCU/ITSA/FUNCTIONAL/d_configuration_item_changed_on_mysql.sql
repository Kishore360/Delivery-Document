SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.name' ELSE 'SUCCESS' END as Message
from
(select count(1) as CNT from (select sys_id, sourceinstance,sys_updated_on from nbcu_mdsdb.cmdb_ci_final) SRC
left join  nbcu_mdwdb.d_configuration_item  TRGT
on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.Source_id
where convert_tz(SRC.sys_updated_on, 'GMT', 'America/New_York') <> TRGT.changed_on) temp;