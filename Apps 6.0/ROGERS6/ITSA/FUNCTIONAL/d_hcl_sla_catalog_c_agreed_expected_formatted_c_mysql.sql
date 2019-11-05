SELECT 
CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN cnt >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message from (
select count(1) cnt
        FROM
     rogers6_mdwdb.d_hcl_sla_catalog_c d 
JOIN rogers6_mdsdb.us_hcl_sla_catalog_final p ON d.row_id=concat(p.sla,
            '~',
            p.hcl_schedule_ac_attachment_ref,'~',
			REPLACE(STR_TO_DATE(start_date,'%d-%m-%Y'),'-','')) 
where
CASE 
			WHEN p.agreed_expected like '%TBD%' 
			  and p.schedule_ac_expected_service_level like '%TBD%' then 0
			  WHEN p.agreed_expected like '%TBD%'
			  and p.schedule_ac_expected_service_level not like '%TBD%' 
			   then LEFT(p.schedule_ac_expected_service_level,LOCATE('%',p.schedule_ac_expected_service_level)-1) 
			   else 
               LEFT(p.agreed_expected,locate('%',p.agreed_expected)-1) END <> agreed_expected_formatted_c
and p.cdctype='X' )a