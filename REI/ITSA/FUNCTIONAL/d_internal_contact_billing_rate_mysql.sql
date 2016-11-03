SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM(select count(*) as cnt 
from
rei_mdwdb.d_internal_contact finc 
join
rei_mdsdb.sys_user_final inc
ON finc.row_id =  CONCAT('INTERNAL_CONTACT~',inc.sys_id) and finc.source_id=inc.sourceinstance
JOIN rei_mdsdb.us_billing_rates_final lkp
ON inc.name = lkp.row_id AND inc.u_resource_cost_component = lkp.resource_cost_component
join rei_mdsdb.us_category_billing_rates_final lkp1 
ON inc.u_resource_cost_component = lkp1.resource_cost_component
where CASE WHEN lkp.row_id IS NOT NULL 
				THEN lkp.cost_per_hr
			WHEN lkp.row_id IS NULL 
				THEN (SELECT cost_per_hr FROM rei_mdsdb.us_category_billing_rates_final
						WHERE resource_cost_component = lkp1.resource_cost_component)	
			WHEN  inc.u_resource_cost_component IS NULL
				THEN (SELECT cost_per_hr FROM rei_mdsdb.us_category_billing_rates_final 
						WHERE resource_cost_component = 'Unknown') END <> finc.billing_rate)a

