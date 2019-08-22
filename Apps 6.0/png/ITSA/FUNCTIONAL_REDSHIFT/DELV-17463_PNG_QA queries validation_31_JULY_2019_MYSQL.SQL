-- Open_Incident_count for Current FQ 

SELECT 
b.png_priority_c,
Count( distinct a.row_key) as Priority_count
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
AND (f.assignment_group_type_c like '%ITSM%')
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number IN ('UNSPECIFIED')
AND qx.lagging_count_of_quarter='0'
)
group by 1;

Aged_Incidents_Opened_more_than_31-Days:

snap_shot_opened incident count

SELECT 
snap.png_priority_c,
SUM(snap.opened_count_c) as incidents_current_age_greater_than_30_c
FROM ldb.f_incident a 
JOIN pgitsa_mdwdb.f_n_incident_monthly_age_snapshot_c snap 
ON a.incident_key =snap.incident_key
 JOIN ldb.d_incident b ON a.incident_key=b.row_key join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
-- JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
-- JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON snap.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON snap.assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON snap.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON snap.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON snap.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON snap.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON snap.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
JOIN ldb.d_calendar_date_fiscal fa ON snap.n_key=fa.row_key
JOIN ldb.d_calendar_fiscal_quarter qfa ON fa.quarter_start_date_key=qfa.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name <> 'Non Incident'
AND sv.dimension_name <>  'Non-Production'
AND (f.group_types_name_c like '%ITSM%')
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number = 'UNSPECIFIED'
AND qfa.lagging_count_of_quarter='0'
AND 
)
group by 1





Performance_Target : Aged P0,P1 and P2 Volumes 

SELECT 
snap.png_priority_c,
qfa.quarter_name AS Quarter_Name,
SUM(snap.opened_count_c) as incidents_current_age_greater_than_30_c
FROM ldb.f_incident a 
JOIN pgitsa_mdwdb.f_n_incident_monthly_age_snapshot_c snap 
ON a.incident_key =snap.incident_key
 JOIN ldb.d_incident b ON a.incident_key=b.row_key 
 join ldb.f_incident_cbp_eod_c bp ON b.row_key = bp.incident_cbp_c_key
JOIN ldb.d_parent_incident pi ON b.parent_incident_key=pi.row_key
-- JOIN ldb.d_calendar_date c ON a.opened_on_key=c.row_key
-- JOIN ldb.d_calendar_month d ON c.month_start_date_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_internal_organization_group f ON snap.assignment_group_key=f.row_key
JOIN ldb.d_ag_manager_role_vp_dir_ad_c g ON snap.assignment_group_key=g.internal_organization_key
JOIN ldb.d_business_service bs ON snap.business_service_key=bs.row_key
JOIN ldb.d_incident_contacttype ct ON snap.reported_type_src_key=ct.row_key
JOIN ldb.d_incident_category ca ON snap.category_src_key=ca.row_key
JOIN ldb.d_incident_close_code co ON snap.close_code_src_key=co.row_key
JOIN ldb.d_incident_severity se ON snap.severity_src_key=se.row_key
JOIN ldb.d_lov_incident_service_type_c sv ON b.service_type_src_c_key=sv.row_key
JOIN ldb.d_internal_contact_vp_c x ON g.vp_key=x.row_key
JOIN ldb.d_internal_contact_director_c y ON g.director_key=y.row_key
JOIN ldb.d_internal_contact_associate_director_c z ON g.associate_director_key=z.row_key
JOIN ldb.d_calendar_date_fiscal fa ON snap.n_key=fa.row_key
JOIN ldb.d_calendar_fiscal_quarter qfa ON fa.quarter_start_date_key=qfa.row_key
where
(
ct.source_dimension_name not in ('Auto Ticket')
AND ca.source_dimension_name not in ('Duplicate / Test', 'Duplicate / Test')
AND se.source_dimension_name <> 'Non Incident'
AND sv.dimension_name <>  'Non-Production'
AND (f.group_types_name_c like '%ITSM%')
AND 
(co.source_dimension_code not in ('Deleted', 'Invalid/Out of Scope', 'Misclassification', 'Request Rejected', 'Withdrawn by Requester')
or co.source_dimension_code in ('UNSPECIFIED'))
AND pi.incident_number = 'UNSPECIFIED'
AND qfa.lagging_count_of_quarter='4'
AND bp.critical_business_process_c_key='-2'
)
group by 1,2;