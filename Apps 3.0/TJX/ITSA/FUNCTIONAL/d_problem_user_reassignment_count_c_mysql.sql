select 
case 
when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) >= 1024 then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Few sys ids are : ',substring_index(group_concat(distinct failures),',',-31))

when sum(failures_cnt) > 0 and length(group_concat(distinct failures)) < 1024
then concat('Failed. Data does not match for ',sum(failures_cnt),' records. Sys Ids : ',substring_index(group_concat(distinct failures),',',-sum(failures_cnt)))

else 'Success. All warehouse records are matching with source.' end Result
from
(select 
case when src.cnt <> trgt.user_reassignment_count_c then src.documentkey else '' end as failures,

case when src.cnt <> trgt.user_reassignment_count_c  then 1 else 0 end as failures_cnt

from 
(select documentkey,sourceinstance,count(sys_id) as cnt
from tjx_mdsdb.sys_audit_final where tablename = 'problem' and fieldname = 'assigned_to' and oldvalue is not null
group by documentkey,sourceinstance) src
left join tjx_mdwdb.d_problem trgt on src.documentkey = trgt.row_id and src.sourceinstance = trgt.source_id ) fnl;

