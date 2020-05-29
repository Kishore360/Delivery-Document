use #STG_TABLE_SCHEMA;

drop procedure if exists drop_snapshot_base;

DELIMITER //
CREATE PROCEDURE drop_snapshot_base (IN target_table varchar(128), base_table varchar(128), firstcount INT, workdb varchar(128), dropbase varchar(1))
-- Procedure for dropping base at first run or intended drop
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
CREATE PROCEDURE create_base_table (IN target_table varchar(128), dwh_table varchar(128), mdwdb varchar(128), workdb varchar(128), is_smpo varchar(1), OUT SN_BASE varchar(128))
-- Procedure for creating aggregated base for SMPO related tables
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

set @alterbasestatement := concat ('alter table ', workdb COLLATE utf8_unicode_ci, '.', @sn_base, ' add column row_id varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,add column assignment_group_manager_key bigint(20) DEFAULT 0, add column executive_leader_key bigint(20) DEFAULT 0, add column vendor_key bigint(20) DEFAULT 0, add column senior_leader_key bigint(20) DEFAULT 0, add column leader_key bigint(20) DEFAULT 0,add column inserted_on datetime DEFAULT NULL,add PRIMARY KEY (row_id, source_id);');
prepare alterbasestatement from @alterbasestatement;
execute alterbasestatement;

select @column_base_list:= concat('(',SQ.column_structure, ', inserted_on)\n'),
@column_baseinsert_list:= concat(SQ.insert_col, ', CURRENT_TIMESTAMP as inserted_on \n'),
@grouped_columns := concat(SQ.group_cols, '\n')

from (
select SQ.TABLE_NAME, 
group_concat(concat(case when SQ.COLUMN_NAME in ('assigned_to_key', 'assignment_group_key', 'source_id', 'row_id', 'closed_by_key', 'soft_deleted_flag', 'assignment_group_manager_key', 'executive_leader_key', 'vendor_key', 'senior_leader_key', 'leader_key') then 
case when SQ.COLUMN_NAME = 'row_id' then case when lower(@sn_base COLLATE utf8_unicode_ci) like '%request_item_smpo%' then concat('concat(F.assignment_group_key, \'_\', F.assigned_to_key, \'_\', F.closed_by_key)') else concat('concat(F.assignment_group_key, \'_\', F.assigned_to_key)') end
when SQ.COLUMN_NAME = 'assigned_to_key' then concat('F.', SQ.COLUMN_NAME)
when SQ.COLUMN_NAME = 'assignment_group_key' then concat('F.', SQ.COLUMN_NAME) 
when SQ.COLUMN_NAME = 'source_id' then concat('F.', SQ.COLUMN_NAME) 
when SQ.COLUMN_NAME = 'closed_by_key' then concat('F.', SQ.COLUMN_NAME) 
when SQ.COLUMN_NAME = 'soft_deleted_flag' then concat('F.', SQ.COLUMN_NAME) 
when SQ.COLUMN_NAME = 'assignment_group_manager_key' then 'AG_MAN.row_key'
when SQ.COLUMN_NAME = 'leader_key' then 'coalesce(AG_MAN.manager_key, AG_LEAD.row_key, HIER.lev_1_key)'
when SQ.COLUMN_NAME = 'senior_leader_key' then 'coalesce(HIER.lev_2_key, 0)'
when SQ.COLUMN_NAME = 'executive_leader_key' then 'coalesce(HIER.lev_3_key, 0)'
when SQ.COLUMN_NAME = 'vendor_key' then 'ASSIGNEE.vendor_key'
end
else concat('sum(F.', SQ.COLUMN_NAME, ')') end, ' as ', SQ.COLUMN_NAME) SEPARATOR ', ') as insert_col, 

group_concat(SQ.COLUMN_NAME SEPARATOR ', ') as column_structure,
group_concat(case when SQ.COLUMN_NAME in ('assigned_to_key', 'assignment_group_key', 'source_id', 'closed_by_key', 'soft_deleted_flag', 'assignment_group_manager_key', 'executive_leader_key', 'vendor_key', 'senior_leader_key', 'leader_key') then 
case when SQ.COLUMN_NAME = 'assigned_to_key' then concat('F.', SQ.COLUMN_NAME)
when SQ.COLUMN_NAME = 'assignment_group_key' then concat('F.', SQ.COLUMN_NAME) 
when SQ.COLUMN_NAME = 'source_id' then concat('F.', SQ.COLUMN_NAME) 
when SQ.COLUMN_NAME = 'closed_by_key' then concat('F.', SQ.COLUMN_NAME) 
when SQ.COLUMN_NAME = 'soft_deleted_flag' then concat('F.', SQ.COLUMN_NAME) 
when SQ.COLUMN_NAME = 'assignment_group_manager_key' then 'AG_MAN.row_key'
when SQ.COLUMN_NAME = 'leader_key' then 'coalesce(AG_MAN.manager_key, AG_LEAD.row_key, HIER.lev_1_key)'
when SQ.COLUMN_NAME = 'senior_leader_key' then 'coalesce(HIER.lev_2_key, 0)'
when SQ.COLUMN_NAME = 'executive_leader_key' then 'coalesce(HIER.lev_3_key, 0)'
when SQ.COLUMN_NAME = 'vendor_key' then 'ASSIGNEE.vendor_key'
end else null end SEPARATOR ', ') as group_cols
from (select * from information_schema.columns where table_name = @sn_base COLLATE utf8_unicode_ci and table_schema = workdb COLLATE utf8_unicode_ci
and COLUMN_NAME not in ('row_key', 'cdctype', 'dw_inserted_on', 'dw_updated_on', 'etl_run_number', 'secondary1_changed_on', 'secondary2_changed_on', 'changed_by', 'changed_on', 'created_by', 'created_on', 'inserted_on')
order by COLUMN_NAME) SQ
group by TABLE_NAME) SQ;

select @insertbasestatement := concat ('insert into ', workdb COLLATE utf8_unicode_ci, '.', @sn_base, ' 
', @column_base_list ,'
select ' ,@column_baseinsert_list, '
from ', mdwdb COLLATE utf8_unicode_ci, '.', dwh_table COLLATE utf8_unicode_ci, ' F 
left join ', mdwdb COLLATE utf8_unicode_ci, '.d_internal_contact ASSIGNEE 
on ASSIGNEE.row_key = F.assigned_to_key
left join ', mdwdb COLLATE utf8_unicode_ci, '.d_internal_organization AG 
on AG.row_key = F.assignment_group_key
left join ', mdwdb COLLATE utf8_unicode_ci, '.d_internal_contact AG_MAN
on AG_MAN.row_key = AG.manager_key
left join ', mdwdb COLLATE utf8_unicode_ci, '.d_h_all_hierarchies HIER
on AG.manager_key = HIER.lev_0_key and HIER.hierarchy_class = \'EMPLOYEE\'
left join ', mdwdb COLLATE utf8_unicode_ci, '.d_internal_contact AG_LEAD
on AG_LEAD.row_key = AG_MAN.manager_key
left join ', mdwdb COLLATE utf8_unicode_ci, '.d_internal_contact AG_SEN_LEAD
on AG_SEN_LEAD.row_key = AG_LEAD.manager_key
left join ', mdwdb COLLATE utf8_unicode_ci, '.d_internal_contact AG_EXE_LEAD
on AG_EXE_LEAD.row_key = AG_SEN_LEAD.manager_key
join ', mdwdb COLLATE utf8_unicode_ci, '.d_calendar_date CAL
  on CAL.row_key = F.calendar_date_key
join ', mdwdb COLLATE utf8_unicode_ci, '.d_calendar_date CAL_MN
  on CAL_MN.row_key = CAL.month_start_date_key
where F.soft_deleted_flag <> \'Y\' and CAL_MN.lagging_count_of_month <=0
group by ', @grouped_columns,';');

prepare insertbasestatement from @insertbasestatement;
execute insertbasestatement;

set SN_BASE = @sn_base;

END //

DELIMITER ;

drop procedure if exists create_lst_mn_base_table;

DELIMITER //
CREATE PROCEDURE create_lst_mn_base_table (IN target_table varchar(128), dwh_table varchar(128), mdwdb varchar(128), workdb varchar(128), is_smpo varchar(1), SN_BASE varchar(128), OUT SN_BASE_OLD varchar(128))
-- Procedure for creating aggregated base for last month for SMPO related tables
BEGIN 
select target_table, dwh_table, mdwdb, workdb, is_smpo, @sn_base_old := concat(SN_BASE COLLATE utf8_unicode_ci, '_lst_mn');

select @droplstmnsnbase := concat('drop table if exists ', workdb COLLATE utf8_unicode_ci, '.', @sn_base_old, ';');
prepare droplstmnsnbase from @droplstmnsnbase;
execute droplstmnsnbase;

select @createlstmnsnbase := concat ('create table if not exists ', workdb COLLATE utf8_unicode_ci, '.', @sn_base_old, ' like ', workdb COLLATE utf8_unicode_ci, '.', SN_BASE COLLATE utf8_unicode_ci, ';');
prepare createlstmnsnbase from @createlstmnsnbase;
execute createlstmnsnbase;

select @column_lst_mn_base:= concat('(',SQ.column_structure, ', inserted_on)\n'),
@column_lst_mn_baseinsert:= concat(SQ.insert_col, ', CURRENT_TIMESTAMP as inserted_on \n'),
@grouped_lst_mn_columns := concat(SQ.group_cols, '\n')

from (
select SQ.TABLE_NAME, 
group_concat(concat(case when SQ.COLUMN_NAME in ('assigned_to_key', 'assignment_group_key', 'source_id', 'row_id', 'closed_by_key', 'soft_deleted_flag', 'assignment_group_manager_key', 'executive_leader_key', 'vendor_key', 'senior_leader_key', 'leader_key') then 
case when SQ.COLUMN_NAME = 'row_id' then case when lower(@sn_base_old COLLATE utf8_unicode_ci) like '%request_item_smpo%' then concat('concat(F.assignment_group_key, \'_\', F.assigned_to_key, \'_\', F.closed_by_key)') else concat('concat(F.assignment_group_key, \'_\', F.assigned_to_key)') end
when SQ.COLUMN_NAME = 'assigned_to_key' then concat('F.', SQ.COLUMN_NAME)
when SQ.COLUMN_NAME = 'assignment_group_key' then concat('F.', SQ.COLUMN_NAME) 
when SQ.COLUMN_NAME = 'source_id' then concat('F.', SQ.COLUMN_NAME) 
when SQ.COLUMN_NAME = 'closed_by_key' then concat('F.', SQ.COLUMN_NAME) 
when SQ.COLUMN_NAME = 'soft_deleted_flag' then concat('F.', SQ.COLUMN_NAME) 
when SQ.COLUMN_NAME = 'assignment_group_manager_key' then 'AG_MAN.row_key'
when SQ.COLUMN_NAME = 'leader_key' then 'coalesce(AG_MAN.manager_key, AG_LEAD.row_key, HIER.lev_1_key)'
when SQ.COLUMN_NAME = 'senior_leader_key' then 'coalesce(HIER.lev_2_key, 0)'
when SQ.COLUMN_NAME = 'executive_leader_key' then 'coalesce(HIER.lev_3_key, 0)'
when SQ.COLUMN_NAME = 'vendor_key' then 'ASSIGNEE.vendor_key'
end
else concat('sum(F.', SQ.COLUMN_NAME, ')') end, ' as ', SQ.COLUMN_NAME) SEPARATOR ', ') as insert_col, 

group_concat(SQ.COLUMN_NAME SEPARATOR ', ') as column_structure,
group_concat(case when SQ.COLUMN_NAME in ('assigned_to_key', 'assignment_group_key', 'source_id', 'closed_by_key', 'soft_deleted_flag', 'assignment_group_manager_key', 'executive_leader_key', 'vendor_key', 'senior_leader_key', 'leader_key') then 
case when SQ.COLUMN_NAME = 'assigned_to_key' then concat('F.', SQ.COLUMN_NAME)
when SQ.COLUMN_NAME = 'assignment_group_key' then concat('F.', SQ.COLUMN_NAME) 
when SQ.COLUMN_NAME = 'source_id' then concat('F.', SQ.COLUMN_NAME) 
when SQ.COLUMN_NAME = 'closed_by_key' then concat('F.', SQ.COLUMN_NAME) 
when SQ.COLUMN_NAME = 'soft_deleted_flag' then concat('F.', SQ.COLUMN_NAME) 
when SQ.COLUMN_NAME = 'assignment_group_manager_key' then 'AG_MAN.row_key'
when SQ.COLUMN_NAME = 'leader_key' then 'coalesce(AG_MAN.manager_key, AG_LEAD.row_key, HIER.lev_1_key)'
when SQ.COLUMN_NAME = 'senior_leader_key' then 'coalesce(HIER.lev_2_key, 0)'
when SQ.COLUMN_NAME = 'executive_leader_key' then 'coalesce(HIER.lev_3_key, 0)'
when SQ.COLUMN_NAME = 'vendor_key' then 'ASSIGNEE.vendor_key'
end else null end SEPARATOR ', ') as group_cols
from (select * from information_schema.columns where table_name = @sn_base_old COLLATE utf8_unicode_ci and table_schema = workdb COLLATE utf8_unicode_ci
and COLUMN_NAME not in ('row_key', 'cdctype', 'dw_inserted_on', 'dw_updated_on', 'etl_run_number', 'secondary1_changed_on', 'secondary2_changed_on', 'changed_by', 'changed_on', 'created_by', 'created_on', 'inserted_on')
order by COLUMN_NAME) SQ
group by TABLE_NAME) SQ;

select @insertlstmnbase := concat ('insert into ', workdb COLLATE utf8_unicode_ci, '.', @sn_base_old, ' 
', @column_lst_mn_base ,'
select ' ,@column_lst_mn_baseinsert, '
from ', mdwdb COLLATE utf8_unicode_ci, '.', dwh_table COLLATE utf8_unicode_ci, ' F 
left join ', mdwdb COLLATE utf8_unicode_ci, '.d_internal_contact ASSIGNEE 
on ASSIGNEE.row_key = F.assigned_to_key
left join ', mdwdb COLLATE utf8_unicode_ci, '.d_internal_organization AG 
on AG.row_key = F.assignment_group_key
left join ', mdwdb COLLATE utf8_unicode_ci, '.d_internal_contact AG_MAN
on AG_MAN.row_key = AG.manager_key
left join ', mdwdb COLLATE utf8_unicode_ci, '.d_h_all_hierarchies HIER
on AG.manager_key = HIER.lev_0_key and HIER.hierarchy_class = \'EMPLOYEE\'
left join ', mdwdb COLLATE utf8_unicode_ci, '.d_internal_contact AG_LEAD
on AG_LEAD.row_key = AG_MAN.manager_key
left join ', mdwdb COLLATE utf8_unicode_ci, '.d_internal_contact AG_SEN_LEAD
on AG_SEN_LEAD.row_key = AG_LEAD.manager_key
left join ', mdwdb COLLATE utf8_unicode_ci, '.d_internal_contact AG_EXE_LEAD
on AG_EXE_LEAD.row_key = AG_SEN_LEAD.manager_key
join ', mdwdb COLLATE utf8_unicode_ci, '.d_calendar_date CAL
  on CAL.row_key = F.calendar_date_key
join ', mdwdb COLLATE utf8_unicode_ci, '.d_calendar_date CAL_MN
  on CAL_MN.row_key = CAL.month_start_date_key
where F.soft_deleted_flag <> \'Y\' and CAL_MN.lagging_count_of_month = 1
group by ', @grouped_lst_mn_columns,';');

prepare insertlstmnbase from @insertlstmnbase;
execute insertlstmnbase;

set SN_BASE_OLD = @sn_base_old;

END //

DELIMITER ;

drop procedure if exists create_dq_base_table;

DELIMITER //
CREATE PROCEDURE create_dq_base_table (IN target_table varchar(128), dwh_table varchar(128), mdwdb varchar(128), workdb varchar(128), is_dq varchar(1), OUT DQ_BASE varchar(128))
-- Procedure for creating custom base for DQ related tables
BEGIN 
select target_table, dwh_table, mdwdb, workdb, is_dq, @dq_base := concat(dwh_table COLLATE utf8_unicode_ci, '_dq_base');

select @dropdqbasestatement := concat('drop table if exists ', workdb COLLATE utf8_unicode_ci, '.', @dq_base, ';');
prepare dropdqbasestatement from @dropdqbasestatement;
execute dropdqbasestatement;

select @createdqbasestatement := concat ('create table if not exists ', workdb COLLATE utf8_unicode_ci, '.', @dq_base, ' (', table_struc.column_structure, ');') 
from (select TABLE_NAME, group_concat(concat(COLUMN_NAME, ' ', COLUMN_TYPE, 
case when COLLATION_NAME is not null then concat(' COLLATE ', COLLATION_NAME) else '' end, 
case when IS_NULLABLE = 'YES' then concat(' DEFAULT ', coalesce(NUMERIC_SCALE, ' NULL')) else concat(' NOT NULL DEFAULT ', NUMERIC_SCALE) end) SEPARATOR ', \n') as column_structure 
from (
select * from information_schema.columns where table_name = dwh_table COLLATE utf8_unicode_ci and table_schema = mdwdb COLLATE utf8_unicode_ci
and COLUMN_NAME not in ('row_key', 'calendar_date_key', 'dw_inserted_on', 'dw_updated_on', 'etl_run_number', 'secondary1_changed_on', 'secondary2_changed_on', 'assignment_group_key', 'department_key', 'executive_leader_key', 'vendor_key', 'assigned_to_key', 'senior_leader_key', 'leader_key', 'assignment_group_manager_key')
order by COLUMN_NAME) SQ
group by TABLE_NAME) table_struc;
prepare createdqbasestatement from @createdqbasestatement;
execute createdqbasestatement;

set @alterdqbasestatement := concat ('alter table ', workdb COLLATE utf8_unicode_ci, '.', @dq_base, ' 
add column inserted_on datetime DEFAULT NULL,
add column assignment_group_key bigint(20) DEFAULT 0, 
add column assignment_group_manager_key bigint(20) DEFAULT 0, 
add column department_key bigint(20) DEFAULT 0, 
add column executive_leader_key bigint(20) DEFAULT 0, 
add column vendor_key bigint(20) DEFAULT 0, 
add column assigned_to_key bigint(20) DEFAULT 0, 
add column senior_leader_key bigint(20) DEFAULT 0, 
add column leader_key bigint(20) DEFAULT 0,
add PRIMARY KEY (row_id, source_id);');
prepare alterdqbasestatement from @alterdqbasestatement;
execute alterdqbasestatement;

select case when dwh_table COLLATE utf8_unicode_ci = 'f_dq_change_fact' then @base_fact:= replace(replace(dwh_table COLLATE utf8_unicode_ci, '_fact', '_request'), 'f_dq_', 'f_')
else @base_fact:= replace(replace(dwh_table COLLATE utf8_unicode_ci, '_fact', ''), 'f_dq_', 'f_') end base_fact_name,
case when dwh_table COLLATE utf8_unicode_ci = 'f_dq_change_fact' then @key_column:= replace(replace(dwh_table COLLATE utf8_unicode_ci, '_fact', '_request_key'), 'f_dq_', '')
else @key_column:=replace(replace(dwh_table COLLATE utf8_unicode_ci, '_fact', '_key'), 'f_dq_', '') end key_column,
case when dwh_table COLLATE utf8_unicode_ci = 'f_dq_change_fact' then @dept_column:= 'requested_by_department_key'
else @dept_column:='opened_by_department_key' end dept_column;

select @column_dqbase_list:= concat('(',SQ.column_structure, ', inserted_on)\n'),
@column_dqbaseinsert_list:= concat(SQ.insert_col, ', CURRENT_TIMESTAMP as inserted_on \n')

from (
select SQ.TABLE_NAME, 
group_concat(concat(case when SQ.COLUMN_NAME in ('assignment_group_key', 'assignment_group_manager_key', 'department_key', 'executive_leader_key', 'vendor_key', 'assigned_to_key', 'senior_leader_key', 'leader_key') then
case when SQ.COLUMN_NAME = 'assignment_group_key' then 'BF.assignment_group_key'
when SQ.COLUMN_NAME = 'assignment_group_manager_key' then 'AG_MAN.row_key'
when SQ.COLUMN_NAME = 'department_key' then concat('BF.', @dept_column)
when SQ.COLUMN_NAME = 'leader_key' then 'coalesce(AG_MAN.manager_key, AG_LEAD.row_key, HIER.lev_1_key)'
when SQ.COLUMN_NAME = 'senior_leader_key' then 'coalesce(HIER.lev_2_key, 0)'
when SQ.COLUMN_NAME = 'executive_leader_key' then 'coalesce(HIER.lev_3_key, 0)'
when SQ.COLUMN_NAME = 'assigned_to_key' then 'BF.assigned_to_key'
when SQ.COLUMN_NAME = 'vendor_key' then 'ASSIGNEE.vendor_key'
end
else concat('F.', SQ.COLUMN_NAME) end, ' as ', SQ.COLUMN_NAME) SEPARATOR ', ') as insert_col,
group_concat(SQ.COLUMN_NAME SEPARATOR ', ') as column_structure

from (select * from information_schema.columns where table_name = @dq_base COLLATE utf8_unicode_ci and table_schema = workdb COLLATE utf8_unicode_ci
and COLUMN_NAME not in ('row_key', 'cdctype', 'dw_inserted_on', 'dw_updated_on', 'etl_run_number', 'secondary1_changed_on', 'secondary2_changed_on', 'changed_by', 'changed_on', 'created_by', 'created_on', 'inserted_on')
order by COLUMN_NAME) SQ
group by TABLE_NAME) SQ;

select @insertdqbasestatement := concat ('insert into ', workdb COLLATE utf8_unicode_ci, '.', @dq_base, ' 
', @column_dqbase_list ,'
select ' ,@column_dqbaseinsert_list, '
from ', mdwdb COLLATE utf8_unicode_ci, '.', dwh_table COLLATE utf8_unicode_ci, ' F 
left join ', mdwdb COLLATE utf8_unicode_ci, '.', @base_fact, ' BF 
on BF.', @key_column, ' = F.target_key 
left join ', mdwdb COLLATE utf8_unicode_ci, '.d_internal_contact ASSIGNEE 
on ASSIGNEE.row_key = BF.assigned_to_key
left join ', mdwdb COLLATE utf8_unicode_ci, '.d_internal_organization AG 
on AG.row_key = BF.assignment_group_key
left join ', mdwdb COLLATE utf8_unicode_ci, '.d_internal_contact AG_MAN
on AG_MAN.row_key = AG.manager_key
left join ', mdwdb COLLATE utf8_unicode_ci, '.d_h_all_hierarchies HIER
on AG.manager_key = HIER.lev_0_key and HIER.hierarchy_class = \'EMPLOYEE\'
left join ', mdwdb COLLATE utf8_unicode_ci, '.d_internal_contact AG_LEAD
on AG_LEAD.row_key = AG_MAN.manager_key
left join ', mdwdb COLLATE utf8_unicode_ci, '.d_internal_contact AG_SEN_LEAD
on AG_SEN_LEAD.row_key = AG_LEAD.manager_key
left join ', mdwdb COLLATE utf8_unicode_ci, '.d_internal_contact AG_EXE_LEAD
on AG_EXE_LEAD.row_key = AG_SEN_LEAD.manager_key
where F.soft_deleted_flag <> \'Y\' ;');

prepare insertdqbasestatement from @insertdqbasestatement;
execute insertdqbasestatement;

set DQ_BASE = @dq_base;

END //

DELIMITER ;

drop procedure if exists create_smpo_backlog_base_table;

DELIMITER //
CREATE PROCEDURE create_smpo_backlog_base_table (IN target_table varchar(128), dwh_table varchar(128), mdwdb varchar(128), workdb varchar(128), is_smpo_backlog varchar(1), OUT SN_BACKLOG_BASE varchar(128))
-- Procedure for creating custom base for DQ related tables
BEGIN 
select target_table, dwh_table, mdwdb, workdb, is_smpo_backlog, @smpo_backlog_base := concat(dwh_table COLLATE utf8_unicode_ci, '_smpo_backlog_base');

select @dropbacklogbasestatement := concat('drop table if exists ', workdb COLLATE utf8_unicode_ci, '.', @smpo_backlog_base, ';');
prepare dropbacklogbasestatement from @dropbacklogbasestatement;
execute dropbacklogbasestatement;

select @createbacklogbasestatement := concat ('create table if not exists ', workdb COLLATE utf8_unicode_ci, '.', @smpo_backlog_base, ' (', table_struc.column_structure, ');') 
from (select TABLE_NAME, group_concat(concat(COLUMN_NAME, ' ', COLUMN_TYPE, 
case when COLLATION_NAME is not null then concat(' COLLATE ', COLLATION_NAME) else '' end, 
case when IS_NULLABLE = 'YES' then concat(' DEFAULT ', coalesce(NUMERIC_SCALE, ' NULL')) else concat(' NOT NULL DEFAULT ', NUMERIC_SCALE) end) SEPARATOR ', \n') as column_structure 
from (
select * from information_schema.columns where table_name = dwh_table COLLATE utf8_unicode_ci and table_schema = mdwdb COLLATE utf8_unicode_ci
and COLUMN_NAME not in ('row_key', 'calendar_date_key', 'dw_inserted_on', 'dw_updated_on', 'etl_run_number', 'secondary1_changed_on', 'secondary2_changed_on', 'department_key', 'executive_leader_key', 'vendor_key', 'senior_leader_key', 'leader_key', 'assignment_group_manager_key')
order by COLUMN_NAME) SQ
group by TABLE_NAME) table_struc;
prepare createbacklogbasestatement from @createbacklogbasestatement;
execute createbacklogbasestatement;

set @alterbacklogbasestatement := concat ('alter table ', workdb COLLATE utf8_unicode_ci, '.', @smpo_backlog_base, ' 
add column inserted_on datetime DEFAULT NULL,
add column assignment_group_manager_key bigint(20) DEFAULT 0,
add column executive_leader_key bigint(20) DEFAULT 0, 
add column vendor_key bigint(20) DEFAULT 0, 
add column senior_leader_key bigint(20) DEFAULT 0, 
add column leader_key bigint(20) DEFAULT 0,
add PRIMARY KEY (row_id, source_id);');
prepare alterbacklogbasestatement from @alterbacklogbasestatement;
execute alterbacklogbasestatement;

select @column_backlogbase_list:= concat('(',SQ.column_structure, ', inserted_on)\n'),
@column_backlogbaseinsert_list:= concat(SQ.insert_col, ', CURRENT_TIMESTAMP as inserted_on \n')

from (
select SQ.TABLE_NAME, 
group_concat(concat(case when SQ.COLUMN_NAME in ('assignment_group_manager_key', 'department_key', 'executive_leader_key', 'vendor_key', 'senior_leader_key', 'leader_key') then
case when SQ.COLUMN_NAME = 'assignment_group_manager_key' then 'AG_MAN.row_key'
when SQ.COLUMN_NAME = 'leader_key' then 'coalesce(AG_MAN.manager_key, AG_LEAD.row_key, HIER.lev_1_key)'
when SQ.COLUMN_NAME = 'senior_leader_key' then 'coalesce(HIER.lev_2_key, 0)'
when SQ.COLUMN_NAME = 'executive_leader_key' then 'coalesce(HIER.lev_3_key, 0)'
when SQ.COLUMN_NAME = 'vendor_key' then 'ASSIGNEE.vendor_key'
end
else concat('F.', SQ.COLUMN_NAME) end, ' as ', SQ.COLUMN_NAME) SEPARATOR ', ') as insert_col,
group_concat(SQ.COLUMN_NAME SEPARATOR ', ') as column_structure

from (select * from information_schema.columns where table_name = @smpo_backlog_base COLLATE utf8_unicode_ci and table_schema = workdb COLLATE utf8_unicode_ci
and COLUMN_NAME not in ('row_key', 'cdctype', 'dw_inserted_on', 'dw_updated_on', 'etl_run_number', 'secondary1_changed_on', 'secondary2_changed_on', 'changed_by', 'changed_on', 'created_by', 'created_on', 'inserted_on')
order by COLUMN_NAME) SQ
group by TABLE_NAME) SQ;

select @insertbacklogbasestatement := concat ('insert into ', workdb COLLATE utf8_unicode_ci, '.', @smpo_backlog_base, ' 
', @column_backlogbase_list ,'
select ' ,@column_backlogbaseinsert_list, '
from ', mdwdb COLLATE utf8_unicode_ci, '.', dwh_table COLLATE utf8_unicode_ci, ' F 
left join ', mdwdb COLLATE utf8_unicode_ci, '.d_internal_contact ASSIGNEE 
on ASSIGNEE.row_key = F.assigned_to_key
left join ', mdwdb COLLATE utf8_unicode_ci, '.d_internal_organization AG 
on AG.row_key = F.assignment_group_key
left join ', mdwdb COLLATE utf8_unicode_ci, '.d_h_all_hierarchies HIER
on AG.manager_key = HIER.lev_0_key and HIER.hierarchy_class = \'EMPLOYEE\'
left join ', mdwdb COLLATE utf8_unicode_ci, '.d_internal_contact AG_MAN
on AG_MAN.row_key = AG.manager_key
left join ', mdwdb COLLATE utf8_unicode_ci, '.d_internal_contact AG_LEAD
on AG_LEAD.row_key = AG_MAN.manager_key
left join ', mdwdb COLLATE utf8_unicode_ci, '.d_internal_contact AG_SEN_LEAD
on AG_SEN_LEAD.row_key = AG_LEAD.manager_key
left join ', mdwdb COLLATE utf8_unicode_ci, '.d_internal_contact AG_EXE_LEAD
on AG_EXE_LEAD.row_key = AG_SEN_LEAD.manager_key
where F.soft_deleted_flag <> \'Y\' ;');

prepare insertbacklogbasestatement from @insertbacklogbasestatement;
execute insertbacklogbasestatement;

set SN_BACKLOG_BASE = @smpo_backlog_base;

END //

DELIMITER ;

drop procedure if exists create_snapshot_current;

DELIMITER //
CREATE PROCEDURE create_snapshot_current (IN target_table varchar(128), mdsdb varchar(128), workdb varchar(128), mdwdb varchar(128), source_id bigint(20), dropbase varchar(1))
-- Main Procedure for creating base for all current snapshot tables
BEGIN

set @selectstatement := concat ('SELECT @dayofwkmn := day_of_week_month, @source_id := source_id, @enable_flag := enable_flag, @sn_type := type, @dwh_table := dwh_table, @current_flag := current_flag, @retention := retention,
@subject_area := subject_area, @is_smpo := case when lower(subject_area) like \'%smpo%\' and lower(subject_area) not like \'%backlog%\' and lower(subject_area) not like \'%lov_smpo%\' then \'Y\' else \'N\' end,
@is_dq := case when lower(subject_area) like \'%_dq_%\' and lower(target_table) like \'f_n_dq_%\' then \'Y\' else \'N\' end, 
@is_smpo_backlog := case when lower(subject_area) like \'%_backlog_smpo_%\' and lower(target_table) like \'f_n_a_%_backlog_smpo_%\' then \'Y\' else \'N\' end
FROM ', workdb COLLATE utf8_unicode_ci, '.lsm_ls_dw_aggregator where target_table = \'', target_table COLLATE utf8_unicode_ci, '\' and source_id = \'', source_id, '\';');
prepare selectstatement from @selectstatement;
execute selectstatement;

set @target_table := target_table COLLATE utf8_unicode_ci, @mdwdb := mdwdb COLLATE utf8_unicode_ci, @workdb := workdb COLLATE utf8_unicode_ci, @dropbase := dropbase COLLATE utf8_unicode_ci, @basetable = concat(target_table COLLATE utf8_unicode_ci, '_final1_base'), @lagging_count_var := case when @sn_type = 'MONTHLY' then 'lagging_count_of_month' when @sn_type = 'WEEKLY' then 'lagging_count_of_weeks' when @sn_type = 'DAILY' then 'lagging_count_of_days' end;

set @callcreatebasesp := case when @is_smpo = 'Y' then concat ('CALL create_base_table (@target_table, @dwh_table, @mdwdb, @workdb, @is_smpo, @SN_BASE);') else 'Select \'Using default DWH table\';' end;
prepare callcreatebasesp from @callcreatebasesp;
execute callcreatebasesp;

set @callcreatebasesp := case when @is_smpo_backlog = 'Y' then concat ('CALL create_smpo_backlog_base_table (@target_table, @dwh_table, @mdwdb, @workdb, @is_smpo_backlog, @SN_BACKLOG_BASE);') else 'Select \'Using default DWH table\';' end;
prepare callcreatebasesp from @callcreatebasesp;
execute callcreatebasesp;

set @callcreatebasesp := case when @is_dq = 'Y' then concat ('CALL create_dq_base_table (@target_table, @dwh_table, @mdwdb, @workdb, @is_dq, @DQ_BASE);') else 'Select \'Using default DWH table\';' end;
prepare callcreatebasesp from @callcreatebasesp;
execute callcreatebasesp;

select @reusevar := concat ('select @tableexist := max(case when table_schema = \'', workdb COLLATE utf8_unicode_ci, '\' AND table_name = \'', @basetable, '\' 
then 1 else 0 end) FROM information_schema.tables;');
prepare reusevar from @reusevar;
execute reusevar;

set @reusevar1 := concat ('SELECT snapshot_table, @auditcount := count(*)  FROM ', workdb COLLATE utf8_unicode_ci, '.lsm_ls_dw_snapshot_audit
where snapshot_table = \'', target_table COLLATE utf8_unicode_ci,'\' group by snapshot_table ;');
prepare reusevar1 from @reusevar1;
execute reusevar1;

select case when @auditcount <= 1 then @dropbase := 'Y' else @dropbase := @dropbase end;

set @reusevar2 := case when @tableexist > 0 then concat ('SELECT @firstcount := count(*)  FROM ', workdb COLLATE utf8_unicode_ci, '.', @basetable, ';')
else 'SELECT @firstcount := 0;' end;
prepare reusevar2 from @reusevar2;
execute reusevar2;

set @create_lst_mn_base_table := case when @is_smpo = 'Y' and (@firstcount = 0 or @dropbase  = 'Y') then concat ('CALL create_lst_mn_base_table (@target_table, @dwh_table, @mdwdb, @workdb, @is_smpo, @SN_BASE, @SN_BASE_OLD);') else 'Select \'Not the first load\';' end;
prepare create_lst_mn_base_table from @create_lst_mn_base_table;
execute create_lst_mn_base_table;

select @dwh_table := case when @is_smpo = 'Y' then @SN_BASE when @is_dq = 'Y' then @DQ_BASE when @is_smpo_backlog = 'Y' then @SN_BACKLOG_BASE else @dwh_table end;

set @calldropsp := case when @tableexist > 0 then concat ('CALL drop_snapshot_base (@target_table, @basetable, @firstcount, @workdb, @dropbase);') else 'Select \'Drop not required\';' end;
prepare calldropsp from @calldropsp;
execute calldropsp;

select @createfinalstatement := case when (@tableexist = 0 or @dropbase = 'Y') then concat ('create table if not exists ', workdb COLLATE utf8_unicode_ci, '.', @basetable, ' (', table_struc.column_structure, ');') 
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

set @alterfinalstatement := case when (@tableexist = 0 or @dropbase = 'Y') then concat ('alter table ', workdb COLLATE utf8_unicode_ci, '.', @basetable, ' 
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

select case when @is_smpo = 'Y' and (@firstcount = 0 or @dropbase = 'Y') then @insertlstmn := concat ('insert into ', workdb COLLATE utf8_unicode_ci, '.', @basetable, ' 
', @column_final_list ,'
select ' ,@column_insert_list, '
from ', workdb COLLATE utf8_unicode_ci, '.', @SN_BASE_OLD, ' F 
cross join (
select distinct case when @sn_type = \'MONTHLY\' then CAL_MN.calendar_date when @sn_type = \'WEEKLY\' then CAL_WK.calendar_date when @sn_type = \'DAILY\' then CAL.calendar_date end as calendar_date,
case when @sn_type = \'MONTHLY\' then CAL_MN.row_key when @sn_type = \'WEEKLY\' then CAL_WK.row_key when @sn_type = \'DAILY\' then CAL.row_key end as row_key,
CAL.',@lagging_count_var,', CAL.calendar_code
from ', mdwdb COLLATE utf8_unicode_ci, '.d_calendar_date CAL
left join ', mdwdb COLLATE utf8_unicode_ci, '.d_calendar_date CAL_MN
ON (date_format(CAL.month_start_date,\'%Y%m%d\') = CAL_MN.row_id)
left join ', mdwdb COLLATE utf8_unicode_ci, '.d_calendar_date CAL_WK
ON (date_format(CAL.week_start_date,\'%Y%m%d\') = CAL_WK.row_id)
where CAL.',@lagging_count_var,' = 1 ) CAL
where F.soft_deleted_flag <> \'Y\';') else @insertlstmn := 'select \'Not inserting\';' end,
case when @is_smpo = 'Y' and (@firstcount = 0 or @dropbase = 'Y') then @firstcount := @firstcount + 1 else null end;

prepare insertlstmn from @insertlstmn;
execute insertlstmn;

select @lagging_count := concat ('select @lagging_count_start := (case when lsm_aggregator.current_flag = \'N\' then CAL_CURR.',@lagging_count_var,' + 1 else CAL_CURR.',@lagging_count_var,' end) as lagging_count_start,
@lagging_count_end := (select distinct case when max_lagging_count > 0 then CAL_CURR.',@lagging_count_var,' 
else case when (@firstcount = 0 and date_format(current_timestamp,\'%d\') = lsm_aggregator.day_of_week_month) or @auditcount = 1 then CAL_CURR.',@lagging_count_var,' + 1 else CAL_CURR.',@lagging_count_var,' end end
from (select max(',@lagging_count_var,') max_lagging_count from ', workdb COLLATE utf8_unicode_ci, '.', target_table COLLATE utf8_unicode_ci, '_final1_base) SQ ) as lagging_count_end
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
from ', (case when @is_smpo = 'Y' or @is_dq = 'Y' or @is_smpo_backlog = 'Y' then workdb else mdwdb end) COLLATE utf8_unicode_ci, '.', @dwh_table, ' F 
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