SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_resource_allocation.portfolio_key' ELSE 'SUCCESS' END as Message
FROM (select * from #MDS_TABLE_SCHEMA.prteam_final  where cdctype<>'D') SRC 
left join
(select * from #MDS_TABLE_SCHEMA.inv_investments_final where odf_object_code in ('project','idea') and cdctype<>'D')SRC3
on SRC.PRPROJECTID=SRC3.ID
inner join(select * from #MDS_TABLE_SCHEMA.inv_projects_final where IS_PROGRAM=0 and IS_TEMPLATE=0)SRC4
on SRC3.ID=SRC4.PRID
left JOIN (select * from #MDS_TABLE_SCHEMA.prj_blb_slices_final where cdctype<>'D')SRC1
on SRC.prid=SRC1.prj_object_id
and SRC.sourceinstance=SRC1.sourceinstance
inner JOIN(select * from #MDS_TABLE_SCHEMA.prj_blb_slicerequests_final where 
 request_name='DAILYRESOURCEALLOCCURVE' and cdctype<>'D')SRC2 
on SRC1.slice_request_id=SRC2.ID
and SRC1.sourceinstance=SRC2.sourceinstance
left join(select * from #MDS_TABLE_SCHEMA.pfm_investments_final where cdctype<>'D' and port_inv_status=1 and ODF_OBJECT_CODE='project')pfm
on SRC3.id=pfm.investment_id
left join(select * from #MDS_TABLE_SCHEMA.pfm_portfolios_final where cdctype<>'D')prt
on pfm.portfolio_id=prt.id
LEFT JOIN (select * from  #DWH_TABLE_SCHEMA.f_resource_allocation)TRGT   
ON CONCAT('ALLOCATION','~',SRC.prid,date_format(SRC1.slice_date,'%Y%m%d')) =TRGT.row_id 
and SRC.sourceinstance=TRGT.source_id
LEFT JOIN(select * from #DWH_TABLE_SCHEMA.d_portfolio)LKP
on prt.id=LKP.row_id
where COALESCE(LKP.row_key,'')<> COALESCE(TRGT.portfolio_key,'')