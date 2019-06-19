

grant all PRIVILEGES on ALL TABLES IN schema ldb to m_png;
grant all PRIVILEGES on ALL TABLES IN schema png_mdwdb to m_png;

grant all PRIVILEGES on ALL TABLES IN schema ldb to mstr_user;
grant all PRIVILEGES on ALL TABLES IN schema ldb to kishore;
grant all PRIVILEGES on ALL TABLES IN schema ldb to santosh;
grant all PRIVILEGES on ALL TABLES IN schema ldb to merline;
grant all PRIVILEGES on ALL TABLES IN schema png_mdwdb to manjunath;
grant all PRIVILEGES on ALL TABLES IN schema ldb to manjunath;

create view ldb.f_change_eod_previous_c  as select * from png_mdwdb.f_change_eod_previous_c ;
create view ldb.f_change_eod_current_c  as select * from png_mdwdb.f_change_eod_current_c ;
create view ldb.f_incident_eod_previous_c as select * from png_mdwdb.f_incident_eod_previous_c;
create view ldb.f_incident_eod_current_c as select * from png_mdwdb.f_incident_eod_current_c;

/*
insert into png_mdwdb.f_incident_eod_current_c
(
date_key,vp_key,director_key,associate_director_key,Director_Function,inc_assignment_group_key,assignment_group_key,business_service_key,png_priority_c,critical_business_process_c_key,
Priority_count,caused_by_change_count,caused_by_problem_count,Open_To_Resolve_Duration,Resolved_Count,met_sla_count,sla_count,SEI_impact_count
)*/


CREATE table png_mdwdb.f_incident_eod_current_c
AS  
SELECT 
'1' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
Count(a.row_key) as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count
,0 AS Open_To_Resolve_Duration, 0 as Resolved_Count
,0 AS met_sla_count,
0 AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name <> 'Auto Ticket'
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name <> 'Non Incident'
AND sv.dimension_name <> 'Non-Production'
AND (f.assignment_group_type_c = 'ITSM Role Provisioning Group'
or f.assignment_group_type_c = 'ITSM IA Distribution List'
or f.assignment_group_type_c = 'ITSM Change Advisory Board'
or f.assignment_group_type_c = 'ITSM Assignment Group')
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code = 'UNSPECIFIED')
AND pi.incident_number = 'UNSPECIFIED'
AND c.lagging_count_of_days between 0 and 29
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
-- Current Month
SELECT 
'2' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
Count(a.row_key) as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count
,0 AS Open_To_Resolve_Duration, 0 as Resolved_Count
,0 AS met_sla_count,
0 AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key
join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name <> 'Non Incident'
AND sv.dimension_name <>  'Non-Production'
AND (f.assignment_group_type_c  = 'ITSM Role Provisioning Group'
or f.assignment_group_type_c  = 'ITSM IA Distribution List'
or f.assignment_group_type_c = 'ITSM Change Advisory Board'
or f.assignment_group_type_c = 'ITSM Assignment Group')
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number = 'UNSPECIFIED'
AND d.lagging_count_of_month='0'
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
-- Current fiscal quarter
SELECT 
'3' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
Count(a.row_key) as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count
,0 AS Open_To_Resolve_Duration, 0 as Resolved_Count
,0 AS met_sla_count,
0 AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year d ON c.year_start_date_key=d.row_key
JOIN ldb.d_calendar_fiscal_quarter qx ON c.quarter_start_date_key=qx.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND c.lagging_count_of_quarter='0'
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
SELECT 
'4' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
Count(a.row_key) as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count
,0 AS Open_To_Resolve_Duration, 0 as Resolved_Count
,0 AS met_sla_count,
0 AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year d ON c.year_start_date_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND c.lagging_count_of_year='0'
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
-- 1 for change caused by
SELECT 
'1' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
Count(a.row_key) as caused_by_change_count,
0 as caused_by_problem_count
,0 AS Open_To_Resolve_Duration, 0 as Resolved_Count
,0 AS met_sla_count,
0 AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name <> 'Auto Ticket'
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name <> 'Non Incident'
AND sv.dimension_name <> 'Non-Production'
AND (f.assignment_group_type_c = 'ITSM Role Provisioning Group'
or f.assignment_group_type_c = 'ITSM IA Distribution List'
or f.assignment_group_type_c = 'ITSM Change Advisory Board'
or f.assignment_group_type_c = 'ITSM Assignment Group')
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code = 'UNSPECIFIED')
AND pi.incident_number = 'UNSPECIFIED'
AND c.lagging_count_of_days between 0 and 29
AND b.caused_by_change_flag = 'Y'
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
-- Current Month
SELECT 
'2' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
Count(a.row_key) as caused_by_change_count,
0 as caused_by_problem_count
,0 AS Open_To_Resolve_Duration, 0 as Resolved_Count
,0 AS met_sla_count,
0 AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name <> 'Non Incident'
AND sv.dimension_name <>  'Non-Production'
AND (f.assignment_group_type_c  = 'ITSM Role Provisioning Group'
or f.assignment_group_type_c  = 'ITSM IA Distribution List'
or f.assignment_group_type_c = 'ITSM Change Advisory Board'
or f.assignment_group_type_c = 'ITSM Assignment Group')
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number = 'UNSPECIFIED'
AND d.lagging_count_of_month='0'
AND b.caused_by_change_flag = 'Y'
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
-- Current fiscal quarter
SELECT 
'3' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
Count(a.row_key) as caused_by_change_count,
0 as caused_by_problem_count
,0 AS Open_To_Resolve_Duration, 0 as Resolved_Count
,0 AS met_sla_count,
0 AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year d ON c.year_start_date_key=d.row_key
JOIN ldb.d_calendar_fiscal_quarter qx ON c.quarter_start_date_key=qx.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND c.lagging_count_of_quarter='0'
AND b.caused_by_change_flag = 'Y'
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
SELECT 
'4' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
Count(a.row_key) as caused_by_change_count,
0 as caused_by_problem_count
,0 AS Open_To_Resolve_Duration, 0 as Resolved_Count
,0 AS met_sla_count,
0 AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year d ON c.year_start_date_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND c.lagging_count_of_year='0'
AND b.caused_by_change_flag = 'Y'
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
-- 1 for problem flag
SELECT 
'1' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
Count(a.row_key) as caused_by_problem_count
,0 AS Open_To_Resolve_Duration, 0 as Resolved_Count
,0 AS met_sla_count,
0 AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name <> 'Auto Ticket'
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name <> 'Non Incident'
AND sv.dimension_name <> 'Non-Production'
AND (f.assignment_group_type_c = 'ITSM Role Provisioning Group'
or f.assignment_group_type_c = 'ITSM IA Distribution List'
or f.assignment_group_type_c = 'ITSM Change Advisory Board'
or f.assignment_group_type_c = 'ITSM Assignment Group')
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code = 'UNSPECIFIED')
AND pi.incident_number = 'UNSPECIFIED'
AND c.lagging_count_of_days between 0 and 29
AND b.problem_flag = 'Y'
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
-- Current Month
SELECT 
'2' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
Count(a.row_key) as caused_by_problem_count
,0 AS Open_To_Resolve_Duration, 0 as Resolved_Count
,0 AS met_sla_count,
0 AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name <> 'Non Incident'
AND sv.dimension_name <>  'Non-Production'
AND (f.assignment_group_type_c  = 'ITSM Role Provisioning Group'
or f.assignment_group_type_c  = 'ITSM IA Distribution List'
or f.assignment_group_type_c = 'ITSM Change Advisory Board'
or f.assignment_group_type_c = 'ITSM Assignment Group')
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number = 'UNSPECIFIED'
AND d.lagging_count_of_month='0'
AND b.problem_flag = 'Y'
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
-- Current fiscal quarter
SELECT 
'3' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
Count(a.row_key) as caused_by_problem_count
,0 AS Open_To_Resolve_Duration, 0 as Resolved_Count
,0 AS met_sla_count,
0 AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year d ON c.year_start_date_key=d.row_key
JOIN ldb.d_calendar_fiscal_quarter qx ON c.quarter_start_date_key=qx.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND c.lagging_count_of_quarter='0'
AND b.problem_flag = 'Y'
)
group by 1,2,3,4,5,6,7,8,9,10 
/*first insert*/
UNION
SELECT 
'4' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
Count(a.row_key) as caused_by_problem_count
,0 AS Open_To_Resolve_Duration, 0 as Resolved_Count
,0 AS met_sla_count,
0 AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year d ON c.year_start_date_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND c.lagging_count_of_year='0'
AND b.problem_flag = 'Y'
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
-- MTRS query 
SELECT 
'1' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count,
SUM(a.open_to_resolve_duration) as Open_To_Resolve_Duration,
count(a.row_key) AS Resolved_Count,
0 AS met_sla_count,
0 AS sla_count,
0 as SEI_impact_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date c ON a.last_resolved_on_key=c.row_key 
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND c.lagging_count_of_days between 0 and 29
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
SELECT 
'2' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count,
SUM(a.open_to_resolve_duration) as Open_To_Resolve_Duration,
count(a.row_key) AS Resolved_Count,
0 AS met_sla_count,
0 AS sla_count,
0 as SEI_impact_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date c ON a.last_resolved_on_key=c.row_key 
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND d.lagging_count_of_month = 0
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
SELECT 
'3' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count,
SUM(a.open_to_resolve_duration) as Open_To_Resolve_Duration,
count(a.row_key) AS Resolved_Count,
0 AS met_sla_count,
0 AS sla_count,
0 as SEI_impact_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.last_resolved_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year d ON c.year_start_date_key=d.row_key
JOIN ldb.d_calendar_fiscal_quarter qx ON c.quarter_start_date_key=qx.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND c.lagging_count_of_quarter='0'
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
SELECT 
'4' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count,
SUM(a.open_to_resolve_duration) Open_To_Resolve_Duration,
count(a.row_key) AS Resolved_Count,
0 AS met_sla_count,
0 AS sla_count,
0 as SEI_impact_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.last_resolved_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year d ON c.year_start_date_key=d.row_key
JOIN ldb.d_calendar_fiscal_quarter qx ON c.quarter_start_date_key=qx.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND c.lagging_count_of_year='0'
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
-------- MET SLA
SELECT 
'1' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count,
0 AS Open_To_Resolve_Duration, 0 as Resolved_Count,
Count(a.row_key) AS met_sla_count,
0 AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date c ON a.last_resolved_on_key=c.row_key 
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND c.lagging_count_of_days between 0 and 29
AND b.met_sla_flag='Y'
)
group by 1,2,3,4,5,6,7,8,9,10
-- Denominator : 
UNION
SELECT 
'1' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count,
0 AS Open_To_Resolve_Duration, 0 as Resolved_Count,
0 AS met_sla_count,
Count(a.row_key) AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date c ON a.last_resolved_on_key=c.row_key 
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND c.lagging_count_of_days between 0 and 29
AND b.met_sla_flag IN ('Y','N')
)
group by 1,2,3,4,5,6,7,8,9,10
UNION 
--- current month
SELECT 
'2' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count,
0 AS Open_To_Resolve_Duration, 0 as Resolved_Count,
Count(a.row_key) AS met_sla_count,
0  AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date c ON a.last_resolved_on_key=c.row_key 
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND c.lagging_count_of_month = 0
AND b.met_sla_flag='Y'
)
group by 1,2,3,4,5,6,7,8,9,10
-- 2nd insert --
-- Denominator : 
UNION
SELECT 
'2' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count,
0 AS Open_To_Resolve_Duration, 0 as Resolved_Count,
0 AS met_sla_count,
Count(a.row_key) AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date c ON a.last_resolved_on_key=c.row_key 
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND c.lagging_count_of_month = 0
AND b.met_sla_flag IN ('Y','N')
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
  --- current fiscal quarter
  SELECT 
'3' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count,
0 AS Open_To_Resolve_Duration, 0 as Resolved_Count,
Count(a.row_key) AS met_sla_count,
0  AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.last_resolved_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year d ON c.year_start_date_key=d.row_key
JOIN ldb.d_calendar_fiscal_quarter qx ON c.quarter_start_date_key=qx.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND c.lagging_count_of_quarter = 0
AND b.met_sla_flag='Y'
)
group by 1,2,3,4,5,6,7,8,9,10
-- Denominator : 
UNION
SELECT 
'3' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count,
0 AS Open_To_Resolve_Duration, 0 as Resolved_Count,
0 AS met_sla_count,
Count(a.row_key) AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.last_resolved_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year d ON c.year_start_date_key=d.row_key
JOIN ldb.d_calendar_fiscal_quarter qx ON c.quarter_start_date_key=qx.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND c.lagging_count_of_quarter = 0
AND b.met_sla_flag IN ('Y','N')
)
group by 1,2,3,4,5,6,7,8,9,10
--- current fiscal quarter
UNION
  SELECT 
'4' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count,
0 AS Open_To_Resolve_Duration, 0 as Resolved_Count,
Count(a.row_key) AS met_sla_count,
0  AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.last_resolved_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year d ON c.year_start_date_key=d.row_key
JOIN ldb.d_calendar_fiscal_quarter qx ON c.quarter_start_date_key=qx.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND c.lagging_count_of_year = 0
AND b.met_sla_flag='Y'
)
group by 1,2,3,4,5,6,7,8,9,10
-- Denominator : 
UNION
SELECT 
'4' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count,
0 AS Open_To_Resolve_Duration, 0 as Resolved_Count,
0 AS met_sla_count,
Count(a.row_key) AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.last_resolved_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year d ON c.year_start_date_key=d.row_key
JOIN ldb.d_calendar_fiscal_quarter qx ON c.quarter_start_date_key=qx.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND c.lagging_count_of_year = 0
AND b.met_sla_flag IN ('Y','N')
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
-- sei impact
SELECT 
'1' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count
,0 AS Open_To_Resolve_Duration, 0 as Resolved_Count
,0 AS met_sla_count,
0 AS sla_count,
count(a.row_key) as SEI_impact_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date c ON a.last_resolved_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name <> 'Auto Ticket'
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name <> 'Non Incident'
AND sv.dimension_name <> 'Non-Production'
AND (f.assignment_group_type_c = 'ITSM Role Provisioning Group'
or f.assignment_group_type_c = 'ITSM IA Distribution List'
or f.assignment_group_type_c = 'ITSM Change Advisory Board'
or f.assignment_group_type_c = 'ITSM Assignment Group')
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code = 'UNSPECIFIED')
AND pi.incident_number = 'UNSPECIFIED'
AND c.lagging_count_of_days between 0 and 29
AND b.sei_materialized_flag_c = 'Y'
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
-- Current Month
SELECT 
'2' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count
,0 AS Open_To_Resolve_Duration, 0 as Resolved_Count
,0 AS met_sla_count,
0 AS sla_count,
count(a.row_key) as SEI_impact_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date c ON a.last_resolved_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name <> 'Non Incident'
AND sv.dimension_name <>  'Non-Production'
AND (f.assignment_group_type_c  = 'ITSM Role Provisioning Group'
or f.assignment_group_type_c  = 'ITSM IA Distribution List'
or f.assignment_group_type_c = 'ITSM Change Advisory Board'
or f.assignment_group_type_c = 'ITSM Assignment Group')
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number = 'UNSPECIFIED'
AND d.lagging_count_of_month='0'
AND b.sei_materialized_flag_c = 'Y'
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
-- Current fiscal quarter
SELECT 
'3' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count
,0 AS Open_To_Resolve_Duration, 0 as Resolved_Count
,0 AS met_sla_count,
0 AS sla_count,
count(a.row_key) as SEI_impact_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.last_resolved_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year d ON c.year_start_date_key=d.row_key
JOIN ldb.d_calendar_fiscal_quarter qx ON c.quarter_start_date_key=qx.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND c.lagging_count_of_quarter='0'
AND b.sei_materialized_flag_c = 'Y'
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
SELECT 
'4' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count
,0 AS Open_To_Resolve_Duration, 0 as Resolved_Count
,0 AS met_sla_count,
0 AS sla_count,
count(a.row_key) as SEI_impact_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.last_resolved_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year d ON c.year_start_date_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND c.lagging_count_of_year='0'
AND b.sei_materialized_flag_c = 'Y'
)
group by 1,2,3,4,5,6,7,8,9,10
----- other date filters --
UNION
SELECT 
'5' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
Count(a.row_key) as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count
,0 AS Open_To_Resolve_Duration, 0 as Resolved_Count
,0 AS met_sla_count,
0 AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name <> 'Auto Ticket'
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name <> 'Non Incident'
AND sv.dimension_name <> 'Non-Production'
AND (f.assignment_group_type_c = 'ITSM Role Provisioning Group'
or f.assignment_group_type_c = 'ITSM IA Distribution List'
or f.assignment_group_type_c = 'ITSM Change Advisory Board'
or f.assignment_group_type_c = 'ITSM Assignment Group')
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code = 'UNSPECIFIED')
AND pi.incident_number = 'UNSPECIFIED'
AND c.lagging_count_of_days between 30 and 59
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
-- Current Month
SELECT 
'6' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
Count(a.row_key) as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count
,0 AS Open_To_Resolve_Duration, 0 as Resolved_Count
,0 AS met_sla_count,
0 AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name <> 'Non Incident'
AND sv.dimension_name <>  'Non-Production'
AND (f.assignment_group_type_c  = 'ITSM Role Provisioning Group'
or f.assignment_group_type_c  = 'ITSM IA Distribution List'
or f.assignment_group_type_c = 'ITSM Change Advisory Board'
or f.assignment_group_type_c = 'ITSM Assignment Group')
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number = 'UNSPECIFIED'
AND d.lagging_count_of_month='1'
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
-- Current fiscal quarter
SELECT 
'7' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
Count(a.row_key) as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count
,0 AS Open_To_Resolve_Duration, 0 as Resolved_Count
,0 AS met_sla_count,
0 AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year d ON c.year_start_date_key=d.row_key
JOIN ldb.d_calendar_fiscal_quarter qx ON c.quarter_start_date_key=qx.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND c.lagging_count_of_quarter='1'
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
SELECT 
'8' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
Count(a.row_key) as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count
,0 AS Open_To_Resolve_Duration, 0 as Resolved_Count
,0 AS met_sla_count,
0 AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year d ON c.year_start_date_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND c.lagging_count_of_year='1'
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
-- 1 for change caused by
SELECT 
'5' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
Count(a.row_key) as caused_by_change_count,
0 as caused_by_problem_count
,0 AS Open_To_Resolve_Duration, 0 as Resolved_Count
,0 AS met_sla_count,
0 AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name <> 'Auto Ticket'
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name <> 'Non Incident'
AND sv.dimension_name <> 'Non-Production'
AND (f.assignment_group_type_c = 'ITSM Role Provisioning Group'
or f.assignment_group_type_c = 'ITSM IA Distribution List'
or f.assignment_group_type_c = 'ITSM Change Advisory Board'
or f.assignment_group_type_c = 'ITSM Assignment Group')
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code = 'UNSPECIFIED')
AND pi.incident_number = 'UNSPECIFIED'
AND c.lagging_count_of_days between 30 and 59
AND b.caused_by_change_flag = 'Y'
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
-- Current Month
SELECT 
'6' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
Count(a.row_key) as caused_by_change_count,
0 as caused_by_problem_count
,0 AS Open_To_Resolve_Duration, 0 as Resolved_Count
,0 AS met_sla_count,
0 AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name <> 'Non Incident'
AND sv.dimension_name <>  'Non-Production'
AND (f.assignment_group_type_c  = 'ITSM Role Provisioning Group'
or f.assignment_group_type_c  = 'ITSM IA Distribution List'
or f.assignment_group_type_c = 'ITSM Change Advisory Board'
or f.assignment_group_type_c = 'ITSM Assignment Group')
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number = 'UNSPECIFIED'
AND d.lagging_count_of_month='1'
AND b.caused_by_change_flag = 'Y'
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
-- Current fiscal quarter
SELECT 
'7' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
Count(a.row_key) as caused_by_change_count,
0 as caused_by_problem_count
,0 AS Open_To_Resolve_Duration, 0 as Resolved_Count
,0 AS met_sla_count,
0 AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year d ON c.year_start_date_key=d.row_key
JOIN ldb.d_calendar_fiscal_quarter qx ON c.quarter_start_date_key=qx.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND c.lagging_count_of_quarter='1'
AND b.caused_by_change_flag = 'Y'
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
SELECT 
'8' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
Count(a.row_key) as caused_by_change_count,
0 as caused_by_problem_count
,0 AS Open_To_Resolve_Duration, 0 as Resolved_Count
,0 AS met_sla_count,
0 AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year d ON c.year_start_date_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND c.lagging_count_of_year='1'
AND b.caused_by_change_flag = 'Y'
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
-- 1 for problem flag
SELECT 
'5' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
Count(a.row_key) as caused_by_problem_count
,0 AS Open_To_Resolve_Duration, 0 as Resolved_Count
,0 AS met_sla_count,
0 AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name <> 'Auto Ticket'
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name <> 'Non Incident'
AND sv.dimension_name <> 'Non-Production'
AND (f.assignment_group_type_c = 'ITSM Role Provisioning Group'
or f.assignment_group_type_c = 'ITSM IA Distribution List'
or f.assignment_group_type_c = 'ITSM Change Advisory Board'
or f.assignment_group_type_c = 'ITSM Assignment Group')
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code = 'UNSPECIFIED')
AND pi.incident_number = 'UNSPECIFIED'
AND c.lagging_count_of_days between 30 and 59
AND b.problem_flag = 'Y'
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
-- Current Month
SELECT 
'6' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
Count(a.row_key) as caused_by_problem_count
,0 AS Open_To_Resolve_Duration, 0 as Resolved_Count
,0 AS met_sla_count,
0 AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name <> 'Non Incident'
AND sv.dimension_name <>  'Non-Production'
AND (f.assignment_group_type_c  = 'ITSM Role Provisioning Group'
or f.assignment_group_type_c  = 'ITSM IA Distribution List'
or f.assignment_group_type_c = 'ITSM Change Advisory Board'
or f.assignment_group_type_c = 'ITSM Assignment Group')
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number = 'UNSPECIFIED'
AND d.lagging_count_of_month='1'
AND b.problem_flag = 'Y'
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
-- Current fiscal quarter
SELECT 
'7' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
Count(a.row_key) as caused_by_problem_count
,0 AS Open_To_Resolve_Duration, 0 as Resolved_Count
,0 AS met_sla_count,
0 AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year d ON c.year_start_date_key=d.row_key
JOIN ldb.d_calendar_fiscal_quarter qx ON c.quarter_start_date_key=qx.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND c.lagging_count_of_quarter='1'
AND b.problem_flag = 'Y'
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
SELECT 
'8' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
Count(a.row_key) as caused_by_problem_count
,0 AS Open_To_Resolve_Duration, 0 as Resolved_Count
,0 AS met_sla_count,
0 AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.opened_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year d ON c.year_start_date_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND c.lagging_count_of_year='1'
AND b.problem_flag = 'Y'
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
-- MTRS query 
SELECT 
'5' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count,
SUM(a.open_to_resolve_duration) as Open_To_Resolve_Duration, 
count(a.row_key) AS Resolved_Count,
0 AS met_sla_count,
0 AS sla_count,
0 as SEI_impact_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date c ON a.last_resolved_on_key=c.row_key 
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND c.lagging_count_of_days between 30 and 59
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
SELECT 
'6' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count,
SUM(a.open_to_resolve_duration) as Open_To_Resolve_Duration, 
count(a.row_key) AS Resolved_Count,
0 AS met_sla_count,
0 AS sla_count,
0 as SEI_impact_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date c ON a.last_resolved_on_key=c.row_key 
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND d.lagging_count_of_month = 1
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
SELECT 
'7' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count,
SUM(a.open_to_resolve_duration) as Open_To_Resolve_Duration, 
count(a.row_key) AS Resolved_Count,
0 AS met_sla_count,
0 AS sla_count,
0 as SEI_impact_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.last_resolved_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year d ON c.year_start_date_key=d.row_key
JOIN ldb.d_calendar_fiscal_quarter qx ON c.quarter_start_date_key=qx.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND c.lagging_count_of_quarter='1'
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
SELECT 
'8' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count,
SUM(a.open_to_resolve_duration) as Open_To_Resolve_Duration, 
count(a.row_key) AS Resolved_Count,
0 AS met_sla_count,
0 AS sla_count,
0 as SEI_impact_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.last_resolved_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year d ON c.year_start_date_key=d.row_key
JOIN ldb.d_calendar_fiscal_quarter qx ON c.quarter_start_date_key=qx.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND c.lagging_count_of_year='1'
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
-------- MET SLA
SELECT 
'5' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count,
0 AS Open_To_Resolve_Duration, 0 as Resolved_Count,
Count(a.row_key) AS met_sla_count,
0 AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date c ON a.last_resolved_on_key=c.row_key 
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND c.lagging_count_of_days between 30 and 59
AND b.met_sla_flag='Y'
)
group by 1,2,3,4,5,6,7,8,9,10
-- Denominator : 
UNION
SELECT 
'5' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count,
0 AS Open_To_Resolve_Duration, 0 as Resolved_Count,
0 AS met_sla_count,
Count(a.row_key) AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date c ON a.last_resolved_on_key=c.row_key 
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND c.lagging_count_of_days between 30 and 59
AND b.met_sla_flag IN ('Y','N')
)
group by 1,2,3,4,5,6,7,8,9,10
UNION 
--- current month
SELECT 
'6' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count,
0 AS Open_To_Resolve_Duration, 0 as Resolved_Count,
Count(a.row_key) AS met_sla_count,
0  AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date c ON a.last_resolved_on_key=c.row_key 
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND c.lagging_count_of_month = 1
AND b.met_sla_flag='Y'
)
group by 1,2,3,4,5,6,7,8,9,10
-- Denominator : 
UNION
SELECT 
'6' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count,
0 AS Open_To_Resolve_Duration, 0 as Resolved_Count,
0 AS met_sla_count,
Count(a.row_key) AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date c ON a.last_resolved_on_key=c.row_key 
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND c.lagging_count_of_month = 1
AND b.met_sla_flag IN ('Y','N')
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
  --- current fiscal quarter
  SELECT 
'7' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count,
0 AS Open_To_Resolve_Duration, 0 as Resolved_Count,
Count(a.row_key) AS met_sla_count,
0  AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.last_resolved_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year d ON c.year_start_date_key=d.row_key
JOIN ldb.d_calendar_fiscal_quarter qx ON c.quarter_start_date_key=qx.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND c.lagging_count_of_quarter = 0
AND b.met_sla_flag='Y'
)
group by 1,2,3,4,5,6,7,8,9,10
-- Denominator : 
UNION
SELECT 
'7' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count,
0 AS Open_To_Resolve_Duration, 0 as Resolved_Count,
0 AS met_sla_count,
Count(a.row_key) AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.last_resolved_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year d ON c.year_start_date_key=d.row_key
JOIN ldb.d_calendar_fiscal_quarter qx ON c.quarter_start_date_key=qx.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND c.lagging_count_of_quarter = 0
AND b.met_sla_flag IN ('Y','N')
)
group by 1,2,3,4,5,6,7,8,9,10
--- current fiscal quarter
UNION
  SELECT 
'8' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count,
0 AS Open_To_Resolve_Duration, 0 as Resolved_Count,
Count(a.row_key) AS met_sla_count,
0  AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.last_resolved_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year d ON c.year_start_date_key=d.row_key
JOIN ldb.d_calendar_fiscal_quarter qx ON c.quarter_start_date_key=qx.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND c.lagging_count_of_year = 0
AND b.met_sla_flag='Y'
)
group by 1,2,3,4,5,6,7,8,9,10
-- Denominator : 
UNION
SELECT 
'8' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count,
0 AS Open_To_Resolve_Duration, 0 as Resolved_Count,
0 AS met_sla_count,
Count(a.row_key) AS sla_count
,0 as SEI_impact_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.last_resolved_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year d ON c.year_start_date_key=d.row_key
JOIN ldb.d_calendar_fiscal_quarter qx ON c.quarter_start_date_key=qx.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND c.lagging_count_of_year = 0
AND b.met_sla_flag IN ('Y','N')
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
-- sei impact
SELECT 
'5' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count
,0 AS Open_To_Resolve_Duration, 0 as Resolved_Count
,0 AS met_sla_count,
0 AS sla_count,
count(a.row_key) as SEI_impact_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date c ON a.last_resolved_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name <> 'Auto Ticket'
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name <> 'Non Incident'
AND sv.dimension_name <> 'Non-Production'
AND (f.assignment_group_type_c = 'ITSM Role Provisioning Group'
or f.assignment_group_type_c = 'ITSM IA Distribution List'
or f.assignment_group_type_c = 'ITSM Change Advisory Board'
or f.assignment_group_type_c = 'ITSM Assignment Group')
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code = 'UNSPECIFIED')
AND pi.incident_number = 'UNSPECIFIED'
AND c.lagging_count_of_days between 30 and 59
AND b.sei_materialized_flag_c = 'Y'
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
-- Current Month
SELECT 
'6' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count
,0 AS Open_To_Resolve_Duration, 0 as Resolved_Count
,0 AS met_sla_count,
0 AS sla_count,
count(a.row_key) as SEI_impact_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date c ON a.last_resolved_on_key=c.row_key
JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name <> 'Non Incident'
AND sv.dimension_name <>  'Non-Production'
AND (f.assignment_group_type_c  = 'ITSM Role Provisioning Group'
or f.assignment_group_type_c  = 'ITSM IA Distribution List'
or f.assignment_group_type_c = 'ITSM Change Advisory Board'
or f.assignment_group_type_c = 'ITSM Assignment Group')
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number = 'UNSPECIFIED'
AND d.lagging_count_of_month='1'
AND b.sei_materialized_flag_c = 'Y'
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
-- Current fiscal quarter
SELECT 
'7' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count
,0 AS Open_To_Resolve_Duration, 0 as Resolved_Count
,0 AS met_sla_count,
0 AS sla_count,
count(a.row_key) as SEI_impact_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.last_resolved_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year d ON c.year_start_date_key=d.row_key
JOIN ldb.d_calendar_fiscal_quarter qx ON c.quarter_start_date_key=qx.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND c.lagging_count_of_quarter='1'
AND b.sei_materialized_flag_c = 'Y'
)
group by 1,2,3,4,5,6,7,8,9,10
UNION
SELECT 
'8' as date_key,
g.vp_key AS vp_key,
g.director_key AS director_key,
g.associate_director_key AS associate_director_key,
y.organization_c AS Director_Function,
a.inc_assignment_group_key AS inc_assignment_group_key,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
b.png_priority_c,bp.critical_business_process_c_key,
0 as Priority_count,
0 as caused_by_change_count,
0 as caused_by_problem_count
,0 AS Open_To_Resolve_Duration, 0 as Resolved_Count
,0 AS met_sla_count,
0 AS sla_count,
count(a.row_key) as SEI_impact_count
FROM ldb.f_incident_resolved a 
JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.last_resolved_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year d ON c.year_start_date_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON a.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON a.inc_assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON a.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON a.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON b.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON b.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON b.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name not in ('Non Incident')
AND sv.dimension_name not in ('Non-Production')
AND (f.assignment_group_type_c in ('ITSM Role Provisioning Group')
or f.assignment_group_type_c in ('ITSM IA Distribution List')
or f.assignment_group_type_c in ('ITSM Change Advisory Board')
or f.assignment_group_type_c in ('ITSM Assignment Group'))
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND c.lagging_count_of_year='1'
AND b.sei_materialized_flag_c = 'Y'
)
group by 1,2,3,4,5,6,7,8,9,10
;
