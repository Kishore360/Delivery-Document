
select case when count(1) > 1 then 'FAILURE' else 'SUCCESS' end as Result,
case when count(1) > 1 then CONCAT( CAST(COUNT(1) AS CHAR(10)), ' invalid aging_key set for dwh_f_incident') 
else 'SUCCESS' end as Message
 from usf_mdwdb.dwh_d_lov a , 
					(select  TIMESTAMPDIFF(DAY,c.calendar_date,i.dw_updated_on) as age_in_days, i.row_key,i.age_key
					from usf_mdwdb.dwh_f_incident i
					inner join usf_mdwdb.dwh_d_calendar_date c
					on c.row_key = i.opened_on_key 
					where c.source_id=0
					and i.state_src_code not in(6,7) ) as x 
where x.age_in_days between a.lower_range_value and a.upper_range_value 
and dimension_class like '%AGEBUCKET%'
