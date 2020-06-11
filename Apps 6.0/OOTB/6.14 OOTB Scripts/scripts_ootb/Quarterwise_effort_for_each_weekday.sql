
select 
	quarter_name
,	week_name
,case when monday<0 then '('||to_char(abs(monday),'FM99,999')||')' else ''||to_char(abs(monday),'FM99,999')  end as monday

,	case when tuesday<0 then '('||to_char(abs(tuesday),'FM99,999')||')' else ''||to_char(abs(tuesday),'FM99,999')  end as tuesday
,	case when wednesday<0 then '('||to_char(abs(wednesday),'FM99,999')||')' else ''||to_char(abs(wednesday),'FM99,999')  end as wednesday
,	case when thursday<0 then '('||to_char(abs(thursday),'FM99,999')||')' else ''||to_char(abs(thursday),'FM99,999')  end as thursday
,	case when friday<0 then '('||to_char(abs(friday),'FM99,999')||')' else ''||to_char(abs(friday),'FM99,999')  end as friday
,	case when saturday<0 then '('||to_char(abs(saturday),'FM99,999')||')' else ''||to_char(abs(saturday),'FM99,999')  end as saturday
,	case when sunday<0 then '('||to_char(abs(sunday),'FM99,999')||')' else ''||to_char(abs(sunday),'FM99,999')  end as sunday


FROM (

SELECT
DC.quarter_id,
DC.quarter_name,
DC.week_id,
DC.week_name
-- ,D.first_name as employee_name
 ,round(sum(  case when DC.day_name='Monday' then FTC.time_entered else 0 end))::integer as monday
 ,round(sum(  case when DC.day_name='Tuesday' then FTC.time_entered else 0 end))::integer as Tuesday
 ,round(sum(  case when DC.day_name='Wednesday' then FTC.time_entered else 0 end))::integer as Wednesday
 ,round(sum(  case when DC.day_name='Thursday' then FTC.time_entered else 0 end))::integer as Thursday
 ,round(sum(  case when DC.day_name='Friday' then FTC.time_entered else 0 end))::integer as Friday
 ,round(sum(  case when DC.day_name='Saturday' then FTC.time_entered else 0 end))::integer as Saturday
 ,round(sum(  case when DC.day_name='Sunday' then FTC.time_entered else 0 end))::integer as Sunday
-- ,count(distinct FTC.timecard_src_id)
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

   inner JOIN #DWH_TABLE_SCHEMA.d_internal_organization DINT_ORG
ON FTC.company_key=DINT_ORG.ROW_KEY

 inner join #DWH_TABLE_SCHEMA.d_project proj
   ON FTC.project_key=proj.ROW_KEY
 --and DC.day_name='Monday'
 group by DC.quarter_id,
DC.quarter_name,
DC.week_id,
DC.week_name
order by DC.quarter_id,
DC.quarter_name,
DC.week_id,
DC.week_name
)