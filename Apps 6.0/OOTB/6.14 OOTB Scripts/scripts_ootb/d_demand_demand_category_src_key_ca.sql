SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_demand.demand_category_src_key' ELSE 'SUCCESS' END as Message
FROM
   (select odf.obj_request_category as obj_request_category,srm.* from #MDS_TABLE_SCHEMA.inv_investments_final srm  left join #MDS_TABLE_SCHEMA.odf_ca_idea_final odf
   on srm.id=odf.id
   WHERE srm.cdctype<>'D' and srm.ODF_OBJECT_CODE='idea' and odf.cdctype<>'D') src left outer join  #DWH_TABLE_SCHEMA.d_demand trg
on (src.id=trg.row_id and src.sourceinstance=trg.source_id)
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
 ON ( coalesce(concat('Demand~Category~',src.obj_request_category),'UNSPECIFIED') = LKP.src_rowid 
AND src.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN src.obj_request_category IS NULL THEN 0 else '-1' end)<> COALESCE(trg.demand_category_src_key ,'')
;
