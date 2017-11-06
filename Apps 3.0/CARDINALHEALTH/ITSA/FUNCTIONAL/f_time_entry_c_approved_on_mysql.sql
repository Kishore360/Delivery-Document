       
           
           
           SELECT 
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT >0 THEN 'MDS TO MDW DATA VALIDATION FAILED' ELSE 'Data Matched' END as Message
FROM (SELECT count(1) as CNT

               FROM cardinalhealth_mdsdb.time_card_final a 
               LEFT JOIN cardinalhealth_mdwdb.f_time_entry_c TRGT 
 ON (a.sys_id =LEFT(TRGT.row_id,32 )  
 AND a.sourceinstance= TRGT.source_id  )
           left join     ( select  documentkey ,max(saf.sys_created_on) approved_on from 
 cardinalhealth_mdsdb.time_card_final tcf 
  inner join  cardinalhealth_mdsdb.sys_audit_final saf 
  on tcf.sys_id=saf.documentkey where tablename='time_card' and fieldname='state' and newvalue ='Approved'  group by 1 ) as sys_approved_on on sys_approved_on.documentkey=a.sys_id
  
  where sys_approved_on.approved_on<>TRGT.approved_on
  )tmp
  
  