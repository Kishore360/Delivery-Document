
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_security_incident.source_url' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.sn_si_incident_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_security_incident TRGT 
	ON (SRC.sys_id =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
concat('<a href="https://#URL/',replace('sn_si_incident_final','_final',''),'.do?sys_id=',COALESCE(`sys_id`,'')
,'" style="text-decoration\:none\;color\:\#f01a1a\;"','target="','_blank"','  title="Check in ServiceNow"','><img src=../images/Numerify/snow_url_image.png></a>')
<> COALESCE(TRGT.image_url ,'')