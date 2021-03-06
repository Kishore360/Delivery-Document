SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed for d_survey_question.survey_key' ELSE 'SUCCESS' END as Message
FROM (SELECT count(1) as CNT
FROM tjx_mdsdb.incident_final SRC
join tjx_mdwdb.d_incident TRGT
ON (SRC.sys_id =TRGT.row_id  
 AND SRC.sourceinstance= TRGT.source_id  )
where case when SRC.contact_type in ('event') THEN 'IT'
 when SRC.contact_type in ('email') and SRC.u_reported_by in
 ('Email Alert - US','Email Alert - CA') THEN 'IT'
 when SRC.contact_type in ('phone','self-service','walk-in','email') and coalesce(SRC.u_reported_by,'UNSPECIFIED')  not in
 ('Email Alert - US','Email Alert - CA') THEN 'Customer'
else 'UNSPECIFIED' end  <> TRGT.source_of_ticket_c limit 100)temp; 

