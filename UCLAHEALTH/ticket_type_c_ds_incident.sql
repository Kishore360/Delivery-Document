
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched' END AS Message 
FROM (
select count(1) as cnt from(
SELECT A.SYS_ID,B.ROW_ID,A.U_TICKET_TYPE A_U_TICKET_TYPE ,B.TICKET_TYPE B_U_TICKET_TYPE FROM
(SELECT SYS_ID,sourceinstance,U_TICKET_TYPE AS U_TICKET_TYPE 
FROM uclahealth_mdsdb.incident_final )A
LEFT OUTER JOIN  
(SELECT TICKET_TYPE,source_id,ROW_ID FROM  uclahealth_workdb.ds_incident
 )B on A.sourceinstance=B.source_id AND B.ROW_ID=SYS_ID)H
WHERE A_U_TICKET_TYPE<>B_TICKET_TYPE)E;