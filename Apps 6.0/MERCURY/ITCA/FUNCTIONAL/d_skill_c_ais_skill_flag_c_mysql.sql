SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_call_summary.acd_calls' ELSE 'SUCCESS' END as Message
FROM mercuryins_mdsdb.synonyms_final SRC 
LEFT JOIN mercuryins_mdwdb.d_skill TRGT 
	ON ( concat(acd_no,'~',value)  =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id ) and SRC.item_type='split'
WHERE CASE
				WHEN CAST(SRC.value AS DECIMAL) between '0' and '499' THEN 'N'
				WHEN CAST(SRC.value AS DECIMAL) between '500' and '599' THEN 'Y'
				WHEN CAST(SRC.value AS DECIMAL) between '600' and '699' THEN 'N'
				WHEN CAST(SRC.value AS DECIMAL) between '700' and '799' THEN 'Y'
				WHEN CAST(SRC.value AS DECIMAL) between '800' and '2499' THEN 'N'
                WHEN CAST(SRC.value AS DECIMAL) between '2500' and '2599' THEN 'Y'
				WHEN CAST(SRC.value AS DECIMAL) between '2600' and '2699' THEN 'N'
				WHEN CAST(SRC.value AS DECIMAL) between '2700' and '2799' THEN 'Y'
                ELSE 'N'
			END <>TRGT.ais_skill_flag_c
