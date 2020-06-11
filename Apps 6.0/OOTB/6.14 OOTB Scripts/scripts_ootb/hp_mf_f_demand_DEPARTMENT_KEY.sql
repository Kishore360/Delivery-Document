SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.hp_kcrt_requests_final where cdctype <> 'D') SRC 
 inner join(select * from  #MDS_TABLE_SCHEMA.hp_kcrt_fg_pfm_proposal_final)SRC2
on SRC.request_id=SRC2.request_id
and SRC.sourceinstance=SRC2.sourceinstance
 LEFT JOIN #DWH_TABLE_SCHEMA.f_demand TRGT 
 ON (SRC.request_id=TRGT.row_id 
 AND SRC.sourceinstance=TRGT.source_id )
 left join #DWH_TABLE_SCHEMA.d_internal_organization LKP
 on CONCAT('DEPARTMENT~',UPPER(SRC.department_code)) = LKP.row_id
 and SRC.sourceinstance = LKP.source_id
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.department_code IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.DEPARTMENT_KEY,0);
