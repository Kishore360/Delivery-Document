select case when count(1)>0 then 'Failure' else 'Success' end as Result,
 case when count(1)>0 then 'Data Mismatch' else 'Success' end as Message
 from(
   select change_request.number,coalesce(x.cmdb_ci_grouped,'Not Categorized')  cmdb_ci_grouped,f.cmdb_ci_grouped_c 
FROM png_mdsdb.change_request_final change_request
left join (select  coalesce(chg.cmdb_ci,'UNSPECIFIED') as cmdb_ci,chg.sourceinstance,ci.name as cmdb_ci_grouped,count(1) as cnt
 from png_mdsdb.change_request_final as chg
 left join png_mdsdb.cmdb_ci_final as ci on chg.cmdb_ci = ci.sys_id and chg.sourceinstance = ci.sourceinstance
 where chg.state in (-1,0,3)
 group by chg.cmdb_ci,chg.sourceinstance
 order by cnt desc
 limit 30 ) x on coalesce(change_request.cmdb_ci,'UNSPECIFIED') =x.cmdb_ci and change_request.sourceinstance=x.sourceinstance
join png_mdwdb.d_change_request d on change_request.sys_id=d.row_id and change_request.sourceinstance=d.source_id 
join  png_mdwdb.d_change_failure f on d.row_key=f.change_request_key and d.source_id=f.source_id and f.current_flag='Y'
)a
where cmdb_ci_grouped<>cmdb_ci_grouped_c;

