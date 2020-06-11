use #STG_TABLE_SCHEMA;

update #STG_TABLE_SCHEMA.history_snapshot_weekly_temp SRC
join #STG_TABLE_SCHEMA.changelog_weekly_temp LKP
on SRC.issueid = LKP.issueid and SRC.sourceinstance = LKP.sourceinstance and SRC.n_key = LKP.n_key
left join #DWH_TABLE_SCHEMA.d_iteration ITE
on ITE.row_id = IF(TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(LKP.`from`, ',', -2),',',1))=TRIM(SUBSTRING_INDEX(LKP.`to`, ',', -1)) 
OR LENGTH(TRIM(SUBSTRING_INDEX(LKP.`to`, ',', -1)))=0,null,TRIM(SUBSTRING_INDEX(LKP.`to`, ',', -1))) and LKP.sourceinstance = ITE.source_id
set SRC.work_item_iteration_key = coalesce(ITE.row_key, case when IF(TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(LKP.`from`, ',', -2),',',1))=TRIM(SUBSTRING_INDEX(LKP.`to`, ',', -1)) 
OR LENGTH(TRIM(SUBSTRING_INDEX(LKP.`to`, ',', -1)))=0,null,TRIM(SUBSTRING_INDEX(LKP.`to`, ',', -1))) is null then 0 else -1 end), SRC.updated_on = current_timestamp
where lower(LKP.field) in ('sprint');