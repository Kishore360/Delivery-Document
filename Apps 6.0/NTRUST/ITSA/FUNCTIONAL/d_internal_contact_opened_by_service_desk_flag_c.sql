SELECT
CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_internal.opened_by_service_desk_flag_c' ELSE 'SUCCESS' END as Message
from(Select count(1) as CNT
FROM  ntrust_mdsdb.incident_final SRC
left join ntrust_mdsdb.sys_user_final SRC1
on SRC.opened_by=SRC1.sys_id
LEFT JOIN ntrust_mdwdb.d_internal_contact TRGT2 ON (concat('INTERNAL_CONTACT~',SRC1.sys_id)=TRGT2.row_id AND SRC1.sourceinstance=TRGT2.source_id)
 left join ntrust_mdwdb.d_internal_organization LKP1
 on concat('GROUP~',SRC1.u_default_support_group)=LKP1.row_id and SRC1.sourceinstance=LKP1.source_id
where case
            when LKP1.organization_name in  ('Help Desk: Institutional Investor Passport',
            'IT Service Request Planning',
            'NATS Service Desk',
            'Service Desk') then 'Y'
            else 'N'
        end <> TRGT2.opened_by_service_desk_flag_c and SRC.cdctype='X' )temp;