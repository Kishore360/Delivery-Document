


select case when count(1)> 0 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1)> 0 then 'MDS to DWH fact validation failed between incident_final and f_incident' else 'SUCCESS' end as Message;
select sys_id from <<tenant>>_mdsdb.incident_final S
join app_test.lsm_ls_source_timezone L 
on(convert(S.sourceinstance using utf8)  = convert(L.sourceid using utf8))

left join d_domain DMN
on (convert(DMN.row_id using utf8) = convert(S.sys_domain using utf8)
and convert(DMN.source_id using utf8) = convert((case when S.sys_domain is null then 0 else S.sourceinstance end) using utf8))

left join d_internal_organization DIO_C
on (convert(DIO_C.row_id using utf8) = convert(S.company using utf8))

left join d_lov IC
on (convert(IC.src_rowid using utf8) = convert(concat('CATEGORY~INCIDENT~~~',upper(S.category)) using utf8))

left join d_lov TI
on (convert(TI.src_rowid using utf8) = convert(concat('IMPACT~TASK~~~',upper(S.impact)) using utf8))

left join d_lov TP
on (convert(TP.src_rowid using utf8) = convert(concat('PRIORITY~TASK~~~',upper(S.priority)) using utf8))

left join d_lov CT
on (convert(CT.src_rowid using utf8)  = convert(concat('CONTACT_TYPE~TASK~~~',upper(S.contact_type)) using utf8))

left join d_lov ISV
on (convert(ISV.src_rowid using utf8) = convert(concat('SEVERITY~INCIDENT~~~',upper(S.severity)) using utf8))

left join d_lov STV
on (convert(STV.src_rowid using utf8) = convert(concat('STATE~INCIDENT~~~',upper(S.state)) using utf8))

left join d_lov ISUB
on (convert(ISUB.src_rowid using utf8) = convert(concat(concat(concat('SUBCATEGORY~INCIDENT~',upper(S.category)),'~~'),upper(S.subcategory)) using utf8))

left join d_lov TU
on (convert(TU.src_rowid using utf8) = convert(concat('URGENCY~TASK~~~',upper(S.urgency)) using utf8))

left join d_lov ICC
on (convert(ICC.src_rowid using utf8) = convert(concat('CLOSE_CODE~INCIDENT~~~',upper(S.close_code)) using utf8))

where CRC32(convert(concat(
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
using utf8)) not in (
select CRC32(convert(concat(
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
using utf8)) from <<tenant>>_mdwdb.f_incident DWH);
