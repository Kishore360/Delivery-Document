SET SQL_SAFE_UPDATES = 0;

truncate table app_test.fs_agent_call_summary_aux;



SET group_concat_max_len=18446744073709551615;



SET @sql = NULL;


SET @sql = (SELECT GROUP_CONCAT(
DISTINCT CONCAT(
'SELECT     DATE_FORMAT(agent.row_date,''%Y%m%d'')  as DAY_ID,
LPAD(agent.starttime, 4, ''0'') time_id,
COALESCE(agent.acd,''UNSPECIFIED'') as ACD_ID,
agent.sourceinstance as SOURCE_ID,
COALESCE(concat(agent.acd,''~'',agent.split),''UNSPECIFIED'') as SKILL_ID,
CONCAT(agent.row_date,''~'',agent.starttime,''~'',agent.acd,''~'',agent.split,''~'',trim(agent.logid),''~'',agent.loc_id) as parent_row_id,
concat(agent.row_date,''~'',agent.starttime,''~'',agent.acd,''~'',agent.split,''~'',trim(agent.logid),''~'',agent.loc_id,''~'',trim(syn.value),''~~'', agent.cdchash) as row_id,
concat(''AUX~CCA~~~'',syn.acd_no,''~'',trim(syn.value)) as value_src_id,
',a.column_name,' as aux_time,
''avaya_cms'' created_by,
''avaya_cms'' changed_by,
agent.row_date created_on,
agent.row_date changed_on,
coalesce(concat(''INTERNAL_CONTACT~'',agent.acd,''~'',trim(agent.logid)),''UNSPECIFIED'') as EMPLOYEE_ID
FROM mercuryins_mdsdb.synonyms_final syn
JOIN mercuryins_mdsdb.hagent_final agent ON (syn.acd_no = agent.acd)
WHERE syn.item_type = ''aux_rsn''
AND trim(syn.value) = ', a.value, ' AND ', a.column_name, '<> 0' ,' ') SEPARATOR ' UNION ALL '
)
FROM (
SELECT DISTINCT CONCAT('ti_auxtime', trim(syn.value)) column_name,
trim(syn.value) `value`
FROM mercuryins_mdsdb.synonyms_final syn
JOIN mercuryins_mdsdb.hagent_final agent
ON (syn.acd_no = agent.acd)
WHERE syn.item_type = 'aux_rsn'
) a);





SET @sql = CONCAT(
'INSERT INTO app_test.fs_agent_call_summary_aux (ROW_ID,SOURCE_ID,PARENT_ROW_ID,TIME_ID,DAY_ID,EMPLOYEE_ID,SKILL_ID,SHIFT_ID,LOCATION_ID,DEPARTMENT_ID,COST_CENTER_ID,AUX_CODE_SRC_ID,ACD_ID,AUX_TIME,CREATED_BY,CHANGED_BY,CREATED_ON,CHANGED_ON,PIVOT_DATE)
SELECT ROW_ID, SOURCE_ID, PARENT_ROW_ID, TIME_ID, DAY_ID, EMPLOYEE_ID, SKILL_ID, ''UNSPECIFIED'' as SHIFT_ID, ''UNSPECIFIED'' as LOCATION_ID, ''UNSPECIFIED'' as DEPARTMENT_ID,  ''UNSPECIFIED'' as COST_CENTER_ID, value_SRC_ID, ACD_ID, AUX_TIME,  CREATED_BY, CHANGED_BY, CREATED_ON, CHANGED_ON,   COALESCE(changed_on, created_on)
FROM (', @sql, ') x'
);



SET @sql = COALESCE(@sql,'SELECT ''do nothing''');



PREPARE stmt FROM @sql;



EXECUTE stmt;



DEALLOCATE PREPARE stmt;


