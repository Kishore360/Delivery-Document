
SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_skill.changed_by' ELSE 'SUCCESS' END as Message
FROM 
(select TRGT.row_id from ( SELECT * FROM #MDS_TABLE_SCHEMA.skill_group_final WHERE CDCTYPE<>'D') SRC 
LEFT JOIN #DWH_TABLE_SCHEMA.d_skill TRGT 
	ON ( CONCAT( peripheralid, '~', skilltargetid) =TRGT.row_id 
 AND SRC.sourceinstance =TRGT.source_id )
WHERE null <> COALESCE(TRGT.changed_by,'')
and TRGT.row_key not in (0,-1)
union
select TRGT.row_id  from
( SELECT * FROM #MDS_TABLE_SCHEMA.us_d_skill_final WHERE CDCTYPE<>'D') SRC
left join ( SELECT * FROM #MDS_TABLE_SCHEMA.skill_group_final WHERE CDCTYPE<>'D') sgf
on SRC.skill_name = sgf.enterprisename
LEFT JOIN #DWH_TABLE_SCHEMA.d_skill TRGT 
	ON ( CONCAT(SRC.acd_no,'~',SRC.skill_name) =TRGT.row_id 
 AND SRC.sourceinstance =TRGT.source_id) 
 WHERE sgf.enterprisename is NULL and
'admin' <> COALESCE(TRGT.changed_by,'')
and TRGT.row_key not in (0,-1)
)SQ;