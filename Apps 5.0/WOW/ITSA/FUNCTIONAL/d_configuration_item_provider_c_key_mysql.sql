SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt
from wow_mdsdb.u_mobile_phone_final s
left join wow_mdwdb.d_lov lkp
ON (concat('PROVIDER~MOBILE_PHONE~~~',upper(u_provider))= lkp.row_id 
AND s.sourceinstance= lkp.source_id ) 
inner join wow_mdwdb.d_configuration_item t
on s.sourceinstance= t.source_id
and s.sys_id=t.row_id
and lkp.row_key<>t.provider_c_key)temp;
