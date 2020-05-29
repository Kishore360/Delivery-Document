use #STG_TABLE_SCHEMA;

drop procedure if exists drop_snapshot_base;

DELIMITER //
CREATE PROCEDURE drop_snapshot_base (IN target_table varchar(64), base_table varchar(64), firstcount INT, workdb varchar(64), dropbase char(1))
BEGIN 
select target_table, base_table, firstcount, workdb, dropbase;

select @dropbasestatement := case when (firstcount = 0 or (firstcount <> 0 and dropbase COLLATE utf8_unicode_ci = 'Y')) 
then concat('drop table if exists ', workdb COLLATE utf8_unicode_ci, '.', base_table COLLATE utf8_unicode_ci)
else 'select \'Not dropping the base\'' end;
prepare dropbasestatement from @dropbasestatement;
execute dropbasestatement;

END //
 
DELIMITER ;

drop procedure if exists create_snapshot_current;

DELIMITER //
CREATE PROCEDURE create_snapshot_current (IN target_table varchar(64), mdsdb varchar(64), workdb varchar(64), mdwdb varchar(64), sn_type varchar(16), subject_area varchar(32), source_tz varchar(32), target_tz varchar(32), dropbase char(1))
BEGIN
set @target_table := target_table COLLATE utf8_unicode_ci, @mdwdb := mdwdb COLLATE utf8_unicode_ci, @workdb := workdb COLLATE utf8_unicode_ci, @dropbase := dropbase COLLATE utf8_unicode_ci, @basetable = concat(target_table COLLATE utf8_unicode_ci, '_final_base'), @lagging_count_var := case when sn_type COLLATE utf8_unicode_ci = 'MONTHLY' then 'lagging_count_of_month' when sn_type COLLATE utf8_unicode_ci = 'WEEKLY' then 'lagging_count_of_weeks' when sn_type COLLATE utf8_unicode_ci = 'DAILY' then 'lagging_count_of_days' end;
set @selectstatement := concat ('SELECT @dayofwkmn := day_of_week_month, @source_id := source_id, @enable_flag := enable_flag, @sn_type := type, @dwh_table := dwh_table, @current_flag := current_flag, @retention := retention FROM ', workdb COLLATE utf8_unicode_ci, '.lsm_ls_dw_aggregator where target_table = \'', target_table COLLATE utf8_unicode_ci, '\' and subject_area = \'', subject_area COLLATE utf8_unicode_ci, '\'');
prepare selectstatement from @selectstatement;
execute selectstatement;

select @reusevar := concat ('select @tableexist := max(case when table_schema = \'', workdb COLLATE utf8_unicode_ci, '\' AND table_name = \'', @basetable, '\' 
then 1 else 0 end) FROM information_schema.tables');
prepare reusevar from @reusevar;
execute reusevar;

set @reusevar2 := case when @tableexist > 0 then concat ('SELECT @firstcount := count(*)  FROM ', workdb COLLATE utf8_unicode_ci, '.', @basetable)
else 'SELECT @firstcount := 0' end;
prepare reusevar2 from @reusevar2;
execute reusevar2;

set @calldropsp := case when @tableexist > 0 then concat ('CALL drop_snapshot_base (@target_table, @basetable, @firstcount, @workdb, @dropbase)') else 'Select \'Drop not required\'' end;
prepare calldropsp from @calldropsp;
execute calldropsp;

select @createfinalstatement := case when (@tableexist = 0 or dropbase COLLATE utf8_unicode_ci = 'Y') then concat ('create table if not exists ', workdb COLLATE utf8_unicode_ci, '.', @basetable, ' (', table_struc.column_structure, ')') 
else 'select \'Table already created\'' end
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
add PRIMARY KEY (row_id, source_id, n_key)')
else 'select \'Table already created\'' end;
prepare alterfinalstatement from @alterfinalstatement;
execute alterfinalstatement;

SET SQL_SAFE_UPDATES = 0;

set @updatebasestatement := case when @tableexist > 0 then concat('update ', workdb COLLATE utf8_unicode_ci, '.', @basetable, ' base \n
join ', mdwdb COLLATE utf8_unicode_ci, '.d_calendar_date CAL on CAL.month_start_date = date_format(base.n_date, \'%Y-%m-%d\') \n
set base.',@lagging_count_var,' = CAL.', @lagging_count_var, ' \n 
where base.', @lagging_count_var, ' <> CAL.',@lagging_count_var)
else 'select \'Table does not exist\'' end;
prepare updatebasestatement from @updatebasestatement;
execute updatebasestatement;

select @deletecurrent := case when @tableexist > 0 then concat('delete from ', workdb COLLATE utf8_unicode_ci, '.', @basetable, ' where ',@lagging_count_var,' <= 0')
else 'select \'No record present\'' end;
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
where target_table = \'', target_table COLLATE utf8_unicode_ci, '\' and subject_area = \'', subject_area COLLATE utf8_unicode_ci, '\') lsm_aggregator
on CAL_CURR.calendar_code = lsm_aggregator.calendar_code and lsm_aggregator.target_table = \'', target_table COLLATE utf8_unicode_ci, '\' and lsm_aggregator.subject_area = \'', subject_area COLLATE utf8_unicode_ci, '\'
where (date_format(current_timestamp,\'%Y%m%d\') = CAL_CURR.row_id)');

prepare lagging_count from @lagging_count;
execute lagging_count;

select @insertstatement := concat ('insert into ', workdb COLLATE utf8_unicode_ci, '.', @basetable, ' 
', @column_final_list ,'
select ' ,@column_insert_list, '
from ', mdwdb COLLATE utf8_unicode_ci, '.', @dwh_table, ' F 
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
where F.soft_deleted_flag <> \'Y\'');

prepare insertstatement from @insertstatement;
execute insertstatement;

END //
 
DELIMITER ;