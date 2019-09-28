
SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_change_failure.incident_count_for_change_prior_7_days_of_change_opened_c' ELSE 'SUCCESS' END as Message
FROM 
(
SELECT Count(1) AS CNT
FROM keybank_mdsdb.change_request_final SRC 
LEFT JOIN keybank_mdwdb.d_change_failure TRGT ON (SRC.sys_id=TRGT.row_id AND SRC.sourceinstance=TRGT.source_id)
left join (
select d.row_key,sum(coalesce(ci_inc_cnt,0)) as ci_inc_cnt_total from keybank_mdwdb.d_change_request d join keybankcrp_mdwdb.f_change_request f on f.change_request_key=d.row_key 
left join(
select a.configuration_item_key,a.opened_on_key as ci_opened_date_key,count(1) as ci_inc_cnt from keybank_mdwdb.f_incident a
 group by 1,2)ci_inc
on f.configuration_item_key=ci_inc.configuration_item_key
and date(ci_inc.ci_opened_date_key) between date_add(date(d.opened_on),interval -7 day) and date(d.opened_on)
group by d.row_key)b on TRGT.change_request_key=b.row_key 
WHERE b.ci_inc_cnt_total<>TRGT.incident_count_for_change_prior_7_days_of_change_opened_c
AND SRC.cdctype='X' ) temp; 
