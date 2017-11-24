SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_location.site_group_c' ELSE 'SUCCESS' END as Message 
FROM schneider_mdsdb.sit_site_final  SRC JOIN schneider_mdwdb.d_location TRGT ON (SRC.site_id = TRGT.row_id  AND SRC.sourceinstance = TRGT.source_id )
LEFT OUTER JOIN ( select distinct site_id,region,site_group, sourceinstance from schneider_mdsdb.ctm_people_final
where site_id  is not null group by site_id
) AUX_SRC ON SRC.site_id = AUX_SRC.site_id AND SRC.sourceinstance = AUX_SRC.sourceinstance 
 WHERE coalesce(AUX_SRC.site_group,'UNSPECIFIED')  <> (TRGT.site_group_c) 
