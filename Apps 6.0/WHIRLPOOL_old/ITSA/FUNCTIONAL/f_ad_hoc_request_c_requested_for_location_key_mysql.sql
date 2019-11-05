SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_ad_hoc_request_c.business_duration' ELSE 'SUCCESS' END as Message FROM whirlpool_mdwdb.f_ad_hoc_request_c a
join whirlpool_mdsdb.u_ad_hoc_request_final b
on a.row_id=b.sys_id
and a.source_id=b.sourceinstance
left join whirlpool_mdsdb.sys_user_final c
on b.requested_for=c.sys_id and b.sourceinstance=c.sourceinstance
left join whirlpool_mdsdb.cmn_location_final d
on c.location=d.sys_id and c.sourceinstance=d.sourceinstance
left join whirlpool_mdsdb.u_countries_final e
on d.country=e.sys_id and d.sourceinstance=e.sourceinstance
join
whirlpool_mdwdb.d_lov LKP
on COALESCE(concat('COUNTRIES~U_AD_HOC_REQUEST','~~~',upper(e.sys_id)),'UNSPECIFIED')=LKP.row_id
where coalesce(LKP.row_key,case when e.sys_id is null then 0 else -1 end ) <> a.adhoc_requested_for_location_key