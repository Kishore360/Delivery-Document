SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_rita_application_c.grace_period_start_date' ELSE 'SUCCESS' END as Message
FROM 
(
select count(1) as CNT
from
png_mdsdb.pg_mega_cmdb_ci_appl_final cmdb_ci_appl_final
join
png_mdwdb.d_rita_application_c a
on (cmdb_ci_appl_final.sys_id=a.row_id and cmdb_ci_appl_final.sourceinstance=a.source_id)
join 
png_mdwdb.f_rita_application_c src ON a.row_key = src.rita_application_c_key
join png_mdwdb.d_rita_application_c app
on app.row_id=a.row_id and app.source_id=a.source_id
LEFT JOIN png_mdwdb.d_lov b
on a.data_asset_lifecycle_status_key=b.row_key AND (b.dimension_class ='OT_LIFE_CYCLE_STATUS_C~PROCESSING_ACTIVITIES' OR b.row_key IN(0,-1))
LEFT JOIN png_mdwdb.d_lov c 
on a.application_nature_c_key=c.row_key AND (c.dimension_class='OT_PA_REPOSITORY_TYPE_C~PROCESSING_ACTIVITIES' OR c.row_key IN(0,-1))
LEFT JOIN png_mdwdb.d_internal_organization_hierarchy_c hier ON COALESCE(src.png_ot_organization_c_key,0) = hier.lvl_owning_organization_c_key
LEFT JOIN png_mdwdb.d_internal_organization org ON COALESCE(hier.lvl0_organization_c_key,0) = org.row_key
JOIN (select source_id,max(lastupdated) as lastupdated from png_mdwdb.d_o_data_freshness
group by source_id
) df ON a.source_id = df.source_id
where 
a.grace_period_start_date=(CASE WHEN COALESCE(b.dimension_name,'UNSPECIFIED') not in ('Decomissioned','Exception Use','Not Used / Reference','Undecided') 
			and COALESCE(c.dimension_name,'UNSPECIFIED') in ('application','application_platform','component')
			and a.gdpr_relevant_c_flag='Y' 
			and COALESCE(org.organization_name,'UNSPECIFIED') in ('Corporate Function - IT (CF-IT)','Global Business Services Organization (GBS)')
		then COALESCE(app.grace_period_start_date,CONVERT_TZ(df.lastupdated,'America/New_York','GMT'))
ELSE NULL END) 
) temp;



 


