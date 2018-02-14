SELECT 'f_incident_response' as Table_Name,count(1) as Row_Count 
FROM ldb.f_incident_response a 
UNION 
SELECT 'd_survey' as Table_Name,count(1) as Row_Count 
FROM ldb.f_incident_response a 
JOIN ldb.d_survey b ON a.survey_key=b.row_key
UNION
SELECT 'd_survey_state' as Table_Name,count(1) as Row_Count 
FROM ldb.f_incident_response a 
JOIN ldb.d_survey_state b ON a.survey_state_src_key=b.row_key
UNION 
SELECT 'd_survey_question' as Table_Name,count(1) as Row_Count 
FROM ldb.f_incident_response a 
JOIN ldb.d_survey_question b ON a.question_key=b.row_key
UNION 
SELECT 'd_survey_instance' as Table_Name,count(1) as Row_Count 
FROM ldb.f_incident_response a 
JOIN ldb.d_survey_instance b ON a.survey_instance_key=b.row_key
UNION 
SELECT 'd_survey_question' as Table_Name,count(1) as Row_Count 
FROM ldb.f_incident_response a 
JOIN ldb.d_survey_question b ON a.question_key=b.row_key
JOIN ldb.d_question_type c ON b.question_type_src_key=c.row_key
UNION 
SELECT 'd_location' as Table_Name,count(1) as Row_Count 
FROM ldb.f_incident_response a 
JOIN ldb.d_location b ON a.location_key=b.row_key
UNION 
SELECT 'd_internal_organization_group' as Table_Name,count(1) as Row_Count 
FROM ldb.f_incident_response a 
JOIN ldb.d_internal_organization_group b ON a.assignment_group_key=b.row_key
UNION 
SELECT 'd_internal_organization_department' as Table_Name,count(1) as Row_Count 
FROM ldb.f_incident_response a 
JOIN ldb.d_internal_organization_department b ON  a.taken_by_department_key=b.row_key
UNION 
SELECT 'd_internal_contact' as Table_Name,count(1) as Row_Count 
FROM ldb.f_incident_response a 
JOIN ldb.d_internal_contact b  ON a.sent_to_key=b.row_key
UNION 
SELECT 'd_internal_contact_mdm' as Table_Name,count(1) as Row_Count 
FROM ldb.f_incident_response a 
JOIN ldb.d_internal_contact b  ON a.sent_to_key=b.row_key
JOIN ldb.d_internal_contact_mdm c ON b.row_current_key=c.row_current_key
UNION 
SELECT 'd_internal_contact_assigned_to' as Table_Name,count(1) as Row_Count 
FROM ldb.f_incident_response a 
JOIN ldb.d_internal_contact_assigned_to b  ON a.assigned_to_key=b.row_key
UNION 
SELECT 'd_incident' as Table_Name,count(1) as Row_Count 
FROM ldb.f_incident_response a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
UNION 
SELECT 'd_calendar_date' as Table_Name,count(1) as Row_Count 
FROM ldb.f_incident_response a 
JOIN ldb.d_calendar_date b  ON a.requested_on_key=b.row_key
UNION 
SELECT 'd_calendar_month' as Table_Name,count(1) as Row_Count 
FROM ldb.f_incident_response a 
JOIN ldb.d_calendar_date b  ON a.requested_on_key=b.row_key
JOIN ldb.d_calendar_month c ON b.month_start_date_key=c.row_key



