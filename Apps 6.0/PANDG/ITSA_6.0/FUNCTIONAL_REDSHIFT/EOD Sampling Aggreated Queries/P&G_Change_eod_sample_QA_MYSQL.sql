SELECT Count(1) 
FROM ldb.f_change_request_closed a
JOIN ldb.d_change_request b ON a.change_request_key=b.row_key
JOIN ldb.d_internal_contact_change_request_ci_owned_by_c ow ON a.owned_by_c_key=ow.row_key
JOIN ldb.d_calendar_date c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_month m ON c.month_start_date_key=m.row_key
JOIN ldb.d_internal_organization_group d ON a.assignment_group_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_change_request_type f ON b.type_src_key=f.row_key
JOIN ldb.d_change_request_close_code g ON b.close_code_src_key=g.row_key
JOIN ldb.d_lov_change_request_service_type_c w ON b.service_type_src_c_key=w.row_key
JOIN ldb.d_co_manager_role_vp_dir_ad_c x ON a.owned_by_c_key=x.change_owner_key
JOIN ldb.d_internal_contact_vp_c vp ON x.vp_key=vp.row_key
JOIN ldb.d_internal_contact_director_c di ON x.director_key=DI.row_key
JOIN ldb.d_internal_contact_associate_director_c adi ON x.associate_director_key=adi.row_key
Where((d.assignment_group_type_c in ('ITSM Role Provisioning Group')
or d.assignment_group_type_c in ('ITSM IA Distribution List')
or d.assignment_group_type_c in ('ITSM Change Advisory Board')
or d.assignment_group_type_c in ('ITSM Assignment Group'))
AND g.source_dimension_name NOT IN ('Withdrawn / Cancelled','Rejected')
AND f.source_dimension_name in ('Emergency')
AND w.dimension_name NOT IN ('Non-Production')
AND c.lagging_count_of_days between 0 and 29
) 
group by 1,2,3,4,5,6,7,8