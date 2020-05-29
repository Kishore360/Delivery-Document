SET SQL_SAFE_UPDATES = 0;

truncate table app_test.fs_skill_call_summary_aux;


SET group_concat_max_len=18446744073709551615;



SET @sql = NULL;


SET @sql = (SELECT GROUP_CONCAT(DISTINCT CONCAT('SELECT DATE_FORMAT(splt.row_date,''%Y%m%d'') as row_date,
LPAD(splt.starttime, 4, ''0'') time_id,
COALESCE(splt.acd,''UNSPECIFIED'') as acd,
splt.sourceinstance,
COALESCE(concat(splt.acd,''~'',splt.split),''UNSPECIFIED'') as split,
concat(splt.row_date,''~'',splt.acd,''~'',splt.split) as parent_row_id,
concat(splt.row_date,''~'',splt.starttime,''~'',splt.acd,''~'',splt.split,''~'',trim(syn.value), ''~~'', splt.cdchash) as row_id,
concat(''AUX~CCA~'',syn.acd_no,''~'',trim(syn.value)) as aux_src_code_id,
',a.column_name,' as aux_time,
''avaya_cms'' created_by,
''avaya_cms'' changed_by,
splt.row_date created_on,
splt.row_date changed_on
FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.synonyms_final WHERE CDCTYPE<>''D'') syn
JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.hsplit_final WHERE CDCTYPE<>''D'') splt ON (syn.acd_no = splt.acd)
WHERE syn.item_type = ''aux_rsn''
AND trim(syn.value) = ', a.value,' AND ',a.column_name, ' <> 0 ') SEPARATOR ' UNION ALL ' )
 FROM (
SELECT 	DISTINCT CONCAT('i_auxtime', trim(syn.value)) column_name, 
trim(syn.value) `value`
  FROM ( SELECT * FROM #MDS_TABLE_SCHEMA.synonyms_final WHERE CDCTYPE<>'D') syn
  JOIN ( SELECT * FROM #MDS_TABLE_SCHEMA.hsplit_final WHERE CDCTYPE<>'D') splt ON (syn.acd_no = splt.acd)
WHERE syn.item_type = 'aux_rsn'
 ) a);



SET @sql = CONCAT('INSERT INTO app_test.fs_skill_call_summary_aux (row_id, source_id,parent_row_id, time_id, day_id, shift_id, skill_id, acd_id, aux_code_src_id, aux_time,  created_by, changed_by, created_on, changed_on, pivot_date)
	SELECT row_id, sourceinstance, parent_row_id,time_id , row_date, ''UNSPECIFIED'', split, acd, aux_src_code_id, aux_time, created_by, changed_by, created_on as created_on, changed_on as changed_on, COALESCE(changed_on, created_on) as pivot_date
	FROM (', @sql, ') x'
);



SET @sql = COALESCE(@sql,'SELECT ''do nothing''');



PREPARE stmt FROM @sql;



EXECUTE stmt;



DEALLOCATE PREPARE stmt;



