SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message from (
select count(1) cnt
        FROM
     rogers_mdwdb.d_hcl_sla_catalog_c d 
JOIN rogers_mdsdb.us_hcl_sla_catalog_final p ON d.row_id=concat(p.sla,
            '~',
            p.hcl_schedule_ac_attachment_ref,'~',
			REPLACE(STR_TO_DATE(start_date,'%d-%m-%Y'),'-','')) 
where p.sla <>d.sla 
and p.CDCTYPE<>'D'
)a