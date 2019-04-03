SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_agent_non_acd_call_type_src_key' ELSE 'SUCCESS' END as Message
FROM ( select TRGT.CALL_TYPE_SRC_KEY from
 mercuryins_mdsdb.new_call_final SRC
  LEFT JOIN mercuryins_mdwdb.f_agent_non_acd TRGT
 ON (TRGT.row_id= SRC.sys_id
	AND SRC.sourceinstance =TRGT.source_id )
 LEFT JOIN mercuryins_mdwdb.d_lov LKP
  ON (CONCAT('CALL_TYPE','~','CALL','~','~','~',upper(SRC.call_type)) = LKP.row_id
  and SRC.sourceinstance = LKP.source_id) 
WHERE coalesce(LKP.row_key,'') <> coalesce(TRGT.CALL_TYPE_SRC_KEY,'') 
union
select TRGT.CALL_TYPE_SRC_KEY
FROM mercuryins_mdsdb.incident_final SRC 
LEFT JOIN mercuryins_mdwdb.f_agent_non_acd TRGT 
ON (SRC.sys_id = TRGT.row_id
AND SRC.sourceinstance =TRGT.source_id )
WHERE
0 <> coalesce(TRGT.call_type_src_key,''))CSK