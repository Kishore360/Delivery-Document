SET SQL_SAFE_UPDATES = 0;

delete from app_test.fs_skill_call_summary_aux;

-- START
SET group_concat_max_len=18446744073709551615;
-- END

-- START
SET @sql = NULL;
-- END

-- START
SET @sql = (SELECT GROUP_CONCAT(DISTINCT CONCAT('SELECT DATE_FORMAT(splt.row_date,''%Y%m%d'') as row_date,
COALESCE(splt.acd,''UNSPECIFIED'') as acd,
splt.sourceinstance,
COALESCE(concat(splt.acd,''~'',splt.split),''UNSPECIFIED'') as split,
0000 as etl_run_number,
concat(splt.row_date,''~'',splt.acd,''~'',splt.split) as parent_row_id,
concat(splt.row_date,''~'',splt.acd,''~'',splt.split,''~'',syn.value) as row_id,
concat(''AUX~CCA~'',syn.value) as aux_src_code_id,
',a.column_name,' as aux_time,
''avaya_admin'' created_by,
''avaya_admin'' changed_by,
splt.row_date created_on,
splt.row_date changed_on
FROM int3_6_bkp_mdsdb.synonyms_final syn
JOIN int3_6_bkp_mdsdb.dsplit_final splt ON (syn.acd_no = splt.acd)
WHERE syn.item_type = ''aux_rsn''
AND syn.value = ', a.value,' ') SEPARATOR ' UNION ALL ' )
 FROM (
SELECT 	DISTINCT CONCAT('i_auxtime', syn.value) column_name, 
syn.value
  FROM int3_6_bkp_mdsdb.synonyms_final syn
  JOIN int3_6_bkp_mdsdb.dsplit_final splt ON (syn.acd_no = splt.acd)
WHERE syn.item_type = 'aux_rsn'
 ) a);
-- END

-- START
SET @sql = CONCAT('INSERT INTO app_test.fs_skill_call_summary_aux (row_id, source_id, etl_run_number, parent_row_id, time_id, day_id, shift_id, skill_id, acd_id, aux_code_src_id, aux_time,  created_by, changed_by, created_on, changed_on, pivot_date)
	SELECT row_id, sourceinstance, etl_run_number, parent_row_id,''0000'' , row_date, ''UNSPECIFIED'', split, acd, aux_src_code_id, aux_time, created_by, changed_by, created_on as created_on, changed_on as changed_on, COALESCE(changed_on, created_on) as pivot_date
	FROM (', @sql, ') x'
);
-- END

-- START
SET @sql = COALESCE(@sql,'SELECT ''do nothing''');
-- END

-- START
PREPARE stmt FROM @sql;
-- END

-- START
EXECUTE stmt;
-- END

-- START
DEALLOCATE PREPARE stmt;
-- END


