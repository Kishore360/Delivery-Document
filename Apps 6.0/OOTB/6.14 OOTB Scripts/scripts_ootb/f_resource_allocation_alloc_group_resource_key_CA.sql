SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_resource_skill.group_resource_key' ELSE 'SUCCESS' END as Message
FROM 
(select * from #MDS_TABLE_SCHEMA.prteam_final  where cdctype<>'D') SRC 
left join
(select * from #MDS_TABLE_SCHEMA.inv_investments_final where odf_object_code in ('project','idea') and cdctype<>'D')SRC3
on SRC.PRPROJECTID=SRC3.ID
and SRC.sourceinstance=SRC3.sourceinstance
inner join(select * from #MDS_TABLE_SCHEMA.inv_projects_final where IS_PROGRAM=0 and IS_TEMPLATE=0)SRC4
on SRC3.ID=SRC4.PRID
and SRC3.sourceinstance=SRC4.sourceinstance
left JOIN (select * from #MDS_TABLE_SCHEMA.prj_blb_slices_final where cdctype<>'D')SRC1
on SRC.prid=SRC1.prj_object_id
and SRC.sourceinstance=SRC1.sourceinstance
inner JOIN(select * from #MDS_TABLE_SCHEMA.prj_blb_slicerequests_final where 
 request_name='DAILYRESOURCEALLOCCURVE' and cdctype<>'D')SRC2 
on SRC1.slice_request_id=SRC2.ID
and SRC1.sourceinstance=SRC2.sourceinstance
left join
(select * from #MDS_TABLE_SCHEMA.srm_resources_final where cdctype<>'D')srm
on SRC.prresourceid=srm.id
and SRC.sourceinstance=srm.sourceinstance
left join
(select * from #MDS_TABLE_SCHEMA.prj_obs_associations_final where cdctype<>'D' and table_name='SRM_RESOURCES')assn
on srm.id=assn.record_id
and srm.sourceinstance=assn.sourceinstance
left join
(select * from #MDS_TABLE_SCHEMA.prj_obs_units_final where cdctype<>'D')unit
on assn.unit_id=unit.id
and assn.sourceinstance=unit.sourceinstance
left join
(select * from #MDS_TABLE_SCHEMA.prj_obs_types_final where unique_name='resourcePool' and cdctype<>'D')type1
on unit.type_id=type1.id
and unit.sourceinstance=type1.sourceinstance
LEFT JOIN (select * from  #DWH_TABLE_SCHEMA.f_resource_allocation)TRGT   
ON CONCAT('ALLOCATION','~',SRC.prid,date_format(SRC1.slice_date,'%Y%m%d')) =TRGT.row_id 
and SRC.sourceinstance=TRGT.source_id
left join
(select * from #DWH_TABLE_SCHEMA.d_internal_organization)lkp
on lkp.row_id=concat('GROUP~',assn.unit_id)
and SRC.sourceinstance=lkp.source_id
WHERE COALESCE(lkp.row_key,'0')<> COALESCE(TRGT.group_resource_key,'');