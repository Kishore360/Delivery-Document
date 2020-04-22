select case when count(1)>0 then 'Failure' else 'Success' end as Result,
 case when count(1)>0 then 'Data Mismatch' else 'Success' end as Message
 from(
   select change_request.number,coalesce(x.assignee_company_grouped,'Not Categorized')  assignee_company_grouped,f.assignee_company_grouped_c 
FROM png_mdsdb.change_request_final change_request
left join png_mdsdb.sys_user_final sugc on change_request.assigned_to=sugc.sys_id and change_request.sourceinstance=sugc.sourceinstance
left join png_mdsdb.core_company_final succomp on sugc.company=succomp.sys_id and sugc.sourceinstance=succomp.sourceinstance
left join (select comp.name as assignee_company_grouped,count(1) as cnt 
  from png_mdsdb.change_request_final as chg
  left join png_mdsdb.sys_user_final as susr on chg.assigned_to=susr.sys_id and chg.sourceinstance=susr.sourceinstance
 inner join png_mdsdb.core_company_final as comp on susr.company = comp.sys_id and susr.sourceinstance = comp.sourceinstance 
  where chg.state in (-1,0,3)
  group by coalesce(comp.name,'UNSPECIFIED'),chg.sourceinstance
 order by cnt desc
 limit 30 ) x  on x.assignee_company_grouped=succomp.name  
join png_mdwdb.d_change_request d on change_request.sys_id=d.row_id and change_request.sourceinstance=d.source_id 
join  png_mdwdb.d_change_failure f on d.row_key=f.change_request_key and d.source_id=f.source_id and f.current_flag='Y'
)a
where assignee_company_grouped<>assignee_company_grouped_c;



