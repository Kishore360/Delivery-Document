/*****No. of hours spent by employee/manager***/
select 
manager5
,manager4
,manager3
,manager2
,manager1
,employee
 , time_entered from (
SELECT
mang5.row_key
,mang4.row_key
,mang3.row_key
,mang2.row_key
,mang1.row_key
,int_con.row_key
,mang5.full_name as manager5
,mang4.full_name as manager4
,mang3.full_name as manager3
,mang2.full_name as manager2
,mang1.full_name as manager1
,int_con.full_name as employee
 ,sum(  FTC.time_entered)::integer as time_entered
-- ,count(distinct FTC.timecard_src_id)

FROM 
#DWH_TABLE_SCHEMA.f_time_card FTC
 
 inner join #DWH_TABLE_SCHEMA.d_calendar_date DC
ON FTC.TIMECARD_ON_KEY=DC.ROW_KEY
 and FTC.soft_deleted_flag='N'
 and DC.ROW_KEY BETWEEN DC.month_start_date_key AND DC.month_end_date_key
-- and DC.week_start_date_key BETWEEN DC.month_start_date_key AND DC.month_end_date_key
and DC.lagging_count_of_month between 0 and 11

inner JOIN  #DWH_TABLE_SCHEMA.d_internal_contact int_con
 ON FTC.employee_key=int_con.ROW_KEY

inner JOIN #DWH_TABLE_SCHEMA.d_h_all_hierarchies d_all
 ON int_con.row_key=d_all.lev_0_key
 and  d_all.hierarchy_class='EMPLOYEE'
 
 inner JOIN  #DWH_TABLE_SCHEMA.d_internal_contact mang1
 ON d_all.lev_1_key=mang1.ROW_KEY
 
 inner JOIN  #DWH_TABLE_SCHEMA.d_internal_contact mang2
 ON d_all.lev_2_key=mang2.ROW_KEY
 
 
 inner JOIN  #DWH_TABLE_SCHEMA.d_internal_contact mang3
 ON d_all.lev_3_key=mang3.ROW_KEY
  
 inner JOIN  #DWH_TABLE_SCHEMA.d_internal_contact mang4
 ON d_all.lev_4_key=mang4.ROW_KEY
 
 inner JOIN  #DWH_TABLE_SCHEMA.d_internal_contact mang5
 ON d_all.lev_5_key=mang5.ROW_KEY
 

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
ON FTC.department_key=DINT_ORG.ROW_KEY

 inner join #DWH_TABLE_SCHEMA.d_project proj
   ON FTC.project_key=proj.ROW_KEY
group by 
mang5.row_key
,mang4.row_key
,mang3.row_key
,mang2.row_key
,mang1.row_key
,int_con.row_key
  ,mang5.full_name ,
  mang4.full_name ,
  mang3.full_name ,
 mang2.full_name ,
 mang1.full_name 
,int_con.full_name 
order  by 
mang5.row_key
,mang4.row_key
,mang3.row_key
,mang2.row_key
,mang1.row_key
--,int_con.row_key
,case when mang5.full_name='UNSPECIFIED' then '0' else mang5.full_name end
, case when mang4.full_name='UNSPECIFIED' then '0' else mang4.full_name end
, case when mang3.full_name='UNSPECIFIED' then '0' else mang3.full_name end
, case when mang2.full_name='UNSPECIFIED' then '0' else mang2.full_name end
, case when mang1.full_name='UNSPECIFIED' then '0' else mang1.full_name end
, case when int_con.full_name='UNSPECIFIED' then '0' else lower(int_con.full_name) end 
)
;