
select case when count(1)>0 then 'Failure' else 'Success' end as Result,
 case when count(1)>0 then 'Data Mismatch' else 'Success' end as Message
 from(
   select change_request.number,coalesce(x.grouped_value,'Not Categorized')  cmdb_ci_grouped,f.cmdb_ci_grouped_c,change_request.state 
FROM png_mdsdb.change_request_final change_request
left join png_mdsdb.cmdb_ci_final as ci on change_request.cmdb_ci = ci.sys_id and change_request.sourceinstance = ci.sourceinstance
left join png_mdsdb.us_predictor_variable_c_final x on coalesce(ci.name,'UNSPECIFIED')=x.value and x.sourceinstance=ci.sourceinstance and x.predictor_variable ='cmdb_ci'
join pngcrp_mdwdb.d_change_request d on change_request.sys_id=d.row_id and change_request.sourceinstance=d.source_id and change_request.cdctype<>'D' and change_request.state<>'4'
join  pngcrp_mdwdb.d_change_failure f on d.row_key=f.change_request_key and d.source_id=f.source_id and f.current_flag='Y'
)a
where cmdb_ci_grouped<>cmdb_ci_grouped_c;

