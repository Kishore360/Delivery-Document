SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'image_url not correct for d_asset.asset_image_url' ELSE 'SUCCESS' END as Message

from ( SELECT * FROM #MDS_TABLE_SCHEMA.alm_asset_final WHERE CDCTYPE<>'D') SRC
LEFT JOIN #DWH_TABLE_SCHEMA.d_asset TRGT 
ON (concat('ASSET~',SRC.sys_id)=TRGT.row_id 
AND SRC.sourceinstance=TRGT.source_id )
WHERE  

concat('<a href="https://#URL/',replace('alm_asset_final','_final',''),'.do?sys_id=',COALESCE(`sys_id`,'')
,'" style="text-decoration\:none\;color\:\#f01a1a\;"','target="','_blank"','  title="Check in ServiceNow"','><img src=../images/Numerify/snow_url_image.png></a>')
<> COALESCE(TRGT.image_url ,'')