SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0  THEN 'MDS to DWH data validation failed for d_outage.audience_outage_c_key' ELSE 'SUCCESS' END as Message 
FROM
(select CONCAT(COALESCE(a.FORECAST_TYPE,'UNSPECIFIED'),'~',COALESCE(a.ITG_PROJECT_NUMBER,'UNSPECIFIED'),'~',COALESCE(a.CALENDAR_PERIOD,'UNSPECIFIED'),'~',
COALESCE(a.metric_type,'UNSPECIFIED'),'~',COALESCE(a.vendor_name,'UNSPECIFIED'),'~PLANNED') AS row_id , ITG_PROJECT_NUMBER,CALENDAR_PERIOD,sourceinstance,
sum(FORECAST_AMOUNT)  planned_cost_c
from fidelity_mdsdb.financials_static_final a where metric_type in ('Labor','RE-BILL LABOR') and BILL_TYPE not in ('SUB-BILL')
and SPONSORSHIP_PERCENTAGE>0 and FORECAST_TYPE='Approved Spend' 
group by 1,2,3,4)a
left join 
(select row_id,planned_cost_c,source_id from fidelity_mdwdb.f_project_cost) b 
on a.row_id=b.row_id and a.sourceinstance=b.source_id where a.planned_cost_c<>b.planned_cost_c;