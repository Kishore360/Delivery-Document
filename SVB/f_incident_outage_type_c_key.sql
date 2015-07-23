
SELECT CASE WHEN cnt > 0 THEN 'FAILURE' ELSE 'SUCCESS' END AS Result
,CASE WHEN cnt > 0 THEN 'Data did not Match.' 
ELSE 'Data Matched'  END AS Message 
FROM 
(
select count(1) as cnt from(

select c.outage_type_c_key outage_type_c_key,b.row_key,u_outage_type_
fROM svb_mdsdb.incident_final a
 left JOIN  
 svb_mdwdb.d_incident b on

a.sourceinstance=b.source_id AND  substring(b.row_id,instr(b.row_id,'~')+1,32)=a.u_outage_type_
 
left join

svb_mdwdb.f_incident c on on b.source_id=c.source_id AND  b.row_id=c.row_id
)h

where outage_type_c_key<>coalesce(row_key,-1) )E;