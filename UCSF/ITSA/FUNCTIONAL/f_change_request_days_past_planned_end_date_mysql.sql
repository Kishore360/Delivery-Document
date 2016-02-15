SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN count(1) >0 THEN 'Failure' ELSE 'Data Matched' END as Message
from
ucsf_mdwdb.f_change_request a
join ucsf_mdwdb.d_lov b
on a.state_src_key=b.row_key and b.dimension_code='OPEN'
left join ucsf_mdwdb.d_change_request c
on c.row_key=a.change_request_key and c.source_id=a.source_id
where a.days_past_planned_end_date<>

datediff(convert_tz(
(SELECT MAX(lastupdated) AS lastupdated FROM ucsf_mdwdb.d_o_data_freshness WHERE sourcename like 'ServiceNow%'),'GMT','America/LosAngeles')
,c.planned_end_on);