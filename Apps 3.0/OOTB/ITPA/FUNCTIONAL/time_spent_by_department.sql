/1 Timespent on calls made by each department1/
select
dintorg.organization_name
,sum(time_spent) time_spent

from 	<<tenant>>_mdwdb.f_call	f
join	<<tenant>>_mdwdb.d_call 	d
on f.row_key=d.row_key
join	<<tenant>>_mdwdb.d_internal_organization	dintorg
on dintorg.row_key=f.department_key
group by dintorg.organization_name
order by dintorg.organization_name;
