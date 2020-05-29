DROP TABLE IF EXISTS app_test.project_task_day_count ;
CREATE TABLE app_test.project_task_day_count
select a.row_id, count(1) cal_day_count
 from #DWH_TABLE_SCHEMA.f_project_task a
 join (select source_id,max(lastupdated) lastupdated from #DWH_TABLE_SCHEMA.d_o_data_freshness group by source_id) b 
   on (
        a.source_id = b.source_id 
    and b.lastupdated = (select max(d.lastupdated) from #DWH_TABLE_SCHEMA.d_o_data_freshness d where d.source_id = a.source_id)
      )
 join #DWH_TABLE_SCHEMA.d_calendar_date c
 on c.calendar_date between
 (CASE WHEN DATE_FORMAT(COALESCE(a.actual_start_on,a.planned_start_on), '%H-%i-%s') < '17-00-00' THEN 
  CAST(COALESCE(a.actual_start_on,a.planned_start_on) AS DATE)
 ELSE 
  CAST(DATE_ADD(COALESCE(a.actual_start_on,a.planned_start_on), INTERVAL 1 DAY) AS DATE) 
 END ) 
 and b.lastupdated 
 and c.week_day_flag = 'Y' and c.calendar_code = 0
 group by a.row_key;