set @exist := (select count(1) from information_schema.statistics where table_name = 'f_expense_item' and index_name = 'test_f_ex' and table_schema = '<<tenant>>_mdwdb');
set @sqlstmt := if( @exist > 0, 'select ''Index f_expense_item (row_id, source_id) already exists.''', 'create index test_f_ex on <<tenant>>_mdwdb.f_expense_item (row_id, source_id)');
PREPARE stmt FROM @sqlstmt;
