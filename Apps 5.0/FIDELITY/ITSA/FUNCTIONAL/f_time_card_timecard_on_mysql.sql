SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, 
CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for f_time_card.timecard_on' ELSE 'SUCCESS' END as Message 
FROM fidelity_mdsdb.tm_time_sheet_lines_final SRC 
join fidelity_mdsdb.tm_time_sheets_final SRC1
on SRC.time_sheet_id  = SRC1.time_sheet_id and SRC.sourceinstance = SRC1.sourceinstance
JOIN(select *,LEFT(row_id,position('~' in row_id )-1)  as jn1 FROM fidelity_mdwdb.f_time_card) TRGT 
ON (SRC.time_sheet_line_id = TRGT.jn1 AND SRC.sourceinstance= TRGT.source_id)
LEFT JOIN fidelity_mdsdb.ktmg_periods_final LKP_SRC 
on SRC1.period_id = LKP_SRC.period_id and LKP_SRC.sourceinstance = SRC1.sourceinstance
LEFT JOIN (
select ta.time_sheet_line_id,ta.sourceinstance,tae.effort_order, floor(sum(actual_effort)) as total_effort
from fidelity_mdsdb.tm_actuals_final ta
join fidelity_mdsdb.tm_actuals_effort_final tae on ta.actuals_id = tae.actuals_id and ta.sourceinstance = tae.sourceinstance
where ta.totals_flag = 'Y' and date(ta.creation_date) >= '2017-01-01'
group by 1,2,3
) eff ON SRC.TIME_SHEET_LINE_ID =eff.TIME_SHEET_LINE_ID AND SRC.sourceinstance = eff.sourceinstance
WHERE 
DATE_ADD(LKP_SRC.START_DATE, INTERVAL coalesce(eff.effort_order,0) DAY) = TRGT.timecard_on
AND SRC1.CREATION_DATE >'2017-01-01'
; 
