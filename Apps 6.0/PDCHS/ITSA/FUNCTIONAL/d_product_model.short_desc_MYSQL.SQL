SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_product_model.short_desc' ELSE 'SUCCESS' END as Message
from
(select count(1) as CNT from  pdchs_mdsdb.cmdb_model_final	 SRC
left join pdchs_mdwdb.d_product_model TRGT on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
where coalesce(SRC.short_description,'UNSPECIFIED')<>TRGT.short_desc	 
AND SRC.CDCTYPE<>'D'
)temp;

