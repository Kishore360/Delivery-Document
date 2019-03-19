SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.vendor' ELSE 'SUCCESS' END as Message
from
(select count(1) as CNT from  equifax_mdsdb.cmdb_ci_final  SRC
left join equifax_mdwdb.d_configuration_item TRGT on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
left join equifax_mdsdb.sys_user_group_final lkp on SRC.vendor=lkp.sys_id
and SRC.sourceinstance=lkp.sourceinstance
where coalesce(lkp.name)<>TRGT.vendor
AND SRC.CDCTYPE<>'D'
)temp;






