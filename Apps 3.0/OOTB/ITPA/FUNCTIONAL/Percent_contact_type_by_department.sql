/1 Percentage  of calls by contact type by each department1/
select
dintorg.organization_name
,f.reported_type_src_code
-- ,sum(time_spent) time_spent
,count(1)/(select count(1) from <<tenant>>_mdwdb.f_call) 1100 as per_cnt
-- ,count(f.reported_type_src_code) as repo_type

from <<tenant>>_mdwdb.f_call	f
join	<<tenant>>_mdwdb.d_call 	d
on f.row_key=d.row_key
join	<<tenant>>_mdwdb.d_internal_organization	dintorg
on dintorg.row_key=f.department_key

inner join <<tenant>>_mdwdb.d_lov	d_lov
on d_lov.row_key=f.reported_type_src_key
group by dintorg.organization_name
,f.reported_type_src_code
order by dintorg.organization_name
,f.reported_type_src_code;
