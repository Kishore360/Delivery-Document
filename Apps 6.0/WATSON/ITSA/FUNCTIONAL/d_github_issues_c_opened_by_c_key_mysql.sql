 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for d_incident.caller_state_c' ELSE 'SUCCESS' END as Message
 FROM    ibmwatson_mdsdb.u_github_issues_final s
left join ibmwatson_mdwdb.d_internal_contact d on concat('INTERNAL_CONTACT~',u_opened_by)=d.row_id
left join    ibmwatson_mdwdb.d_github_issues_c t on s.sys_id=t.row_id and s.sourceinstance=t.source_id
where opened_by_c_key<> coalesce(d.row_key,case when u_opened_by is null then 0 else -1 end );


