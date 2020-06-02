SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.manufacturer' ELSE 'SUCCESS' END as Message
from
(select count(1) as CNT from  equifax_mdsdb.cmdb_ci_final  SRC
LEFT JOIN equifax_mdsdb.core_company_final LKP
ON SRC.manufacturer = LKP.sys_id and SRC.sourceinstance = LKP.sourceinstance
left join equifax_mdwdb.d_configuration_item TRGT on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where coalesce(LKP.name,'UNSPECIFIED')<>TRGT.manufacturer AND SRC.cdctype<>'D'
)temp;