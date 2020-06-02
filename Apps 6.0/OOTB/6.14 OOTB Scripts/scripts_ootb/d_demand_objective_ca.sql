SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_demand.objective' ELSE 'SUCCESS' END as Message
FROM
   (select odf.obj_objective as obj_objective,srm.* from #MDS_TABLE_SCHEMA.inv_investments_final srm  left join #MDS_TABLE_SCHEMA.odf_ca_idea_final odf
   on srm.id=odf.id
   WHERE srm.cdctype<>'D' and srm.ODF_OBJECT_CODE='idea' and odf.cdctype<>'D') src left outer join  #DWH_TABLE_SCHEMA.d_demand trg
on (src.id=trg.row_id and src.sourceinstance=trg.source_id)
where  COALESCE(src.obj_objective,'')<> COALESCE(trg.objective,'')
;
