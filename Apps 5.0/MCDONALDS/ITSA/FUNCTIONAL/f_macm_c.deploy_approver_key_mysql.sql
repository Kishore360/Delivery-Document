SELECT CASE WHEN count(1)>0  THEN 'FAILURE' ELSE  'SUCCESS'  END as Result, 
CASE WHEN count(1)>0  THEN  'Data mismatch' ELSE  'SUCCESS'  END as Message 
-- SELECT  coalesce(LKP.row_key, case when coalesce(user.sys_id,SRC.u_deploy_approver) is null then 0 else -1 end) , TRGT.deploy_approver_key,SRC.CDCTYPE 
-- ,user.sys_id,SRC.u_deploy_approver,SRC.sys_id
FROM mcdonalds_mdsdb.x_scafe_mcdcr_chan_mcdcr_change_request_final SRC 
JOIN mcdonalds_mdwdb.f_macm_c TRGT 
ON SRC.sys_id = TRGT.row_id and SRC.sourceinstance = TRGT.source_id
JOIN 
(SELECT a.documentkey , old.label as old_label , new.label as new_label,a.fieldname,old.value as old_value , new.value as new_value ,a.sys_created_on,a.sourceinstance as source_id,a.user from mcdonalds_mdsdb.sys_audit_final a
join (
SELECT documentkey,max(sys_created_on) as max from mcdonalds_mdsdb.sys_audit_final a
left JOIN(
SELECT VALUE , LABEL from mcdonalds_mdsdb.sys_choice_final where name ='x_scafe_mcdcr_chan_mcdcr_change_request' and element ='state' and language ='en'  ) old ON old.value = a.oldvalue
where old.value = 12 
group by 1 
) b on a.documentkey = b.documentkey and a.sys_created_on >= b.max
left join  
(
SELECT VALUE , LABEL from mcdonalds_mdsdb.sys_choice_final where name ='x_scafe_mcdcr_chan_mcdcr_change_request' and element ='state' and language ='en'  ) old ON old.value = a.oldvalue
left join
(
SELECT VALUE , LABEL from mcdonalds_mdsdb.sys_choice_final where name ='x_scafe_mcdcr_chan_mcdcr_change_request' and element ='state' and language ='en'  ) new ON new.value = a.newvalue

where tablename = 'x_scafe_mcdcr_chan_mcdcr_change_request' and old.value = 19) tmp
ON SRC.sys_id = tmp.documentkey and SRC.sourceinstance = tmp.source_id 
 LEFT JOIN mcdonalds_mdsdb.sys_user_final user 
 ON tmp.user = user.user_name and tmp.source_id = user.sourceinstance

 LEFT JOIN mcdonalds_mdwdb.d_internal_contact LKP ON

COALESCE(Concat('INTERNAL_CONTACT~', coalesce(user.sys_id,SRC.u_deploy_approver)), 'UNSPECIFIED')= LKP.row_id
and user.sourceinstance = LKP.source_id

left join (select source_id,max(lastupdated) as lastupdated from mcdonalds_mdwdb.d_o_data_freshness group by source_id) f1 on (f1.source_id = SRC.sourceinstance)

where (SRC.cdctime<=f1.lastupdated) and 
 coalesce(LKP.row_key, case when coalesce(user.sys_id,SRC.u_deploy_approver) is null then 0 else -1 end) <> TRGT.deploy_approver_key
 and SRC.CDCTYPE='X';