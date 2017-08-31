select TRGT.row_id, trim(SRC.item_name) , COALESCE(TRGT.name,'')
FROM cardinalhealth_mdsdb.synonyms_final SRC 
LEFT JOIN cardinalhealth_mdwdb.d_skill TRGT 
	ON (SRC.sys_id_ds =TRGT.row_id 
	AND SRC.sourceinstance =TRGT.source_id )
WHERE  trim(SRC.item_name) <> COALESCE(TRGT.name,'')
AND SRC.item_type = 'split'