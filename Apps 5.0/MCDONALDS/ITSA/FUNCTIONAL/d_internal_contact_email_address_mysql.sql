SELECT CASE WHEN count(1)  THEN 'FAILURE' ELSE 'SUCCESS' END as Result, CASE WHEN count(1)  THEN 'MDS to DWH data validation failed for d_internal_contact.email_address' ELSE 'SUCCESS' END as Message 
FROM (select * from   mcdonalds_mdsdb.sc_req_item_final where cdctype<>'D') SRC
left join mcdonalds_mdsdb.sc_request_final LKP1 on SRC.request=LKP1.sys_id and SRC.sourceinstance=LKP1.sourceinstance
left join mcdonalds_mdsdb.sys_user_final LKP2 on LKP1.requested_for=LKP2.sys_id and SRC.sourceinstance=LKP2.sourceinstance
join mcdonalds_mdwdb.f_request_item f on SRC.sys_id=f.row_id and SRC.sourceinstance=f.source_id
join  mcdonalds_mdwdb.d_internal_contact f2 on f.requested_for_key=f2.row_key
left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)
 where (SRC.cdctime<=f1.lastupdated) and f2.soft_deleted_flag='N' and COALESCE(LKP2.email,case when LKP1.requested_for  is null then 'UNSPECIFIED' else 'UNKNOWN' end  )<>f2.email_address;
 
 
 