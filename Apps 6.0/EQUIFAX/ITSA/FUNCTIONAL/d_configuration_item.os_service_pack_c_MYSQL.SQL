SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.os_service_pack_c' ELSE 'SUCCESS' END as Message
from
(select count(1) as CNT from (select * from equifax_mdsdb.cmdb_ci_computer_final where CDCTYPE<>'D') SRC
left join equifax_mdwdb.d_configuration_item TRGT on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where coalesce(SRC.os_service_pack,'UNSPECIFIED')<>TRGT.os_service_pack_c and SRC.cdctype<>'D'
)temp;