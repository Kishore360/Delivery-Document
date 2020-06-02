set @mdsschema := #MDS_TABLE_SCHEMA;

select if (
    exists(
        select distinct index_name from information_schema.statistics 
        where table_schema = @mdsschema 
        and table_name = 'issue_final' and index_name like 'qa_idx'
    )
    ,'select ''index qa_idx exists'' _______;'
    ,concat('create index qa_idx on ', @mdsschema, '.issue_final (`key` (255), sourceinstance);')) into @a;
PREPARE idx_issue FROM @a;
EXECUTE idx_issue;