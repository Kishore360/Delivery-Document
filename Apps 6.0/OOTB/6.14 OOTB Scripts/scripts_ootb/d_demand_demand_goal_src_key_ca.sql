SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_demand.demand_goal_src_key' ELSE 'SUCCESS' END as Message
FROM
   (select srm.* from #MDS_TABLE_SCHEMA.inv_investments_final srm  
   WHERE srm.cdctype<>'D' and srm.ODF_OBJECT_CODE='idea' ) src left outer join  #DWH_TABLE_SCHEMA.d_demand trg
on (src.id=trg.row_id and src.sourceinstance=trg.source_id)
LEFT JOIN #DWH_TABLE_SCHEMA.d_lov LKP 
 ON ( CONCAT('DEMAND~','GOAL~',src.goal_code) = LKP.src_rowid 
AND src.sourceinstance = LKP.source_id )
 WHERE COALESCE(LKP.row_key,CASE WHEN src.goal_code IS NULL THEN 0 else '-1' end)<> COALESCE(trg.demand_goal_src_key ,'')
;
