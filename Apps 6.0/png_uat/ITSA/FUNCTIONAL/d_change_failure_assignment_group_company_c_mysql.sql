select case when count(1)>0 then 'Failure' else 'Success' end as Result,
 case when count(1)>0 then 'Data Mismatch' else 'Success' end as Message
 from(
   select change_request.number,coalesce(x.assignment_group_company,'Not Categorized')  assignment_group_company,f.assignment_group_company_c 
FROM png_mdsdb.change_request_final change_request
left join png_mdsdb.sys_user_group_final suggc on change_request.assignment_group=suggc.sys_id and change_request.sourceinstance=suggc.sourceinstance
left join png_mdsdb.core_company_final sugccomp on suggc.u_company=sugccomp.sys_id and suggc.sourceinstance=sugccomp.sourceinstance
left join (select comp.name as assignment_group_company,count(1) as cnt 
  from png_mdsdb.change_request_final as chg
  left join png_mdsdb.sys_user_group_final as susrg on chg.assignment_group=susrg.sys_id and chg.sourceinstance=susrg.sourceinstance
 inner join png_mdsdb.core_company_final as comp on susrg.u_company = comp.sys_id and susrg.sourceinstance = comp.sourceinstance 
  where chg.state in (-1,0,3)
  group by coalesce(comp.name,'UNSPECIFIED'),chg.sourceinstance
 order by cnt desc
 limit 30 ) x  on x.assignment_group_company=sugccomp.name  
join png_mdwdb.d_change_request d on change_request.sys_id=d.row_id and change_request.sourceinstance=d.source_id 
join  png_mdwdb.d_change_failure f on d.row_key=f.change_request_key and d.source_id=f.source_id and f.current_flag='Y'
)a
where assignment_group_company<>assignment_group_company_c;


