
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_skill_call_summary.skill_key' ELSE 'SUCCESS' END as Message
FROM cardinalhealth_mdsdb.dsplit_final SRC 
LEFT JOIN cardinalhealth_mdwdb.f_skill_call_summary TRGT 
	ON (concat(row_date,'~',acd,'~',split) =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
LEFT JOIN cardinalhealth_mdsdb.synonyms_final MDS
	ON ( COALESCE(CONCAT(acd,'~', SRC.split),  'UNSPECIFIED') = concat(MDS.acd_no,'~',MDS.value) and MDS.item_type='split' )
LEFT JOIN cardinalhealth_mdwdb.d_skill LKP 
	ON ( COALESCE(concat ('1~',MDS.value),'UNSPECIFIED') = LKP.row_id
	AND SRC.sourceinstance=LKP.source_id)
WHERE COALESCE(LKP.row_key,CASE WHEN SRC.split IS NULL THEN 0 else '-1' end)<> COALESCE(TRGT.skill_key ,'')