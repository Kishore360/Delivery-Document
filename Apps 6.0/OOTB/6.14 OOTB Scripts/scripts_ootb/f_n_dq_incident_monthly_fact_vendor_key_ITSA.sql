SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_n_dq_incident_monthly_fact.vendor_key' ELSE 'SUCCESS' END as Message
FROM #STG_TABLE_SCHEMA.f_n_dq_incident_monthly_fact_final_base SRC
/*left join #DWH_TABLE_SCHEMA.f_incident f_cr
 on f_cr.incident_key=SRC.target_key
    left join #DWH_TABLE_SCHEMA.d_internal_contact vend
 on f_cr.assigned_to_key=vend.row_key
 left join #DWH_TABLE_SCHEMA.d_internal_organization d_or
on f_cr.assignment_group_key=d_or.row_key
left join #DWH_TABLE_SCHEMA.d_internal_contact lev0
on lev0.row_key=d_or.manager_key
left join #DWH_TABLE_SCHEMA.d_internal_contact lev1
on lev1.row_key=lev0.manager_key
left join #DWH_TABLE_SCHEMA.d_internal_contact lev2
 on lev2.row_key=lev1.manager_key
left join #DWH_TABLE_SCHEMA.d_internal_contact lev3
 on lev3.row_key=lev2.manager_key*/
LEFT JOIN  #DWH_TABLE_SCHEMA.f_n_dq_incident_monthly_fact TRGT 
ON (SRC.row_id = TRGT.row_id 
AND /*SRC.source_id=TRGT.source_id AND*/ SRC.n_key=TRGT.n_key)
WHERE COALESCE(SRC.vendor_key, '') <> COALESCE(TRGT.vendor_key, '');  
