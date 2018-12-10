SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)>0  THEN 'MDS to DWH data validation failed for d_outage.audience_outage_c_key' ELSE 'SUCCESS' END as Message 
FROM
(select CONCAT(COALESCE(a.ITG_PROJECT_NUMBER,'UNSPECIFIED'),'~',
COALESCE(a.CALENDAR_PERIOD_NUMBER,'UNSPECIFIED'),'~',COALESCE(a.METRIC_TYPE_CODE,'UNSPECIFIED'),'~',
COALESCE(a.vendor_name,'UNSPECIFIED'),'~',COALESCE(a.corp_id,'UNSPECIFIED'),'~PLANNED') as row_id , ITG_PROJECT_NUMBER
,CALENDAR_PERIOD_NUMBER,sourceinstance,
sum(FCST_WORK_HOUR_QTY)  planned_hours_c
from   fidelity_mdsdb.actuals_cost_static_final a
 where METRIC_TYPE_CODE in ('Labor','RE-BILL LABOR') and BILL_TYPE not in ('SUB-BILL')
and PROJECT_SPONSORSHIP_PCT>0 
group by 1,2,3,4)a
left join 
(select row_id,planned_hours_c,source_id from  fidelity_mdwdb.f_project_cost) b 
on a.row_id=b.row_id and a.sourceinstance=b.source_id where a.planned_hours_c<>b.planned_hours_c;
