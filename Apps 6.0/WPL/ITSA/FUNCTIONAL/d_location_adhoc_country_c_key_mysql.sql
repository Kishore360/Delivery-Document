SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_ad_hoc_request_c.adhoc_requested_for_location_key' ELSE 'SUCCESS' END as Message 
FROM wpl_mdsdb.cmn_location_final d
left join wpl_mdsdb.u_countries_final e
on d.country=e.sys_id and d.sourceinstance=e.sourceinstance
left join  wpl_mdwdb.d_location trgt on d.sys_id=trgt.row_id and d.sourceinstance=trgt.source_id
left join wpl_mdwdb.d_lov LKP
on COALESCE(concat('COUNTRIES~U_AD_HOC_REQUEST','~',upper(e.sys_id)),'UNSPECIFIED')=LKP.row_id
where coalesce(LKP.row_key,case when e.sys_id is null then 0 else -1 end ) <> trgt.adhoc_country_c_key
