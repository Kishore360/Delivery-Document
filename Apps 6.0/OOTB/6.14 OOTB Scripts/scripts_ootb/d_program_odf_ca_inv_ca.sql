SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_program.odf_ca_inv' ELSE 'SUCCESS' END as Message
FROM
   (select odf.obj_work_status as obj_work_status,srm.* from #MDS_TABLE_SCHEMA.inv_investments_final srm left join 
   #MDS_TABLE_SCHEMA.odf_ca_inv_final odf on srm.id=odf.id
   WHERE srm.cdctype<>'D' and odf.cdctype<>'D' and srm.ODF_OBJECT_CODE='project') src left outer join  #DWH_TABLE_SCHEMA.d_program trg
on (src.id=trg.row_id and src.sourceinstance=trg.source_id)
where  COALESCE(COALESCE(CONCAT('PROGRAM~WORKSTATUS~',odf.obj_work_status),'UNSPECIFIED'),'')<> COALESCE(trg.odf_ca_inv,'')
;
