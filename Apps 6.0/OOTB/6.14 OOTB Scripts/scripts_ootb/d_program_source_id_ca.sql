SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_program.source_id' ELSE 'SUCCESS' END as Message
FROM
   (select srm.* from #MDS_TABLE_SCHEMA.inv_investments_final srm 
   WHERE srm.cdctype<>'D' and srm.ODF_OBJECT_CODE='program') src left outer join  #DWH_TABLE_SCHEMA.d_program trg
on (src.id=trg.row_id and src.sourceinstance=trg.source_id)
where  COALESCE(src.sourceinstance,'')<> COALESCE(trg.source_id,'')
;
