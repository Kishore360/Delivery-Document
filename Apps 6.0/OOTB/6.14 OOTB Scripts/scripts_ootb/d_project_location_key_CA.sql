SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_project.LOCATION_KEY' ELSE 'SUCCESS' END as Message
FROM (select * from   #MDS_TABLE_SCHEMA.inv_investments_final  where  cdctype<>'D') SRC 
INNER JOIN(select * from  #MDS_TABLE_SCHEMA.inv_projects_final where IS_PROGRAM=0 and IS_TEMPLATE = 0 and cdctype<>'D')SRC1
on SRC.ID=SRC1.PRID
LEFT JOIN(select SRC3.id as location_id,SRC2.record_id as record_id from (select * from #MDS_TABLE_SCHEMA.prj_obs_associations_final where 
table_name='SRM_PROJECTS')SRC2
inner join(select * from #MDS_TABLE_SCHEMA.Locations_final)SRC3
on SRC2.unit_id=SRC3.obs_unit_id)LOCATION
on SRC.id=LOCATION.record_id
LEFT JOIN (select * from   #DWH_TABLE_SCHEMA.d_project)TRGT   
ON SRC.id =TRGT.row_id 	and SRC.sourceinstance=TRGT.source_id
LEFT JOIN(select * from #DWH_TABLE_SCHEMA.d_location)LKP
on LOCATION.location_id=LKP.row_id
WHERE COALESCE(LKP.row_key,0)<>COALESCE(TRGT.location_key,0)

