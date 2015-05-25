SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (select  count(*) as cnt from  (
select s.sys_id,s.number, s.u_customer_impacting_event,i.row_id,i.incident_number, i.customer_impacting_event_flag_c,
case when s.u_customer_impacting_event = '1' then 'Y' when s.u_customer_impacting_event ='0' then 'N' else null end as flag from cardinalhealth_mdsdb.incident_final s
inner join cardinalhealth_workdb.dwh_d_incident i on s.sys_id collate utf8_unicode_ci=i.row_id and s.sourceinstance = i.source_id
)A where  coalesce(customer_impacting_event_flag_c,' ')<>coalesce(flag,' ')
) c;