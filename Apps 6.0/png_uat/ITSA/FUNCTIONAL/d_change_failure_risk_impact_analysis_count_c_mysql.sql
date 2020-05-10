select case when count(1)>0 then 'Failure' else 'Success' end as Result,
 case when count(1)>0 then 'Data Mismatch' else 'Success' end as Message
 from(
   select number, coalesce(char_length(REPLACE(change_request.risk_impact_analysis,' ','')),0) risk_impact_analysis_count,f.risk_impact_analysis_count_c 
FROM png_mdsdb.change_request_final change_request
join png_mdwdb.d_change_request d on change_request.sys_id=d.row_id and change_request.sourceinstance=d.source_id
join  png_mdwdb.d_change_failure f on d.row_key=f.change_request_key 
)a
where risk_impact_analysis_count<>risk_impact_analysis_count_c;

