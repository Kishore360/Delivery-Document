SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select count(1) cnt  from 
				wow_mdwdb.d_request_item trgt
left join (select grpcord.request_item_key, group_concat(distinct grp.u_name_c) as res
from wow_mdwdb.f_request_item_installable_softwares_c grpcord
join wow_mdwdb.d_installable_software_c grp on grpcord.installable_software_c_key = grp.row_key 
group by grpcord.request_item_key
) src on 
trgt.row_key = src.request_item_key and trgt.need_more_c is not null
where trgt.all_software_c <> LEFT(COALESCE(src.res,'UNSPECIFIED'),4000))a;

