 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN count(1) > 0 THEN 'Data did not Match' 
ELSE 'Data Matched' END AS Message 
FROM   watson_mdsdb.u_ibm_accounts_final
left join watson_mdwdb.d_core_country_c d on u_country=d.row_id and sourceinstance=d.source_id
join watson_mdwdb.d_ibm_accounts_c f on sys_id=f.row_id and sourceinstance=f.source_id
where coalesce(d.row_key,case when u_country is null then 0 else -1 end )<>country_c_key;

