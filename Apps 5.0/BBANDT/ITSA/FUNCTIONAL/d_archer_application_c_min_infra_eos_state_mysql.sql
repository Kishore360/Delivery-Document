select case when count(1)>1 then 'FAILURE' else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch'  ELSE 'SUCCESS'  END as Message
from bbandt_mdwdb.d_archer_application_c appl
LEFT JOIN (
select min(least_color) as min_color_code, X.row_id, X.source_id from 
(select a.row_id, a.source_id, os_end_of_support_health_code_n, db_end_of_support_health_code_n,
ws_end_of_support_health_code_n,
COALESCE(LEAST(os_end_of_support_health_code_n,db_end_of_support_health_code_n,ws_end_of_support_health_code_n),5) as least_color
from bbandt_mdwdb.d_archer_application_c a 
left join 
(select app_id,
case 
when b.os_end_of_support_health_code = 'Red' then 1
when b.os_end_of_support_health_code = 'Orange' then 2
when b.os_end_of_support_health_code = 'Yellow' then 3
when b.os_end_of_support_health_code = 'Green' then 4
when b.os_end_of_support_health_code = 'White' then 5
 end as os_end_of_support_health_code_n,
case 
when b.db_end_of_support_health_code = 'Red' then 1
when b.db_end_of_support_health_code = 'Orange' then 2
when b.db_end_of_support_health_code = 'Yellow' then 3
when b.db_end_of_support_health_code = 'Green' then 4
when b.db_end_of_support_health_code = 'White' then 5
end as db_end_of_support_health_code_n,
case 
when b.ws_end_of_support_health_code = 'Red' then 1
when b.ws_end_of_support_health_code = 'Orange' then 2
when b.ws_end_of_support_health_code = 'Yellow' then 3
when b.ws_end_of_support_health_code = 'Green' then 4
when b.ws_end_of_support_health_code = 'White' then 5
end as ws_end_of_support_health_code_n
from bbandt_mdwdb.f_application_infra_c b
where role='Production' and operational_status<>'Non-Operational') i 
on a.row_id=i.app_id 
order by a.row_id
)X
group by row_id, source_id
) Y
ON appl.row_id=Y.row_id and  appl.source_id=Y.source_id
where  appl.min_infra_eos_state<> case 
when Y.min_color_code =1 then 'Red'  
when Y.min_color_code =2 then 'Orange'
when Y.min_color_code =3 then 'Yellow' 
when Y.min_color_code =4 then 'Green' 
else 'White' end;