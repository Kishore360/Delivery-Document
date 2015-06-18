select a.sys_id,b.row_id,a.u_category,b.state_src_key,b.state_src_code,coalesce(c.row_key,-1),c.dimension_name
from uclahealth_mdwdb.f_incident b
inner join uclahealth_mdsdb.incident_final a
on sys_id= b.row_id 
left join uclahealth_mdwdb.d_lov c
on dimension_class like 'CATEGORY~INCIDENT%'
and dimension_code=u_category 
where coalesce(c.row_key,-1)<>b.state_src_key