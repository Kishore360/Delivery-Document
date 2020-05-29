
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_asset.is_warranty_active_flag' ELSE 'SUCCESS' END as Message
 
from  ( SELECT * FROM #MDS_TABLE_SCHEMA.alm_asset_final WHERE CDCTYPE<>'D') SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_asset TRGT 
 ON (concat('ASSET~',SRC.sys_id)=TRGT.row_id 
  AND SRC.sourceinstance=TRGT.source_id )
LEFT join 
 (select source_id,max(lastupdated) as lastupdated from
#DWH_TABLE_SCHEMA.d_o_data_freshness TRGT
group by source_id) FRSH
on FRSH.source_id=SRC.sourceinstance


where (case when SRC.warranty_expiration is  null then null
 when SRC.warranty_expiration is not null and  convert_tz(SRC.warranty_expiration,'<<TENANT_SSI_TIME_ZONE>>','<<DW_TARGET_TIME_ZONE>>')>FRSH.lastupdated then 'Y' else 'N' end)<>
coalesce(TRGT.is_warranty_active_flag,'');
