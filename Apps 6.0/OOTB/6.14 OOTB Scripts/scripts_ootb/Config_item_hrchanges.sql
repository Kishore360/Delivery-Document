/************* CaseID with created date last week,month,quarter and year**********/
SELECT
D.name 
/*,D.year_name
,D.quarter_name
, D.month_name
,D.week_name*/
,D.hr_change

from 
(select
config.name /* ,
D.year_name
,D.year_id
,D.quarter_name
,D.quarter_id
, D.month_name
,D.month_id
,D.week_name
,D.week_id*/
,count(distinct HR.row_key) as hr_change

FROM 
#DWH_TABLE_SCHEMA.f_hr_change HR
inner JOIN #DWH_TABLE_SCHEMA.d_calendar_date D
ON HR.OPENED_on_key=D.row_key
and  HR.soft_deleted_flag<>'Y'
 inner JOIN  #DWH_TABLE_SCHEMA.d_CONFIGURATION_ITEM config
 ON HR.CONFIGURATION_ITEM_key=config.ROW_KEY
group by 
config.name /*,
D.year_name
,D.year_id
,D.quarter_name
,D.quarter_id
, D.month_name
,D.month_id
,D.week_name
,D.week_id*/
order by
config.name /* ,
 D.year_id
,D.quarter_id
,D.month_id
,D.week_id*/
)D
;
