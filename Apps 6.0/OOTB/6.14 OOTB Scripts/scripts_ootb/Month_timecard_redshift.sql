/*****No. of time card by state***/
select 
year_name,month_name_abbreviated,
case when time_entered<0 then '('||to_char(abs(time_entered),'FM99,999')||')' else ''||to_char(abs(time_entered),'FM99,999')  end as time_entered
FROM (
SELECT
DC.year_id,DC.month_id,
DC.year_name,DC.month_name_abbreviated

,

round(sum( FTC.time_entered))::integer as time_entered
FROM 
#DWH_TABLE_SCHEMA.f_time_card FTC
 
 inner join #DWH_TABLE_SCHEMA.d_calendar_date DC
ON FTC.TIMECARD_ON_KEY=DC.ROW_KEY
 and FTC.soft_deleted_flag='N'
 and DC.ROW_KEY BETWEEN DC.month_start_date_key AND DC.month_end_date_key
-- and DC.week_start_date_key BETWEEN DC.month_start_date_key AND DC.month_end_date_key
and DC.lagging_count_of_month between 0 and 11

inner JOIN  #DWH_TABLE_SCHEMA.d_internal_contact int_co
 ON FTC.employee_key=int_co.ROW_KEY

 inner JOIN #DWH_TABLE_SCHEMA.d_h_all_hierarchies mang
 ON int_co.row_key=mang.lev_0_key
and  mang.hierarchy_class='EMPLOYEE'

inner JOIN #DWH_TABLE_SCHEMA.d_task D2
ON FTC.TASK_KEY=D2.ROW_KEY

  inner JOIN #DWH_TABLE_SCHEMA.d_lov lov_cat
   ON FTC.category_src_key=lov_cat.ROW_KEY
   JOIN #DWH_TABLE_SCHEMA.d_lov_map br_cat ON lov_cat.row_key = br_cat.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov_cat 
   ON wh_lov_cat.row_key = br_cat.wh_key AND br_cat.dimension_class::text = 'CATEGORY~TIME_CARD'::text
   
inner JOIN #DWH_TABLE_SCHEMA.d_lov lov_state
   ON FTC.state_src_key=lov_state.ROW_KEY
   JOIN #DWH_TABLE_SCHEMA.d_lov_map br_state
   ON lov_state.row_key = br_state.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov_state 
   ON wh_lov_state.row_key = br_state.wh_key AND br_state.dimension_class::text = 'STATE~TIME_CARD'::text

 inner join #DWH_TABLE_SCHEMA.d_project proj
   ON FTC.project_key=proj.ROW_KEY
group by
DC.year_id,DC.month_id,
DC.year_name,DC.month_name_abbreviated
order by 
DC.year_id,DC.month_id,
DC.year_name,DC.month_name_abbreviated
)