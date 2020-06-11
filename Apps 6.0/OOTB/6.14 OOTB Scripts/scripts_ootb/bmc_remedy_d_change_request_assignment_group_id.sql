
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed ' ELSE 'SUCCESS' END as Message
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hlx_chg_infrastructure_change_final WHERE CDCTYPE<>'D') SRC
	LEFT JOIN #DWH_TABLE_SCHEMA.d_change_request TRGT 
	 ON (SRC.infrastructure_change_id=TRGT.row_id 
	 AND SRC.sourceinstance=TRGT.source_id )
	left join  #DWH_TABLE_SCHEMA.d_internal_organization ORG
	on (ORG.source_id=SRC.sourceinstance
	and CONCAT('GROUP~',SRC.asgrpid) = ORG.row_id)
	where coalesce(ORG.row_key,case when SRC.asgrpid is null then 0 else -1 end) <> coalesce(TRGT.assignment_group_key,'');
	
	
	
	
	