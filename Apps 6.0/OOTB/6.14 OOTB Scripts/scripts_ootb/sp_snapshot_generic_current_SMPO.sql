use #STG_TABLE_SCHEMA;

drop procedure if exists drop_snapshot_base;

DELIMITER //
CREATE PROCEDURE drop_snapshot_base (IN target_table varchar(128), base_table varchar(128), firstcount INT, workdb varchar(128), dropbase char(1))
BEGIN 
select target_table, base_table, firstcount, workdb, dropbase;

select @dropbasestatement := case when (firstcount = 0 or (firstcount <> 0 and dropbase COLLATE utf8_unicode_ci = 'Y')) 
then concat('drop table if exists ', workdb COLLATE utf8_unicode_ci, '.', base_table COLLATE utf8_unicode_ci, ';')
else 'select \'Not dropping the base\';' end;
prepare dropbasestatement from @dropbasestatement;
execute dropbasestatement;

END //

DELIMITER ;
 
drop procedure if exists create_base_table;

DELIMITER //
CREATE PROCEDURE create_base_table (IN target_table varchar(128), dwh_table varchar(128), mdwdb varchar(128), workdb varchar(128), is_smpo char(1), OUT SN_BASE varchar(128))
BEGIN 
select target_table, dwh_table, mdwdb, workdb, is_smpo, @sn_base := concat(dwh_table COLLATE utf8_unicode_ci, '_sn_base');

select @dropsnbasestatement := concat('drop table if exists ', workdb COLLATE utf8_unicode_ci, '.', @sn_base, ';');
prepare dropsnbasestatement from @dropsnbasestatement;
execute dropsnbasestatement;

select @createbasestatement := concat ('create table if not exists ', workdb COLLATE utf8_unicode_ci, '.', @sn_base, ' (', table_struc.column_structure, ');') 
from (select TABLE_NAME, group_concat(concat(COLUMN_NAME, ' ', COLUMN_TYPE, 
case when COLLATION_NAME is not null then concat(' COLLATE ', COLLATION_NAME) else '' end, 
case when IS_NULLABLE = 'YES' then concat(' DEFAULT ', coalesce(NUMERIC_SCALE, ' NULL')) else concat(' NOT NULL DEFAULT ', NUMERIC_SCALE) end) SEPARATOR ', \n') as column_structure 
from (
select * from information_schema.columns where table_name = dwh_table COLLATE utf8_unicode_ci and table_schema = mdwdb COLLATE utf8_unicode_ci
and COLUMN_NAME not in ('row_id', 'row_key', 'calendar_date_key', 'dw_inserted_on', 'dw_updated_on', 'etl_run_number', 'secondary1_changed_on', 'secondary2_changed_on')
order by COLUMN_NAME) SQ
group by TABLE_NAME) table_struc;
prepare createbasestatement from @createbasestatement;
execute createbasestatement;

set @alterbasestatement := concat ('alter table ', workdb COLLATE utf8_unicode_ci, '.', @sn_base, ' 
add column row_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
add column inserted_on datetime DEFAULT NULL,
add PRIMARY KEY (row_id, source_id);');
prepare alterbasestatement from @alterbasestatement;
execute alterbasestatement;

select @column_base_list:= concat('(',SQ.column_structure, ', inserted_on)\n'),
@column_baseinsert_list:= concat(SQ.insert_col, ', CURRENT_TIMESTAMP as inserted_on \n'),
@grouped_columns := concat(SQ.group_cols, '\n')

from (
select SQ.TABLE_NAME, 
group_concat(concat(case when SQ.COLUMN_NAME in ('assigned_to_key', 'assignment_group_key', 'source_id', 'row_id', 'closed_by_key', 'soft_deleted_flag') then 
case when SQ.COLUMN_NAME = 'row_id' then case when lower(@sn_base COLLATE utf8_unicode_ci) like '%request_item_smpo%' then concat('concat(F.assignment_group_key, \'_\', F.assigned_to_key, F.closed_by_key)') else concat('concat(F.assignment_group_key, \'_\', F.assigned_to_key)') end
when SQ.COLUMN_NAME = 'assigned_to_key' then concat('F.', SQ.COLUMN_NAME)
when SQ.COLUMN_NAME = 'assignment_group_key' then concat('F.', SQ.COLUMN_NAME) 
when SQ.COLUMN_NAME = 'source_id' then concat('F.', SQ.COLUMN_NAME) 
when SQ.COLUMN_NAME = 'closed_by_key' then concat('F.', SQ.COLUMN_NAME) 
when SQ.COLUMN_NAME = 'soft_deleted_flag' then concat('F.', SQ.COLUMN_NAME) end
else concat('sum(F.', SQ.COLUMN_NAME, ')') end, ' as ', SQ.COLUMN_NAME) SEPARATOR ', ') as insert_col, 

group_concat(SQ.COLUMN_NAME SEPARATOR ', ') as column_structure,
group_concat(case when SQ.COLUMN_NAME in ('assigned_to_key', 'assignment_group_key', 'source_id', 'closed_by_key', 'soft_deleted_flag') then 
SQ.COLUMN_NAME else null end SEPARATOR ', ') as group_cols
from (select * from information_schema.columns where table_name = @sn_base COLLATE utf8_unicode_ci and table_schema = workdb COLLATE utf8_unicode_ci
and COLUMN_NAME not in ('row_key', 'cdctype', 'dw_inserted_on', 'dw_updated_on', 'etl_run_number', 'secondary1_changed_on', 'secondary2_changed_on', 'changed_by', 'changed_on', 'created_by', 'created_on', 'inserted_on')
order by COLUMN_NAME) SQ
group by TABLE_NAME) SQ;

select @insertbasestatement := concat ('insert into ', workdb COLLATE utf8_unicode_ci, '.', @sn_base, ' 
', @column_base_list ,'
select ' ,@column_baseinsert_list, '
from ', mdwdb COLLATE utf8_unicode_ci, '.', dwh_table COLLATE utf8_unicode_ci, ' F 
join ', mdwdb COLLATE utf8_unicode_ci, '.d_calendar_date CAL
  on CAL.row_key = F.calendar_date_key
where F.soft_deleted_flag <> \'Y\' and CAL.lagging_count_of_days <=29
group by ', @grouped_columns,';');

prepare insertbasestatement from @insertbasestatement;
execute insertbasestatement;

set SN_BASE = @sn_base;

END //

DELIMITER ;

drop procedure if exists create_snapshot_current;

DELIMITER //
CREATE PROCEDURE create_snapshot_current (IN target_table varchar(128), mdsdb varchar(128), workdb varchar(128), mdwdb varchar(128), source_id bigint(20), dropbase char(1))
BEGIN

set @selectstatement := concat ('SELECT @dayofwkmn := day_of_week_month, @source_id := source_id, @enable_flag := enable_flag, @sn_type := type, @dwh_table := dwh_table, @current_flag := current_flag, @retention := retention,
@subject_area := subject_area, @is_smpo := case when lower(subject_area) like \'%smpo%\' and lower(subject_area) not like \'%backlog%\' then \'Y\' else \'N\' end
FROM ', workdb COLLATE utf8_unicode_ci, '.lsm_ls_dw_aggregator where target_table = \'', target_table COLLATE utf8_unicode_ci, '\' and source_id = \'', source_id, '\';');
prepare selectstatement from @selectstatement;
execute selectstatement;

set @target_table := target_table COLLATE utf8_unicode_ci, @mdwdb := mdwdb COLLATE utf8_unicode_ci, @workdb := workdb COLLATE utf8_unicode_ci, @dropbase := dropbase COLLATE utf8_unicode_ci, @basetable = concat(target_table COLLATE utf8_unicode_ci, '_final_base'), @lagging_count_var := case when @sn_type = 'MONTHLY' then 'lagging_count_of_month' when @sn_type = 'WEEKLY' then 'lagging_count_of_weeks' when @sn_type = 'DAILY' then 'lagging_count_of_days' end;

set @callcreatebasesp := case when @is_smpo = 'Y' then concat ('CALL create_base_table (@target_table, @dwh_table, @mdwdb, @workdb, @is_smpo, @SN_BASE);') else 'Select \'Using default DWH table\';' end;
prepare callcreatebasesp from @callcreatebasesp;
execute callcreatebasesp;

select @dwh_table := case when @is_smpo = 'Y' then @SN_BASE COLLATE utf8_unicode_ci else @dwh_table end;

select @reusevar := concat ('select @tableexist := max(case when table_schema = \'', workdb COLLATE utf8_unicode_ci, '\' AND table_name = \'', @basetable, '\' 
then 1 else 0 end) FROM information_schema.tables;');
prepare reusevar from @reusevar;
execute reusevar;

set @reusevar2 := case when @tableexist > 0 then concat ('SELECT @firstcount := count(*)  FROM ', workdb COLLATE utf8_unicode_ci, '.', @basetable, ';')
else 'SELECT @firstcount := 0;' end;
prepare reusevar2 from @reusevar2;
execute reusevar2;

set @calldropsp := case when @tableexist > 0 then concat ('CALL drop_snapshot_base (@target_table, @basetable, @firstcount, @workdb, @dropbase);') else 'Select \'Drop not required\';' end;
prepare calldropsp from @calldropsp;
execute calldropsp;

select @createfinalstatement := case when (@tableexist = 0 or dropbase COLLATE utf8_unicode_ci = 'Y') then concat ('create table if not exists ', workdb COLLATE utf8_unicode_ci, '.', @basetable, ' (', table_struc.column_structure, ');') 
else 'select \'Table already created\';' end
from (select TABLE_NAME, group_concat(concat(COLUMN_NAME, ' ', COLUMN_TYPE, 
case when COLLATION_NAME is not null then concat(' COLLATE ', COLLATION_NAME) else '' end, 
case when IS_NULLABLE = 'YES' then concat(' DEFAULT ', coalesce(NUMERIC_SCALE, ' NULL')) else concat(' NOT NULL DEFAULT ', NUMERIC_SCALE) end) SEPARATOR ', \n') as column_structure 
from (
select * from information_schema.columns where table_name = target_table COLLATE utf8_unicode_ci and table_schema = mdwdb COLLATE utf8_unicode_ci
and COLUMN_NAME not in ('row_key', 'dw_inserted_on', 'dw_updated_on', 'etl_run_number', 'secondary1_changed_on', 'secondary2_changed_on')
order by COLUMN_NAME) SQ
group by TABLE_NAME) table_struc;
prepare createfinalstatement from @createfinalstatement;
execute createfinalstatement;

set @alterfinalstatement := case when (@tableexist = 0 or dropbase COLLATE utf8_unicode_ci = 'Y') then concat ('alter table ', workdb COLLATE utf8_unicode_ci, '.', @basetable, ' 
add column ', @lagging_count_var, ' INT(20) DEFAULT NULL,
add column inserted_on datetime DEFAULT NULL,
add PRIMARY KEY (row_id, source_id, n_key);')
else 'select \'Table already created\';' end;
prepare alterfinalstatement from @alterfinalstatement;
execute alterfinalstatement;

SET SQL_SAFE_UPDATES = 0;

set @updatebasestatement := case when @tableexist > 0 then concat('update ', workdb COLLATE utf8_unicode_ci, '.', @basetable, ' base \n
join ', mdwdb COLLATE utf8_unicode_ci, '.d_calendar_date CAL on CAL.month_start_date = date_format(base.n_date, \'%Y-%m-%d\') \n
set base.',@lagging_count_var,' = CAL.', @lagging_count_var, ' \n 
where base.', @lagging_count_var, ' <> CAL.',@lagging_count_var,';')
else 'select \'Table does not exist\';' end;
prepare updatebasestatement from @updatebasestatement;
execute updatebasestatement;

select @deletecurrent := case when @tableexist > 0 then concat('delete from ', workdb COLLATE utf8_unicode_ci, '.', @basetable, ' where ',@lagging_count_var,' <= 0;')
else 'select \'No record present\';' end;
prepare deletecurrent from @deletecurrent;
execute deletecurrent;

select @column_final_list:= concat('(',SQ.column_structure, ', ',@lagging_count_var,', inserted_on)\n'),
@column_insert_list:= concat(SQ.insert_col, ', CAL.',@lagging_count_var,', CURRENT_TIMESTAMP as inserted_on \n')

from (
select SQ.TABLE_NAME, 
group_concat(concat(case when SQ.COLUMN_NAME in ('calendar_code', 'n_date', 'n_key') then 
case when SQ.COLUMN_NAME = 'calendar_code' then concat('CAL.', 'calendar_code')
when SQ.COLUMN_NAME = 'n_date' then concat('CAL.', 'calendar_date')
when SQ.COLUMN_NAME = 'n_key' then concat('CAL.', 'row_key') end
else concat('F.', SQ.COLUMN_NAME) end, ' as ', SQ.COLUMN_NAME) SEPARATOR ', ') as insert_col, 

group_concat(SQ.COLUMN_NAME SEPARATOR ', ') as column_structure 
from (select * from information_schema.columns where table_name = target_table COLLATE utf8_unicode_ci and table_schema = mdwdb COLLATE utf8_unicode_ci
and COLUMN_NAME not in ('row_key', 'cdctype', 'dw_inserted_on', 'dw_updated_on', 'etl_run_number', 'secondary1_changed_on', 'secondary2_changed_on')
order by COLUMN_NAME) SQ
group by TABLE_NAME) SQ;

select @lagging_count := concat ('select @lagging_count_start := (case when lsm_aggregator.current_flag = \'N\' then CAL_CURR.',@lagging_count_var,' + 1 else CAL_CURR.',@lagging_count_var,' end) as lagging_count_start,
@lagging_count_end := (select distinct case when max_lagging_count > 0 then CAL_CURR.',@lagging_count_var,' 
else case when @firstcount = 0 and date_format(current_timestamp,\'%d\') = lsm_aggregator.day_of_week_month then CAL_CURR.',@lagging_count_var,' + 1 else CAL_CURR.',@lagging_count_var,' end end
from (select max(',@lagging_count_var,') max_lagging_count from ', workdb COLLATE utf8_unicode_ci, '.', target_table COLLATE utf8_unicode_ci, '_final_base) SQ ) as lagging_count_end
from ', mdwdb COLLATE utf8_unicode_ci, '.d_calendar_date CAL_CURR
join (select source_id, current_flag, target_table, retention, subject_area, calendar_code, day_of_week_month from ', workdb COLLATE utf8_unicode_ci, '.lsm_ls_dw_aggregator 
where target_table = \'', target_table COLLATE utf8_unicode_ci, '\' and subject_area = \'', @subject_area COLLATE utf8_unicode_ci, '\') lsm_aggregator
on CAL_CURR.calendar_code = lsm_aggregator.calendar_code and lsm_aggregator.target_table = \'', target_table COLLATE utf8_unicode_ci, '\' and lsm_aggregator.subject_area = \'', @subject_area COLLATE utf8_unicode_ci, '\'
where (date_format(current_timestamp,\'%Y%m%d\') = CAL_CURR.row_id);');

prepare lagging_count from @lagging_count;
execute lagging_count;

select @insertstatement := concat ('insert into ', workdb COLLATE utf8_unicode_ci, '.', @basetable, ' 
', @column_final_list ,'
select ' ,@column_insert_list, '
from ', case when @is_smpo = 'Y' then workdb COLLATE utf8_unicode_ci else mdwdb COLLATE utf8_unicode_ci end, '.', @dwh_table, ' F 
cross join (
select distinct case when @sn_type = \'MONTHLY\' then CAL_MN.calendar_date when @sn_type = \'WEEKLY\' then CAL_WK.calendar_date when @sn_type = \'DAILY\' then CAL.calendar_date end as calendar_date,
case when @sn_type = \'MONTHLY\' then CAL_MN.row_key when @sn_type = \'WEEKLY\' then CAL_WK.row_key when @sn_type = \'DAILY\' then CAL.row_key end as row_key,
CAL.',@lagging_count_var,', CAL.calendar_code
from ', mdwdb COLLATE utf8_unicode_ci, '.d_calendar_date CAL
left join ', mdwdb COLLATE utf8_unicode_ci, '.d_calendar_date CAL_MN
ON (date_format(CAL.month_start_date,\'%Y%m%d\') = CAL_MN.row_id)
left join ', mdwdb COLLATE utf8_unicode_ci, '.d_calendar_date CAL_WK
ON (date_format(CAL.week_start_date,\'%Y%m%d\') = CAL_WK.row_id)
where CAL.',@lagging_count_var,' between ', @lagging_count_start, ' and ', @lagging_count_end, ' 
) CAL
where F.soft_deleted_flag <> \'Y\';');

prepare insertstatement from @insertstatement;
execute insertstatement;

END //
 
DELIMITER ;