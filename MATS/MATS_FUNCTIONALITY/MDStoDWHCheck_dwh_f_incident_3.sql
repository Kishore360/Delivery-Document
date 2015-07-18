
select case when count(1)> 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1)> 0 then 'MDS to DWH fact validation failed between incident_final and dwh_f_incident' else 'SUCCESS' end as Message;
select sys_id from <<tenant>>_mdsdb.incident_final S
join <<tenant>>_mdwdb.lsm_ls_source_timezone L 
on(S.sourceinstance  = L.sourceid )

left join dwh_d_domain DMN
on (DMN.row_id = S.sys_domain 
and DMN.source_id = (case when S.sys_domain is null then 0 else S.sourceinstance end) )

left join dwh_d_internal_organization DIO_C
on (DIO_C.row_id = S.company )

left join dwh_d_lov_incident_category_view IC
on (IC.src_rowid = concat('CATEGORY~INCIDENT~~~',upper(S.category)) )

left join dwh_d_lov_task_impact_view TI
on (TI.src_rowid = concat('IMPACT~TASK~~~',upper(S.impact)) )

left join dwh_d_lov_task_priority_view TP
on (TP.src_rowid = concat('PRIORITY~TASK~~~',upper(S.priority)) )

left join dwh_d_lov_task_contact_type_view CT
on (CT.src_rowid  = concat('CONTACT_TYPE~TASK~~~',upper(S.contact_type)) )

left join dwh_d_lov_incident_severity_view ISV
on (ISV.src_rowid = concat('SEVERITY~INCIDENT~~~',upper(S.severity)) )

left join dwh_d_lov_incident_state_view STV
on (STV.src_rowid = concat('STATE~INCIDENT~~~',upper(S.state)) )

left join dwh_d_lov_incident_subcategory_view ISUB
on (ISUB.src_rowid = concat(concat(concat('SUBCATEGORY~INCIDENT~',upper(S.category)),'~~'),upper(S.subcategory)) )

left join dwh_d_lov_task_urgency_view TU
on (TU.src_rowid = concat('URGENCY~TASK~~~',upper(S.urgency)) )

left join dwh_d_lov_incident_close_code_view ICC
on (ICC.src_rowid = concat('CLOSE_CODE~INCIDENT~~~',upper(S.close_code)) )

where CRC32(concat(
coalesce(DMN.row_key,case when S.sys_domain is not null then -1 else 0 end),
coalesce(DIO_C.row_key,case when S.company is not null then -1 else 0 end),
coalesce(IC.row_key,case when S.category is not null then -1 else 0 end),
coalesce(TI.row_key,case when S.impact is not null then -1 else 0 end),
coalesce(TP.row_key,case when S.priority is not null then -1 else 0 end),
coalesce(CT.row_key,case when S.contact_type is not null then -1 else 0 end),
coalesce(ISV.row_key,case when S.severity is not null then -1 else 0 end),
coalesce(STV.row_key,case when S.state is not null then -1 else 0 end),
coalesce(ISUB.row_key,case when S.subcategory is not null then -1 else 0 end),
coalesce(TU.row_key,case when S.urgency is not null then -1 else 0 end),
coalesce(ICC.row_key,case when S.close_code is not null then -1 else 0 end),
case when timestampdiff(month,convert_tz(S.sys_updated_on,source_time_zone,target_time_zone),now())>0 then 'Y' else 'N' end,
case when S.incident_state not in ('6','7') then 'Y' else 'N' end,
ifnull(S.sys_created_by,''),
ifnull(S.sys_updated_by,''),
ifnull(convert_tz(S.sys_created_on,source_time_zone,target_time_zone),''),
ifnull(convert_tz(S.sys_updated_on,source_time_zone,target_time_zone),''))
) not in (
select CRC32(concat(
ifnull(DWH.domain_key,''),
ifnull(DWH.company_key,''),
ifnull(DWH.category_src_key,''),
ifnull(DWH.impact_src_key,''),
ifnull(DWH.priority_src_key,''),
ifnull(DWH.reported_type_src_key,''),
ifnull(DWH.severity_src_key,''),
ifnull(DWH.state_src_key,''),
ifnull(DWH.sub_category_src_key,''),
ifnull(DWH.urgency_src_key,''),
ifnull(DWH.close_code_src_key,''),
ifnull(DWH.dormant_flag,''),
ifnull(DWH.backlog_flag,''),
ifnull(DWH.created_by,''),
ifnull(DWH.changed_by,''),
ifnull(DWH.created_on,''),
ifnull(DWH.changed_on,''))
) from <<tenant>>_mdwdb.dwh_f_incident DWH);
