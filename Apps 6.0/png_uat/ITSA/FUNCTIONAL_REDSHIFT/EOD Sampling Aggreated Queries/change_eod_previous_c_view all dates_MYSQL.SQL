

CREATE table png_mdwdb.f_change_eod_previous_c 
AS
SELECT 
'1' as date_key,
x.vp_key AS vp_key,
x.director_key AS director_key,
x.associate_director_key AS associate_director_key,
di.organization_c AS Director_Function,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
Count( a.change_request_key) as closed_emergency_change_count,
0 as closed_emergency_failed_change_count,
0 as high_change_failure_count,
0 as high_change_count
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
AND c.lagging_count_of_days between 30 and 59
) 
group by 1,2,3,4,5,6,7
UNION
SELECT 
'1' as date_key,
x.vp_key AS vp_key,
x.director_key AS director_key,
x.associate_director_key AS associate_director_key,
di.organization_c AS Director_Function,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
0 as closed_emergency_change_count,
Count( a.change_request_key) as closed_emergency_failed_change_count,
0 as high_change_failure_count,
0 as high_change_count
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
AND b.failure_flag='Y'
AND w.dimension_name NOT IN ('Non-Production')
AND c.lagging_count_of_days between 30 and 59
) 
group by 1,2,3,4,5,6,7
UNION
SELECT 
'1' as date_key,
x.vp_key AS vp_key,
x.director_key AS director_key,
x.associate_director_key AS associate_director_key,
di.organization_c AS Director_Function,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
0 as closed_emergency_change_count,
0 as closed_emergency_failed_change_count,
Count( a.change_request_key) as high_change_failure_count,
0 as high_change_count
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
JOIN ldb.d_change_request_risk rk ON a.risk_src_key=rk.row_key
JOIN ldb.d_change_request_impact im ON a.impact_src_key=im.row_key
Where((d.assignment_group_type_c in ('ITSM Role Provisioning Group')
or d.assignment_group_type_c in ('ITSM IA Distribution List')
or d.assignment_group_type_c in ('ITSM Change Advisory Board')
or d.assignment_group_type_c in ('ITSM Assignment Group'))
AND g.source_dimension_name NOT IN ('Withdrawn / Cancelled','Rejected')
AND w.dimension_name NOT IN ('Non-Production')
AND rk.source_dimension_name IN ('High')
AND im.source_dimension_name IN ('1 - High')
AND b.failure_flag='Y'
AND c.lagging_count_of_days between 30 and 59
) 
group by 1,2,3,4,5,6,7
UNION
SELECT 
'1' as date_key,
x.vp_key AS vp_key,
x.director_key AS director_key,
x.associate_director_key AS associate_director_key,
di.organization_c AS Director_Function,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
0 as closed_emergency_change_count,
0 as closed_emergency_failed_change_count,
0 as high_change_failure_count,
Count( a.change_request_key) as high_change_count
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
JOIN ldb.d_change_request_risk rk ON a.risk_src_key=rk.row_key
JOIN ldb.d_change_request_impact im ON a.impact_src_key=im.row_key
Where((d.assignment_group_type_c in ('ITSM Role Provisioning Group')
or d.assignment_group_type_c in ('ITSM IA Distribution List')
or d.assignment_group_type_c in ('ITSM Change Advisory Board')
or d.assignment_group_type_c in ('ITSM Assignment Group'))
AND g.source_dimension_name NOT IN ('Withdrawn / Cancelled','Rejected')
AND w.dimension_name NOT IN ('Non-Production')
AND rk.source_dimension_name IN ('High')
AND im.source_dimension_name IN ('1 - High')
AND c.lagging_count_of_days between 30 and 59
) 
group by 1,2,3,4,5,6,7
UNION
--- current month
SELECT 
'2' as date_key,
x.vp_key AS vp_key,
x.director_key AS director_key,
x.associate_director_key AS associate_director_key,
di.organization_c AS Director_Function,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
Count( a.change_request_key) as closed_emergency_change_count,
0 as closed_emergency_failed_change_count,
0 as high_change_failure_count,
0 as high_change_count
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
AND c.lagging_count_of_month = 1
) 
group by 1,2,3,4,5,6,7
UNION
SELECT 
'2' as date_key,
x.vp_key AS vp_key,
x.director_key AS director_key,
x.associate_director_key AS associate_director_key,
di.organization_c AS Director_Function,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
0 as closed_emergency_change_count,
Count( a.change_request_key) as closed_emergency_failed_change_count,
0 as high_change_failure_count,
0 as high_change_count
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
AND b.failure_flag='Y'
AND w.dimension_name NOT IN ('Non-Production')
AND c.lagging_count_of_month = 1
) 
group by 1,2,3,4,5,6,7
UNION
SELECT 
'2' as date_key,
x.vp_key AS vp_key,
x.director_key AS director_key,
x.associate_director_key AS associate_director_key,
di.organization_c AS Director_Function,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
0 as closed_emergency_change_count,
0 as closed_emergency_failed_change_count,
Count( a.change_request_key) as high_change_failure_count,
0 as high_change_count
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
JOIN ldb.d_change_request_risk rk ON a.risk_src_key=rk.row_key
JOIN ldb.d_change_request_impact im ON a.impact_src_key=im.row_key
Where((d.assignment_group_type_c in ('ITSM Role Provisioning Group')
or d.assignment_group_type_c in ('ITSM IA Distribution List')
or d.assignment_group_type_c in ('ITSM Change Advisory Board')
or d.assignment_group_type_c in ('ITSM Assignment Group'))
AND g.source_dimension_name NOT IN ('Withdrawn / Cancelled','Rejected')
AND w.dimension_name NOT IN ('Non-Production')
AND rk.source_dimension_name IN ('High')
AND im.source_dimension_name IN ('1 - High')
AND b.failure_flag='Y'
AND c.lagging_count_of_month = 1
) 
group by 1,2,3,4,5,6,7
UNION
SELECT 
'2' as date_key,
x.vp_key AS vp_key,
x.director_key AS director_key,
x.associate_director_key AS associate_director_key,
di.organization_c AS Director_Function,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
0 as closed_emergency_change_count,
0 as closed_emergency_failed_change_count,
0 as high_change_failure_count,
Count( a.change_request_key) as high_change_count
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
JOIN ldb.d_change_request_risk rk ON a.risk_src_key=rk.row_key
JOIN ldb.d_change_request_impact im ON a.impact_src_key=im.row_key
Where((d.assignment_group_type_c in ('ITSM Role Provisioning Group')
or d.assignment_group_type_c in ('ITSM IA Distribution List')
or d.assignment_group_type_c in ('ITSM Change Advisory Board')
or d.assignment_group_type_c in ('ITSM Assignment Group'))
AND g.source_dimension_name NOT IN ('Withdrawn / Cancelled','Rejected')
AND w.dimension_name NOT IN ('Non-Production')
AND rk.source_dimension_name IN ('High')
AND im.source_dimension_name IN ('1 - High')
AND c.lagging_count_of_month = 1
) 
group by 1,2,3,4,5,6,7


UNION
--- current fiscal quarter

SELECT 
'3' as date_key,
x.vp_key AS vp_key,
x.director_key AS director_key,
x.associate_director_key AS associate_director_key,
di.organization_c AS Director_Function,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
Count( a.change_request_key) as closed_emergency_change_count,
0 as closed_emergency_failed_change_count,
0 as high_change_failure_count,
0 as high_change_count
FROM ldb.f_change_request_closed a
JOIN ldb.d_change_request b ON a.change_request_key=b.row_key
JOIN ldb.d_internal_contact_change_request_ci_owned_by_c ow ON a.owned_by_c_key=ow.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year df ON c.year_start_date_key=df.row_key
JOIN ldb.d_calendar_fiscal_quarter qx ON c.quarter_start_date_key=qx.row_key
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
AND c.lagging_count_of_quarter = 1
) 
group by 1,2,3,4,5,6,7
UNION
SELECT 
'3' as date_key,
x.vp_key AS vp_key,
x.director_key AS director_key,
x.associate_director_key AS associate_director_key,
di.organization_c AS Director_Function,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
0 as closed_emergency_change_count,
Count( a.change_request_key) as closed_emergency_failed_change_count,
0 as high_change_failure_count,
0 as high_change_count
FROM ldb.f_change_request_closed a
JOIN ldb.d_change_request b ON a.change_request_key=b.row_key
JOIN ldb.d_internal_contact_change_request_ci_owned_by_c ow ON a.owned_by_c_key=ow.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year df ON c.year_start_date_key=df.row_key
JOIN ldb.d_calendar_fiscal_quarter qx ON c.quarter_start_date_key=qx.row_key
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
AND b.failure_flag='Y'
AND w.dimension_name NOT IN ('Non-Production')
AND c.lagging_count_of_quarter = 1
) 
group by 1,2,3,4,5,6,7
UNION
SELECT 
'3' as date_key,
x.vp_key AS vp_key,
x.director_key AS director_key,
x.associate_director_key AS associate_director_key,
di.organization_c AS Director_Function,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
0 as closed_emergency_change_count,
0 as closed_emergency_failed_change_count,
Count( a.change_request_key) as high_change_failure_count,
0 as high_change_count
FROM ldb.f_change_request_closed a
JOIN ldb.d_change_request b ON a.change_request_key=b.row_key
JOIN ldb.d_internal_contact_change_request_ci_owned_by_c ow ON a.owned_by_c_key=ow.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year df ON c.year_start_date_key=df.row_key
JOIN ldb.d_calendar_fiscal_quarter qx ON c.quarter_start_date_key=qx.row_key
JOIN ldb.d_internal_organization_group d ON a.assignment_group_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_change_request_type f ON b.type_src_key=f.row_key
JOIN ldb.d_change_request_close_code g ON b.close_code_src_key=g.row_key
JOIN ldb.d_lov_change_request_service_type_c w ON b.service_type_src_c_key=w.row_key
JOIN ldb.d_co_manager_role_vp_dir_ad_c x ON a.owned_by_c_key=x.change_owner_key
JOIN ldb.d_internal_contact_vp_c vp ON x.vp_key=vp.row_key
JOIN ldb.d_internal_contact_director_c di ON x.director_key=DI.row_key
JOIN ldb.d_internal_contact_associate_director_c adi ON x.associate_director_key=adi.row_key
JOIN ldb.d_change_request_risk rk ON a.risk_src_key=rk.row_key
JOIN ldb.d_change_request_impact im ON a.impact_src_key=im.row_key
Where((d.assignment_group_type_c in ('ITSM Role Provisioning Group')
or d.assignment_group_type_c in ('ITSM IA Distribution List')
or d.assignment_group_type_c in ('ITSM Change Advisory Board')
or d.assignment_group_type_c in ('ITSM Assignment Group'))
AND g.source_dimension_name NOT IN ('Withdrawn / Cancelled','Rejected')
AND w.dimension_name NOT IN ('Non-Production')
AND rk.source_dimension_name IN ('High')
AND im.source_dimension_name IN ('1 - High')
AND b.failure_flag='Y'
AND c.lagging_count_of_quarter = 1
) 
group by 1,2,3,4,5,6,7
UNION
SELECT 
'3' as date_key,
x.vp_key AS vp_key,
x.director_key AS director_key,
x.associate_director_key AS associate_director_key,
di.organization_c AS Director_Function,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
0 as closed_emergency_change_count,
0 as closed_emergency_failed_change_count,
0 as high_change_failure_count,
Count( a.change_request_key) as high_change_count
FROM ldb.f_change_request_closed a
JOIN ldb.d_change_request b ON a.change_request_key=b.row_key
JOIN ldb.d_internal_contact_change_request_ci_owned_by_c ow ON a.owned_by_c_key=ow.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year df ON c.year_start_date_key=df.row_key
JOIN ldb.d_calendar_fiscal_quarter qx ON c.quarter_start_date_key=qx.row_key
JOIN ldb.d_internal_organization_group d ON a.assignment_group_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_change_request_type f ON b.type_src_key=f.row_key
JOIN ldb.d_change_request_close_code g ON b.close_code_src_key=g.row_key
JOIN ldb.d_lov_change_request_service_type_c w ON b.service_type_src_c_key=w.row_key
JOIN ldb.d_co_manager_role_vp_dir_ad_c x ON a.owned_by_c_key=x.change_owner_key
JOIN ldb.d_internal_contact_vp_c vp ON x.vp_key=vp.row_key
JOIN ldb.d_internal_contact_director_c di ON x.director_key=DI.row_key
JOIN ldb.d_internal_contact_associate_director_c adi ON x.associate_director_key=adi.row_key
JOIN ldb.d_change_request_risk rk ON a.risk_src_key=rk.row_key
JOIN ldb.d_change_request_impact im ON a.impact_src_key=im.row_key
Where((d.assignment_group_type_c in ('ITSM Role Provisioning Group')
or d.assignment_group_type_c in ('ITSM IA Distribution List')
or d.assignment_group_type_c in ('ITSM Change Advisory Board')
or d.assignment_group_type_c in ('ITSM Assignment Group'))
AND g.source_dimension_name NOT IN ('Withdrawn / Cancelled','Rejected')
AND w.dimension_name NOT IN ('Non-Production')
AND rk.source_dimension_name IN ('High')
AND im.source_dimension_name IN ('1 - High')
AND c.lagging_count_of_quarter = 1
) 
group by 1,2,3,4,5,6,7
UNION
---- current year
SELECT 
'4' as date_key,
x.vp_key AS vp_key,
x.director_key AS director_key,
x.associate_director_key AS associate_director_key,
di.organization_c AS Director_Function,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
Count( a.change_request_key) as closed_emergency_change_count,
0 as closed_emergency_failed_change_count,
0 as high_change_failure_count,
0 as high_change_count
FROM ldb.f_change_request_closed a
JOIN ldb.d_change_request b ON a.change_request_key=b.row_key
JOIN ldb.d_internal_contact_change_request_ci_owned_by_c ow ON a.owned_by_c_key=ow.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year df ON c.year_start_date_key=df.row_key
JOIN ldb.d_calendar_fiscal_quarter qx ON c.quarter_start_date_key=qx.row_key
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
AND c.lagging_count_of_year = 0
) 
group by 1,2,3,4,5,6,7
UNION
SELECT 
'4' as date_key,
x.vp_key AS vp_key,
x.director_key AS director_key,
x.associate_director_key AS associate_director_key,
di.organization_c AS Director_Function,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
0 as closed_emergency_change_count,
Count( a.change_request_key) as closed_emergency_failed_change_count,
0 as high_change_failure_count,
0 as high_change_count
FROM ldb.f_change_request_closed a
JOIN ldb.d_change_request b ON a.change_request_key=b.row_key
JOIN ldb.d_internal_contact_change_request_ci_owned_by_c ow ON a.owned_by_c_key=ow.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year df ON c.year_start_date_key=df.row_key
JOIN ldb.d_calendar_fiscal_quarter qx ON c.quarter_start_date_key=qx.row_key
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
AND b.failure_flag='Y'
AND w.dimension_name NOT IN ('Non-Production')
AND c.lagging_count_of_year = 0
) 
group by 1,2,3,4,5,6,7
UNION
SELECT 
'4' as date_key,
x.vp_key AS vp_key,
x.director_key AS director_key,
x.associate_director_key AS associate_director_key,
di.organization_c AS Director_Function,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
0 as closed_emergency_change_count,
0 as closed_emergency_failed_change_count,
Count( a.change_request_key) as high_change_failure_count,
0 as high_change_count
FROM ldb.f_change_request_closed a
JOIN ldb.d_change_request b ON a.change_request_key=b.row_key
JOIN ldb.d_internal_contact_change_request_ci_owned_by_c ow ON a.owned_by_c_key=ow.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year df ON c.year_start_date_key=df.row_key
JOIN ldb.d_calendar_fiscal_quarter qx ON c.quarter_start_date_key=qx.row_key
JOIN ldb.d_internal_organization_group d ON a.assignment_group_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_change_request_type f ON b.type_src_key=f.row_key
JOIN ldb.d_change_request_close_code g ON b.close_code_src_key=g.row_key
JOIN ldb.d_lov_change_request_service_type_c w ON b.service_type_src_c_key=w.row_key
JOIN ldb.d_co_manager_role_vp_dir_ad_c x ON a.owned_by_c_key=x.change_owner_key
JOIN ldb.d_internal_contact_vp_c vp ON x.vp_key=vp.row_key
JOIN ldb.d_internal_contact_director_c di ON x.director_key=DI.row_key
JOIN ldb.d_internal_contact_associate_director_c adi ON x.associate_director_key=adi.row_key
JOIN ldb.d_change_request_risk rk ON a.risk_src_key=rk.row_key
JOIN ldb.d_change_request_impact im ON a.impact_src_key=im.row_key
Where((d.assignment_group_type_c in ('ITSM Role Provisioning Group')
or d.assignment_group_type_c in ('ITSM IA Distribution List')
or d.assignment_group_type_c in ('ITSM Change Advisory Board')
or d.assignment_group_type_c in ('ITSM Assignment Group'))
AND g.source_dimension_name NOT IN ('Withdrawn / Cancelled','Rejected')
AND w.dimension_name NOT IN ('Non-Production')
AND rk.source_dimension_name IN ('High')
AND im.source_dimension_name IN ('1 - High')
AND b.failure_flag='Y'
AND c.lagging_count_of_year = 0
) 
group by 1,2,3,4,5,6,7
UNION
SELECT 
'4' as date_key,
x.vp_key AS vp_key,
x.director_key AS director_key,
x.associate_director_key AS associate_director_key,
di.organization_c AS Director_Function,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
0 as closed_emergency_change_count,
0 as closed_emergency_failed_change_count,
0 as high_change_failure_count,
Count( a.change_request_key) as high_change_count
FROM ldb.f_change_request_closed a
JOIN ldb.d_change_request b ON a.change_request_key=b.row_key
JOIN ldb.d_internal_contact_change_request_ci_owned_by_c ow ON a.owned_by_c_key=ow.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year df ON c.year_start_date_key=df.row_key
JOIN ldb.d_calendar_fiscal_quarter qx ON c.quarter_start_date_key=qx.row_key
JOIN ldb.d_internal_organization_group d ON a.assignment_group_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_change_request_type f ON b.type_src_key=f.row_key
JOIN ldb.d_change_request_close_code g ON b.close_code_src_key=g.row_key
JOIN ldb.d_lov_change_request_service_type_c w ON b.service_type_src_c_key=w.row_key
JOIN ldb.d_co_manager_role_vp_dir_ad_c x ON a.owned_by_c_key=x.change_owner_key
JOIN ldb.d_internal_contact_vp_c vp ON x.vp_key=vp.row_key
JOIN ldb.d_internal_contact_director_c di ON x.director_key=DI.row_key
JOIN ldb.d_internal_contact_associate_director_c adi ON x.associate_director_key=adi.row_key
JOIN ldb.d_change_request_risk rk ON a.risk_src_key=rk.row_key
JOIN ldb.d_change_request_impact im ON a.impact_src_key=im.row_key
Where((d.assignment_group_type_c in ('ITSM Role Provisioning Group')
or d.assignment_group_type_c in ('ITSM IA Distribution List')
or d.assignment_group_type_c in ('ITSM Change Advisory Board')
or d.assignment_group_type_c in ('ITSM Assignment Group'))
AND g.source_dimension_name NOT IN ('Withdrawn / Cancelled','Rejected')
AND w.dimension_name NOT IN ('Non-Production')
AND rk.source_dimension_name IN ('High')
AND im.source_dimension_name IN ('1 - High')
AND c.lagging_count_of_year = 0
) 
group by 1,2,3,4,5,6,7
UNION
SELECT 
'5' as date_key,
x.vp_key AS vp_key,
x.director_key AS director_key,
x.associate_director_key AS associate_director_key,
di.organization_c AS Director_Function,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
Count( a.change_request_key) as closed_emergency_change_count,
0 as closed_emergency_failed_change_count,
0 as high_change_failure_count,
0 as high_change_count
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
AND c.lagging_count_of_days between 60 and 89
) 
group by 1,2,3,4,5,6,7
UNION
SELECT 
'5' as date_key,
x.vp_key AS vp_key,
x.director_key AS director_key,
x.associate_director_key AS associate_director_key,
di.organization_c AS Director_Function,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
0 as closed_emergency_change_count,
Count( a.change_request_key) as closed_emergency_failed_change_count,
0 as high_change_failure_count,
0 as high_change_count
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
AND b.failure_flag='Y'
AND w.dimension_name NOT IN ('Non-Production')
AND c.lagging_count_of_days between 60 and 89
) 
group by 1,2,3,4,5,6,7
UNION
SELECT 
'5' as date_key,
x.vp_key AS vp_key,
x.director_key AS director_key,
x.associate_director_key AS associate_director_key,
di.organization_c AS Director_Function,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
0 as closed_emergency_change_count,
0 as closed_emergency_failed_change_count,
Count( a.change_request_key) as high_change_failure_count,
0 as high_change_count
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
JOIN ldb.d_change_request_risk rk ON a.risk_src_key=rk.row_key
JOIN ldb.d_change_request_impact im ON a.impact_src_key=im.row_key
Where((d.assignment_group_type_c in ('ITSM Role Provisioning Group')
or d.assignment_group_type_c in ('ITSM IA Distribution List')
or d.assignment_group_type_c in ('ITSM Change Advisory Board')
or d.assignment_group_type_c in ('ITSM Assignment Group'))
AND g.source_dimension_name NOT IN ('Withdrawn / Cancelled','Rejected')
AND w.dimension_name NOT IN ('Non-Production')
AND rk.source_dimension_name IN ('High')
AND im.source_dimension_name IN ('1 - High')
AND b.failure_flag='Y'
AND c.lagging_count_of_days between 60 and 89
) 
group by 1,2,3,4,5,6,7
UNION
SELECT 
'5' as date_key,
x.vp_key AS vp_key,
x.director_key AS director_key,
x.associate_director_key AS associate_director_key,
di.organization_c AS Director_Function,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
0 as closed_emergency_change_count,
0 as closed_emergency_failed_change_count,
0 as high_change_failure_count,
Count( a.change_request_key) as high_change_count
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
JOIN ldb.d_change_request_risk rk ON a.risk_src_key=rk.row_key
JOIN ldb.d_change_request_impact im ON a.impact_src_key=im.row_key
Where((d.assignment_group_type_c in ('ITSM Role Provisioning Group')
or d.assignment_group_type_c in ('ITSM IA Distribution List')
or d.assignment_group_type_c in ('ITSM Change Advisory Board')
or d.assignment_group_type_c in ('ITSM Assignment Group'))
AND g.source_dimension_name NOT IN ('Withdrawn / Cancelled','Rejected')
AND w.dimension_name NOT IN ('Non-Production')
AND rk.source_dimension_name IN ('High')
AND im.source_dimension_name IN ('1 - High')
AND c.lagging_count_of_days between 60 and 89
) 
group by 1,2,3,4,5,6,7
UNION
--- current month
SELECT 
'6' as date_key,
x.vp_key AS vp_key,
x.director_key AS director_key,
x.associate_director_key AS associate_director_key,
di.organization_c AS Director_Function,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
Count( a.change_request_key) as closed_emergency_change_count,
0 as closed_emergency_failed_change_count,
0 as high_change_failure_count,
0 as high_change_count
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
AND c.lagging_count_of_month = 2
) 
group by 1,2,3,4,5,6,7
UNION
SELECT 
'6' as date_key,
x.vp_key AS vp_key,
x.director_key AS director_key,
x.associate_director_key AS associate_director_key,
di.organization_c AS Director_Function,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
0 as closed_emergency_change_count,
Count( a.change_request_key) as closed_emergency_failed_change_count,
0 as high_change_failure_count,
0 as high_change_count
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
AND b.failure_flag='Y'
AND w.dimension_name NOT IN ('Non-Production')
AND c.lagging_count_of_month = 2
) 
group by 1,2,3,4,5,6,7
UNION
SELECT 
'6' as date_key,
x.vp_key AS vp_key,
x.director_key AS director_key,
x.associate_director_key AS associate_director_key,
di.organization_c AS Director_Function,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
0 as closed_emergency_change_count,
0 as closed_emergency_failed_change_count,
Count( a.change_request_key) as high_change_failure_count,
0 as high_change_count
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
JOIN ldb.d_change_request_risk rk ON a.risk_src_key=rk.row_key
JOIN ldb.d_change_request_impact im ON a.impact_src_key=im.row_key
Where((d.assignment_group_type_c in ('ITSM Role Provisioning Group')
or d.assignment_group_type_c in ('ITSM IA Distribution List')
or d.assignment_group_type_c in ('ITSM Change Advisory Board')
or d.assignment_group_type_c in ('ITSM Assignment Group'))
AND g.source_dimension_name NOT IN ('Withdrawn / Cancelled','Rejected')
AND w.dimension_name NOT IN ('Non-Production')
AND rk.source_dimension_name IN ('High')
AND im.source_dimension_name IN ('1 - High')
AND b.failure_flag='Y'
AND c.lagging_count_of_month = 2
) 
group by 1,2,3,4,5,6,7
UNION
SELECT 
'6' as date_key,
x.vp_key AS vp_key,
x.director_key AS director_key,
x.associate_director_key AS associate_director_key,
di.organization_c AS Director_Function,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
0 as closed_emergency_change_count,
0 as closed_emergency_failed_change_count,
0 as high_change_failure_count,
Count( a.change_request_key) as high_change_count
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
JOIN ldb.d_change_request_risk rk ON a.risk_src_key=rk.row_key
JOIN ldb.d_change_request_impact im ON a.impact_src_key=im.row_key
Where((d.assignment_group_type_c in ('ITSM Role Provisioning Group')
or d.assignment_group_type_c in ('ITSM IA Distribution List')
or d.assignment_group_type_c in ('ITSM Change Advisory Board')
or d.assignment_group_type_c in ('ITSM Assignment Group'))
AND g.source_dimension_name NOT IN ('Withdrawn / Cancelled','Rejected')
AND w.dimension_name NOT IN ('Non-Production')
AND rk.source_dimension_name IN ('High')
AND im.source_dimension_name IN ('1 - High')
AND c.lagging_count_of_month = 2
) 
group by 1,2,3,4,5,6,7


UNION
--- current fiscal quarter

SELECT 
'7' as date_key,
x.vp_key AS vp_key,
x.director_key AS director_key,
x.associate_director_key AS associate_director_key,
di.organization_c AS Director_Function,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
Count( a.change_request_key) as closed_emergency_change_count,
0 as closed_emergency_failed_change_count,
0 as high_change_failure_count,
0 as high_change_count
FROM ldb.f_change_request_closed a
JOIN ldb.d_change_request b ON a.change_request_key=b.row_key
JOIN ldb.d_internal_contact_change_request_ci_owned_by_c ow ON a.owned_by_c_key=ow.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year df ON c.year_start_date_key=df.row_key
JOIN ldb.d_calendar_fiscal_quarter qx ON c.quarter_start_date_key=qx.row_key
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
AND c.lagging_count_of_quarter = 2
) 
group by 1,2,3,4,5,6,7
UNION
SELECT 
'7' as date_key,
x.vp_key AS vp_key,
x.director_key AS director_key,
x.associate_director_key AS associate_director_key,
di.organization_c AS Director_Function,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
0 as closed_emergency_change_count,
Count( a.change_request_key) as closed_emergency_failed_change_count,
0 as high_change_failure_count,
0 as high_change_count
FROM ldb.f_change_request_closed a
JOIN ldb.d_change_request b ON a.change_request_key=b.row_key
JOIN ldb.d_internal_contact_change_request_ci_owned_by_c ow ON a.owned_by_c_key=ow.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year df ON c.year_start_date_key=df.row_key
JOIN ldb.d_calendar_fiscal_quarter qx ON c.quarter_start_date_key=qx.row_key
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
AND b.failure_flag='Y'
AND w.dimension_name NOT IN ('Non-Production')
AND c.lagging_count_of_quarter = 2
) 
group by 1,2,3,4,5,6,7
UNION
SELECT 
'7' as date_key,
x.vp_key AS vp_key,
x.director_key AS director_key,
x.associate_director_key AS associate_director_key,
di.organization_c AS Director_Function,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
0 as closed_emergency_change_count,
0 as closed_emergency_failed_change_count,
Count( a.change_request_key) as high_change_failure_count,
0 as high_change_count
FROM ldb.f_change_request_closed a
JOIN ldb.d_change_request b ON a.change_request_key=b.row_key
JOIN ldb.d_internal_contact_change_request_ci_owned_by_c ow ON a.owned_by_c_key=ow.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year df ON c.year_start_date_key=df.row_key
JOIN ldb.d_calendar_fiscal_quarter qx ON c.quarter_start_date_key=qx.row_key
JOIN ldb.d_internal_organization_group d ON a.assignment_group_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_change_request_type f ON b.type_src_key=f.row_key
JOIN ldb.d_change_request_close_code g ON b.close_code_src_key=g.row_key
JOIN ldb.d_lov_change_request_service_type_c w ON b.service_type_src_c_key=w.row_key
JOIN ldb.d_co_manager_role_vp_dir_ad_c x ON a.owned_by_c_key=x.change_owner_key
JOIN ldb.d_internal_contact_vp_c vp ON x.vp_key=vp.row_key
JOIN ldb.d_internal_contact_director_c di ON x.director_key=DI.row_key
JOIN ldb.d_internal_contact_associate_director_c adi ON x.associate_director_key=adi.row_key
JOIN ldb.d_change_request_risk rk ON a.risk_src_key=rk.row_key
JOIN ldb.d_change_request_impact im ON a.impact_src_key=im.row_key
Where((d.assignment_group_type_c in ('ITSM Role Provisioning Group')
or d.assignment_group_type_c in ('ITSM IA Distribution List')
or d.assignment_group_type_c in ('ITSM Change Advisory Board')
or d.assignment_group_type_c in ('ITSM Assignment Group'))
AND g.source_dimension_name NOT IN ('Withdrawn / Cancelled','Rejected')
AND w.dimension_name NOT IN ('Non-Production')
AND rk.source_dimension_name IN ('High')
AND im.source_dimension_name IN ('1 - High')
AND b.failure_flag='Y'
AND c.lagging_count_of_quarter = 2
) 
group by 1,2,3,4,5,6,7
UNION
SELECT 
'7' as date_key,
x.vp_key AS vp_key,
x.director_key AS director_key,
x.associate_director_key AS associate_director_key,
di.organization_c AS Director_Function,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
0 as closed_emergency_change_count,
0 as closed_emergency_failed_change_count,
0 as high_change_failure_count,
Count( a.change_request_key) as high_change_count
FROM ldb.f_change_request_closed a
JOIN ldb.d_change_request b ON a.change_request_key=b.row_key
JOIN ldb.d_internal_contact_change_request_ci_owned_by_c ow ON a.owned_by_c_key=ow.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year df ON c.year_start_date_key=df.row_key
JOIN ldb.d_calendar_fiscal_quarter qx ON c.quarter_start_date_key=qx.row_key
JOIN ldb.d_internal_organization_group d ON a.assignment_group_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_change_request_type f ON b.type_src_key=f.row_key
JOIN ldb.d_change_request_close_code g ON b.close_code_src_key=g.row_key
JOIN ldb.d_lov_change_request_service_type_c w ON b.service_type_src_c_key=w.row_key
JOIN ldb.d_co_manager_role_vp_dir_ad_c x ON a.owned_by_c_key=x.change_owner_key
JOIN ldb.d_internal_contact_vp_c vp ON x.vp_key=vp.row_key
JOIN ldb.d_internal_contact_director_c di ON x.director_key=DI.row_key
JOIN ldb.d_internal_contact_associate_director_c adi ON x.associate_director_key=adi.row_key
JOIN ldb.d_change_request_risk rk ON a.risk_src_key=rk.row_key
JOIN ldb.d_change_request_impact im ON a.impact_src_key=im.row_key
Where((d.assignment_group_type_c in ('ITSM Role Provisioning Group')
or d.assignment_group_type_c in ('ITSM IA Distribution List')
or d.assignment_group_type_c in ('ITSM Change Advisory Board')
or d.assignment_group_type_c in ('ITSM Assignment Group'))
AND g.source_dimension_name NOT IN ('Withdrawn / Cancelled','Rejected')
AND w.dimension_name NOT IN ('Non-Production')
AND rk.source_dimension_name IN ('High')
AND im.source_dimension_name IN ('1 - High')
AND c.lagging_count_of_quarter = 2
) 
group by 1,2,3,4,5,6,7
UNION
---- current year
SELECT 
'8' as date_key,
x.vp_key AS vp_key,
x.director_key AS director_key,
x.associate_director_key AS associate_director_key,
di.organization_c AS Director_Function,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
Count( a.change_request_key) as closed_emergency_change_count,
0 as closed_emergency_failed_change_count,
0 as high_change_failure_count,
0 as high_change_count
FROM ldb.f_change_request_closed a
JOIN ldb.d_change_request b ON a.change_request_key=b.row_key
JOIN ldb.d_internal_contact_change_request_ci_owned_by_c ow ON a.owned_by_c_key=ow.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year df ON c.year_start_date_key=df.row_key
JOIN ldb.d_calendar_fiscal_quarter qx ON c.quarter_start_date_key=qx.row_key
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
AND c.lagging_count_of_year = 1
) 
group by 1,2,3,4,5,6,7
UNION
SELECT 
'8' as date_key,
x.vp_key AS vp_key,
x.director_key AS director_key,
x.associate_director_key AS associate_director_key,
di.organization_c AS Director_Function,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
0 as closed_emergency_change_count,
Count( a.change_request_key) as closed_emergency_failed_change_count,
0 as high_change_failure_count,
0 as high_change_count
FROM ldb.f_change_request_closed a
JOIN ldb.d_change_request b ON a.change_request_key=b.row_key
JOIN ldb.d_internal_contact_change_request_ci_owned_by_c ow ON a.owned_by_c_key=ow.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year df ON c.year_start_date_key=df.row_key
JOIN ldb.d_calendar_fiscal_quarter qx ON c.quarter_start_date_key=qx.row_key
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
AND b.failure_flag='Y'
AND w.dimension_name NOT IN ('Non-Production')
AND c.lagging_count_of_year = 1
) 
group by 1,2,3,4,5,6,7
UNION
SELECT 
'8' as date_key,
x.vp_key AS vp_key,
x.director_key AS director_key,
x.associate_director_key AS associate_director_key,
di.organization_c AS Director_Function,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
0 as closed_emergency_change_count,
0 as closed_emergency_failed_change_count,
Count( a.change_request_key) as high_change_failure_count,
0 as high_change_count
FROM ldb.f_change_request_closed a
JOIN ldb.d_change_request b ON a.change_request_key=b.row_key
JOIN ldb.d_internal_contact_change_request_ci_owned_by_c ow ON a.owned_by_c_key=ow.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year df ON c.year_start_date_key=df.row_key
JOIN ldb.d_calendar_fiscal_quarter qx ON c.quarter_start_date_key=qx.row_key
JOIN ldb.d_internal_organization_group d ON a.assignment_group_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_change_request_type f ON b.type_src_key=f.row_key
JOIN ldb.d_change_request_close_code g ON b.close_code_src_key=g.row_key
JOIN ldb.d_lov_change_request_service_type_c w ON b.service_type_src_c_key=w.row_key
JOIN ldb.d_co_manager_role_vp_dir_ad_c x ON a.owned_by_c_key=x.change_owner_key
JOIN ldb.d_internal_contact_vp_c vp ON x.vp_key=vp.row_key
JOIN ldb.d_internal_contact_director_c di ON x.director_key=DI.row_key
JOIN ldb.d_internal_contact_associate_director_c adi ON x.associate_director_key=adi.row_key
JOIN ldb.d_change_request_risk rk ON a.risk_src_key=rk.row_key
JOIN ldb.d_change_request_impact im ON a.impact_src_key=im.row_key
Where((d.assignment_group_type_c in ('ITSM Role Provisioning Group')
or d.assignment_group_type_c in ('ITSM IA Distribution List')
or d.assignment_group_type_c in ('ITSM Change Advisory Board')
or d.assignment_group_type_c in ('ITSM Assignment Group'))
AND g.source_dimension_name NOT IN ('Withdrawn / Cancelled','Rejected')
AND w.dimension_name NOT IN ('Non-Production')
AND rk.source_dimension_name IN ('High')
AND im.source_dimension_name IN ('1 - High')
AND b.failure_flag='Y'
AND c.lagging_count_of_year = 1
) 
group by 1,2,3,4,5,6,7
UNION
SELECT 
'8' as date_key,
x.vp_key AS vp_key,
x.director_key AS director_key,
x.associate_director_key AS associate_director_key,
di.organization_c AS Director_Function,
a.assignment_group_key AS assignment_group_key,
a.business_service_key as business_service_key,
0 as closed_emergency_change_count,
0 as closed_emergency_failed_change_count,
0 as high_change_failure_count,
Count( a.change_request_key) as high_change_count
FROM ldb.f_change_request_closed a
JOIN ldb.d_change_request b ON a.change_request_key=b.row_key
JOIN ldb.d_internal_contact_change_request_ci_owned_by_c ow ON a.owned_by_c_key=ow.row_key
JOIN ldb.d_calendar_date_fiscal c ON a.closed_on_key=c.row_key
JOIN ldb.d_calendar_fiscal_year df ON c.year_start_date_key=df.row_key
JOIN ldb.d_calendar_fiscal_quarter qx ON c.quarter_start_date_key=qx.row_key
JOIN ldb.d_internal_organization_group d ON a.assignment_group_key=d.row_key
JOIN ldb.d_internal_contact e ON a.opened_by_key=e.row_key
JOIN ldb.d_change_request_type f ON b.type_src_key=f.row_key
JOIN ldb.d_change_request_close_code g ON b.close_code_src_key=g.row_key
JOIN ldb.d_lov_change_request_service_type_c w ON b.service_type_src_c_key=w.row_key
JOIN ldb.d_co_manager_role_vp_dir_ad_c x ON a.owned_by_c_key=x.change_owner_key
JOIN ldb.d_internal_contact_vp_c vp ON x.vp_key=vp.row_key
JOIN ldb.d_internal_contact_director_c di ON x.director_key=DI.row_key
JOIN ldb.d_internal_contact_associate_director_c adi ON x.associate_director_key=adi.row_key
JOIN ldb.d_change_request_risk rk ON a.risk_src_key=rk.row_key
JOIN ldb.d_change_request_impact im ON a.impact_src_key=im.row_key
Where((d.assignment_group_type_c in ('ITSM Role Provisioning Group')
or d.assignment_group_type_c in ('ITSM IA Distribution List')
or d.assignment_group_type_c in ('ITSM Change Advisory Board')
or d.assignment_group_type_c in ('ITSM Assignment Group'))
AND g.source_dimension_name NOT IN ('Withdrawn / Cancelled','Rejected')
AND w.dimension_name NOT IN ('Non-Production')
AND rk.source_dimension_name IN ('High')
AND im.source_dimension_name IN ('1 - High')
AND c.lagging_count_of_year = 1
) 
group by 1,2,3,4,5,6,7
;




