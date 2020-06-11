select
category,impact,priority,urgency,hr_changes from(
select 
lov_cat.dimension_name as category
,lov_cat.dimension_code
,lov_impact.dimension_name as impact
,lov_impact.dimension_code

,lov_pri.dimension_name as priority
,lov_pri.dimension_code
,lov_urg.dimension_name as urgency
,lov_urg.dimension_code
, count( distinct FTC.row_key) hr_changes


from 
#DWH_TABLE_SCHEMA.f_hr_change FTC
/***Category key join***/
  join  
(SElect lov_cat.* from
 #DWH_TABLE_SCHEMA.d_lov lov_cat
  LEFT  JOIN #DWH_TABLE_SCHEMA.d_lov_map br_cat ON lov_cat.row_key = br_cat.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov_cat ON wh_lov_cat.row_key = br_cat.wh_key AND br_cat.dimension_class::text = 'CATEGORY~HR_CHANGE'::text
union
select lov.* from  
#DWH_TABLE_SCHEMA.d_lov lov
where row_key in( 0,-1)
) lov_cat
on FTC.category_src_key=lov_cat.ROW_KEY	

and FTC.soft_deleted_flag<>'Y'
/***lov_impact key join***/

JOIN 
(select lov_impact.* from
#DWH_TABLE_SCHEMA.d_lov lov_impact
 
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br_impact ON lov_impact.row_key = br_impact.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov_impact ON wh_lov_impact.row_key = br_impact.wh_key AND br_impact.dimension_class::text = 'IMPACT~HR_CHANGE'::text
union
select lov.* from  
#DWH_TABLE_SCHEMA.d_lov lov
where row_key in( 0,-1)
) lov_impact
on FTC.impact_src_key=lov_impact.ROW_KEY
/***priority_src_key  join***/

JOIN 
(select lov_pri.* from
#DWH_TABLE_SCHEMA.d_lov lov_pri
 
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br_pri ON lov_pri.row_key = br_pri.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov_pri ON wh_lov_pri.row_key = br_pri.wh_key AND br_pri.dimension_class::text = 'PRIORITY~HR_CHANGE'::text
union
select lov.* from  
#DWH_TABLE_SCHEMA.d_lov lov
where row_key in( 0,-1)
) lov_pri
on FTC.priority_src_key=lov_pri.ROW_KEY

/***reported_type_src_key  join***/
/*JOIN #DWH_TABLE_SCHEMA.d_lov lov_con_type
 on FTC.reported_type_src_key=lov_con_type.ROW_KEY
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br_con_type ON lov_con_type.row_key = br_con_type.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov_con_type ON wh_lov_con_type.row_key = br_con_type.wh_key
   AND br_con_type.dimension_class = 'CONTACT_TYPE~HR_CHANGE'*/


/***state_src_key  join***/
/*
JOIN 
(select lov_state.* from
 #DWH_TABLE_SCHEMA.d_lov lov_state

   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br_state ON lov_state.row_key = br_state.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov_state ON wh_lov_state.row_key = br_state.wh_key AND br_state.dimension_class::text = 'STATE~HR_CHANGE'::text
union
select lov.* from  
#DWH_TABLE_SCHEMA.d_lov lov
where row_key in( 0,-1)
) lov_state
on FTC.state_src_key=lov_state.ROW_KEY
*/

/***urgency_src_key  join***/

JOIN 
(select lov_urg.* from
 #DWH_TABLE_SCHEMA.d_lov lov_urg

   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br_urg ON lov_urg.row_key = br_urg.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov_urg ON wh_lov_urg.row_key = br_urg.wh_key AND br_urg.dimension_class::text = 'URGENCY~HR_CHANGE'::text

union
select lov.* from  
#DWH_TABLE_SCHEMA.d_lov lov
where row_key in( 0,-1)
) lov_urg
on FTC.urgency_src_key=lov_urg.ROW_KEY

group by
lov_cat.dimension_name
,lov_cat.dimension_code
,lov_impact.dimension_name
,lov_impact.dimension_code
,lov_pri.dimension_name 
,lov_pri.dimension_code
,lov_urg.dimension_name
,lov_urg.dimension_code
order by
lov_cat.dimension_code 
,lov_impact.dimension_code
,lov_pri.dimension_code
,lov_urg.dimension_code
)A