select case when count(1)>1 then 'FAILURE' else 'SUCCESS'  END as result ,
CASE WHEN count(1)>1 then 'Data mismatch'  ELSE 'SUCCESS'  END as Message
-- select main.min_infra_end_of_support_date_c,case when fact.min_infra='9999-01-01' then null else fact.min_infra end as fact_min_infra,fact.app_id,
-- fact.role,fact.operational_status
 from bbandt_mdwdb.d_archer_application_c main
left join (select distinct least(COALESCE(min(db_support_end_date),'9999-01-01'),COALESCE(min(os_support_end_date),'9999-01-01'),
COALESCE(min(ws_support_end_date),'9999-01-01')) as min_infra,fact.app_id,min(fact.role) as role,min(fact.operational_status) as operational_status
 from bbandt_mdwdb.f_application_infra_c  fact
 where fact.role='Production' and fact.operational_status<>'Non-Operational'
group by app_id) fact
on main.row_id=fact.app_id
where main.min_infra_end_of_support_date_c<>(case when fact.min_infra='9999-01-01' then null else fact.min_infra end);