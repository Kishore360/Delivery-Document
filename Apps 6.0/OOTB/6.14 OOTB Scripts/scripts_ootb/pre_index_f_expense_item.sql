set @exist := (select count(*) from information_schema.statistics where table_name = 'f_expense_item' and index_name = 'test_f_ex' and table_schema = '#DWH_TABLE_SCHEMA');
set @sqlstmt := if( @exist > 0, 'select ''Index f_expense_item (row_id, source_id) already exists.''', 'create index test_f_ex on #DWH_TABLE_SCHEMA.f_expense_item (row_id, source_id)');
PREPARE stmt FROM @sqlstmt;