drop table if exists #DWH_TABLE_SCHEMA.d_work_item_back;

create table if not exists #DWH_TABLE_SCHEMA.d_work_item_back 
SELECT a.* FROM #DWH_TABLE_SCHEMA.d_work_item a
WHERE a.row_key in (4,99,599,242,415,578,1201,1117,1069,1051,1050,1049,1048,1037,1038,76066,76068);


drop table if exists #DWH_TABLE_SCHEMA.f_work_item_back;

create table if not exists #DWH_TABLE_SCHEMA.f_work_item_back 
SELECT a.* FROM #DWH_TABLE_SCHEMA.f_work_item_keyword a  join #DWH_TABLE_SCHEMA.d_work_item b
on a.table_row_key =b.row_key
WHERE a.table_row_key in (4,99,599,242,415,578,1201,1117,1069,1051,1050,1049,1048,1037,1038,76066,76068);


drop table if exists #DWH_TABLE_SCHEMA.d_work_item_comments_back;

create table if not exists #DWH_TABLE_SCHEMA.d_work_item_comments_back 
SELECT a.* FROM #DWH_TABLE_SCHEMA.d_work_item_comments a
WHERE a.work_item_key in (4,99,599,242,415,578,1201,1117,1069,1051,1050,1049,1048,1037,1038,76066,76068);
