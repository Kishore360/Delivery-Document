SELECT *
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