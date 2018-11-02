 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed for f_incident.opened_by_key' ELSE 'SUCCESS' END as Message
 from paloalto_mdwdb.f_request_item f
JOIN  paloalto_mdwdb.d_request_item a ON a.row_key = f.request_item_key
where  closed_within_48_hours_c<>
 case when timestampdiff(hour,CONVERT_TZ(a.opened_on,'GMT','America/Los_Angeles'),CONVERT_TZ(a.closed_on,'GMT','America/Los_Angeles'))<=48 then 1 else 0 end ;