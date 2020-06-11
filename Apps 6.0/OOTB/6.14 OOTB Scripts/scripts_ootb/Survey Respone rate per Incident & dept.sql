select 
F.incident_number inc, 
SUR.survey_name sur_nm,
case when SUR_STATE.state = 'Completed' then to_char(SUR_INST.taken_on,'FMmm/FMdd/yyyy FMhh:mi:ss AM') else null end inst_takn,
case when SUR_STATE.state = 'Completed' then D.survey_instance_key else null end sur_inst_num, 
DIO_DEPT.organization_name dept, 
concat(trim(round(
case when sum(distinct case when F.rowkey is not null then 1.00 else null end) is null then 0.00
when sum(distinct case when SUR_STATE.state = 'Completed' and F.rowkey is not null then 1.00 else null end) is null then 0.00
else sum(distinct case when SUR_STATE.state = 'Completed' and F.rowkey is not null then 1.00 else null end)*100.00
/sum(distinct case when F.rowkey is not null then 1.00 else null end) 
end
, 2)),'%') response_rate,
sum(distinct case when F.rowkey is not null then 1 else null end) survey_sent
from 

(
SELECT a.*, upper(a.task_type) AS task_typ, i.*, NULL AS response_value, q.row_key AS question_key, 
NULL AS response, a.incident_key as inc_key, a.row_key rowkey, a.state_src_key state_key
   FROM #DWH_TABLE_SCHEMA.f_task_survey a
   JOIN #DWH_TABLE_SCHEMA.f_incident i ON a.incident_key = i.incident_key
   JOIN #DWH_TABLE_SCHEMA.d_survey_question q ON a.survey_key = q.survey_key
  WHERE (a.survey_instance_key = 0 OR a.survey_instance_key = -1) 
  AND a.soft_deleted_flag = 'N' AND i.soft_deleted_flag = 'N' AND q.exclude_flag = 'N'
UNION 
 SELECT a.*, upper(a.task_type) AS task_typ, i.*, r.response_value AS response_value, 
 COALESCE(r.question_key, 0) AS question_key, r.response AS response, a.incident_key as inc_key, a.row_key rowkey,
 a.state_src_key state_key
   FROM #DWH_TABLE_SCHEMA.f_task_survey a
   JOIN #DWH_TABLE_SCHEMA.f_incident i ON a.incident_key = i.incident_key
   JOIN #DWH_TABLE_SCHEMA.f_response r ON a.survey_instance_key = r.survey_instance_key
  WHERE a.survey_instance_key <> 0 AND a.survey_instance_key <> -1 AND 
  a.soft_deleted_flag = 'N' 
  AND i.soft_deleted_flag = 'N' AND r.soft_deleted_flag = 'N'
) F
left join 
(
SELECT a.*, upper(a.task_type) AS task_typ, i.*, r.response_value AS response_value, 
 COALESCE(r.question_key, 0) AS question_key, r.response AS response, a.incident_key as inc_key, a.row_key rowkey,
 a.state_src_key state_key
   FROM #DWH_TABLE_SCHEMA.f_task_survey a
   JOIN #DWH_TABLE_SCHEMA.f_incident i ON a.incident_key = i.incident_key
   JOIN #DWH_TABLE_SCHEMA.f_response r ON a.survey_instance_key = r.survey_instance_key
  WHERE a.survey_instance_key <> 0 AND a.survey_instance_key <> -1 AND a.soft_deleted_flag = 'N'
  AND i.soft_deleted_flag = 'N' AND r.soft_deleted_flag = 'N'
) F_COMPLETED
on F.rowkey = F_COMPLETED.rowkey
join 
(
select d_calendar_date.*
FROM #DWH_TABLE_SCHEMA.d_calendar_date d_calendar_date
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_day ON d_calendar_date.previous_day_key = prev_day.row_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_week ON d_calendar_date.previous_week_key = prev_week.row_key AND prev_week.row_key = prev_week.week_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_month ON d_calendar_date.previous_month_key = prev_month.row_key AND prev_month.row_key = prev_month.month_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_quarter ON d_calendar_date.previous_quarter_key = prev_quarter.row_key AND prev_quarter.row_key = prev_quarter.quarter_start_date_key
   LEFT JOIN #DWH_TABLE_SCHEMA.d_calendar_date prev_year ON d_calendar_date.previous_year_key = prev_year.row_key AND prev_year.row_key = prev_year.year_start_date_key
) CAL
on F.requested_on_key = CAL.row_key
join
(
select *
from #DWH_TABLE_SCHEMA.d_incident
) DINC
on F.inc_key = DINC.row_key
join
(
SELECT a.*, upper(a.task_type) AS task_typ, i.*, NULL AS response_value, q.row_key AS question_key, '' AS response, 
a.incident_key as inc_key, a.row_key rowkey, a.state_src_key state_key
   FROM #DWH_TABLE_SCHEMA.f_task_survey a
   JOIN #DWH_TABLE_SCHEMA.f_incident i ON a.incident_key = i.incident_key
   JOIN #DWH_TABLE_SCHEMA.d_survey_question q ON a.survey_key = q.survey_key
  WHERE (a.survey_instance_key = 0 OR a.survey_instance_key = -1) AND a.soft_deleted_flag = 'N' AND i.soft_deleted_flag = 'N'
UNION 
 SELECT a.*, upper(a.task_type) AS task_typ, i.*, r.response_value AS response_value, COALESCE(r.question_key, 0) AS question_key, 
 COALESCE(r.response, '') AS response, a.incident_key as inc_key, a.row_key rowkey, a.state_src_key state_key
   FROM #DWH_TABLE_SCHEMA.f_task_survey a
   JOIN #DWH_TABLE_SCHEMA.f_incident i ON a.incident_key = i.incident_key
   JOIN #DWH_TABLE_SCHEMA.f_response r ON a.survey_instance_key = r.survey_instance_key
  WHERE a.survey_instance_key <> 0 AND a.survey_instance_key <> -1 AND a.soft_deleted_flag = 'N'
  AND i.soft_deleted_flag = 'N' AND r.soft_deleted_flag = 'N'
) D
on  (F.question_key = D.question_key and 
	F.rowkey = D.rowkey and 
	F.survey_instance_key = D.survey_instance_key and 
	F.survey_key = D.survey_key)
join
(
select *
FROM #DWH_TABLE_SCHEMA.d_internal_contact
) DIC
on F.sent_to_key = DIC.row_key
join
(
select ic.*
FROM #DWH_TABLE_SCHEMA.d_internal_contact ic
   LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact icm ON ic.manager_key = icm.row_key
) ASGN_TO
on ASGN_TO.row_key = F.assigned_to_key
join
(
select *
 FROM #DWH_TABLE_SCHEMA.d_internal_contact
WHERE d_internal_contact.current_flag = 'Y'
) ASGN_MDM
on DIC.row_current_key = ASGN_MDM.row_current_key
join
(
select *
  FROM #DWH_TABLE_SCHEMA.d_internal_organization
WHERE d_internal_organization.department_flag = 'Y' OR d_internal_organization.row_key = 0 OR d_internal_organization.row_key = -1
) DIO_DEPT
on DIO_DEPT.row_key = F.opened_by_department_key
join
(
select iog.*
   FROM #DWH_TABLE_SCHEMA.d_internal_organization iog
   LEFT JOIN #DWH_TABLE_SCHEMA.d_internal_contact icm ON iog.manager_key = icm.row_key
  WHERE iog.group_flag = 'Y' OR iog.row_key = 0 OR iog.row_key = -1
) DIO_GRP
on DIO_GRP.row_key = F.assignment_group_key
join
(
select a.*
 FROM #DWH_TABLE_SCHEMA.d_location a
LEFT JOIN #DWH_TABLE_SCHEMA.d_geography b ON a.geo_key = b.row_key AND a.source_id = b.source_id
) LOC
on LOC.row_key = F.location_key
join 
(
  select *
   FROM #DWH_TABLE_SCHEMA.d_survey_question
  WHERE d_survey_question.exclude_flag = 'N'
) QUES
on QUES.row_key = F.question_key
join
(
 SELECT lov.*, wh_lov.dimension_code AS ques_type_code, wh_lov.dimension_name AS ques_type
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'TYPE~QUESTION'
UNION 
 SELECT lov.*, lov.dimension_code AS ques_type_code, lov.dimension_name AS ques_type
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) QUES_TYPE
on QUES_TYPE.row_key = QUES.question_type_src_key
join
(
 select *
 FROM #DWH_TABLE_SCHEMA.d_survey
) SUR
on SUR.row_key = F.survey_key
join
(
 select *
FROM #DWH_TABLE_SCHEMA.d_survey_instance
) SUR_INST
on SUR_INST.row_key = F.survey_instance_key
join
(
 SELECT lov.*, wh_lov.dimension_code AS state_code, wh_lov.dimension_name AS state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
   LEFT JOIN #DWH_TABLE_SCHEMA.d_lov_map br ON lov.row_key = br.src_key
   JOIN #DWH_TABLE_SCHEMA.d_lov wh_lov ON wh_lov.row_key = br.wh_key AND br.dimension_class = 'STATE~SURVEY'
UNION ALL 
 SELECT lov.*, lov.dimension_code AS state_code, lov.dimension_name AS state
   FROM #DWH_TABLE_SCHEMA.d_lov lov
  WHERE lov.row_key = -1 OR lov.row_key = 0
) SUR_STATE
on SUR_STATE.row_key = D.state_key
where CAL.lagging_count_of_month between 0 and 12
group by inc, sur_nm, inst_takn, sur_inst_num, dept
order by inc, sur_nm, inst_takn, sur_inst_num, dept