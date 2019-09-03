SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.asset_tag' ELSE 'SUCCESS' END as Message
from
(select COUNT(1) AS CNT  from  equifax_mdsdb.cmdb_ci_final  SRC
left join equifax_mdwdb.d_configuration_item TRGT on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where coalesce(substring(SRC.asset_tag,1,27),'UNSPECIFIED')<>TRGT.asset_tag AND SRC.cdctype<>'D' and length(SRC.asset_tag)>60
)temp;