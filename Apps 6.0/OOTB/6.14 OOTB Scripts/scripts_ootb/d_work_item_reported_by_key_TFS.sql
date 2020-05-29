SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_work_item.reported_by_key' ELSE 'SUCCESS' END as Message
 FROM ( select DWI.*  from #MDS_TABLE_SCHEMA.dimworkitem_final DWI join  (select WI.system_id, WI.teamprojectsk, max(WI.System_Rev) rev_no from #MDS_TABLE_SCHEMA.dimworkitem_final WI group by WI.system_id, WI.teamprojectsk) SQ on SQ.System_Id = DWI.System_Id and SQ.TeamProjectSK = DWI.TeamProjectSK and SQ.rev_no = DWI.System_Rev ) SRC 
 LEFT JOIN #DWH_TABLE_SCHEMA.d_work_item TRGT 
 ON (CONCAT(SRC.system_id, '~', SRC.teamprojectsk)=TRGT.row_id  
 AND SRC.sourceinstance=TRGT.source_id)
LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact LKP 
 ON ( CONCAT('INTERNAL_CONTACT~',SRC.ReporterId) = LKP.row_id 
AND SRC.sourceinstance = LKP.source_id )
 WHERE TRGT.row_key not in (0,-1) and
COALESCE(LKP.row_key,CASE WHEN SRC.ReporterId IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.reported_by_key ,'')
