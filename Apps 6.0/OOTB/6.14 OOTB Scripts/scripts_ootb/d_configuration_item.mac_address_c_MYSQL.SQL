SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.mac_address_c' ELSE 'SUCCESS' END as Message
from
(select count(1) as CNT from  equifax_mdsdb.cmdb_ci_final  SRC
left join equifax_mdwdb.d_configuration_item TRGT on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where coalesce(SRC.mac_address,'UNSPECIFIED')<>TRGT.mac_address_c AND SRC.cdctype<>'D'
)temp;