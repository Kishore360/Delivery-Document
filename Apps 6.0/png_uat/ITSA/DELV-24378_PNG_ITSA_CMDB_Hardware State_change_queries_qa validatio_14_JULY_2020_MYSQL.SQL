Icube name:ITSA_CMDB CI Hardware State Change_C
Dossier Name:CMDB Hardware Status Change_C
Path: Shared Insights->ITSA->iCubes->All users

-- Hardware Devices 
SELECT  SRC.name,SRC.sys_id,COALESCE(SRC1.hardware_status,SRC2.u_pg_hardware_status,SRC3.u_pg_hardware_status) AS Current_Hardware_Status
FROM png_mdsdb.cmdb_ci_final SRC 
LEFT JOIN png_mdsdb.cmdb_ci_hardware_final SRC1 ON SRC.sys_id=SRC1.sys_id AND SRC.sourceinstance=SRC1.sourceinstance AND SRC1.cdctype ='X'
LEFT JOIN png_mdsdb.cmdb_ci_storage_device_final SRC2 ON SRC.sys_id=SRC2.sys_id AND SRC.sourceinstance=SRC2.sourceinstance AND SRC2.cdctype ='X'
LEFT JOIN png_mdsdb.cmdb_ci_voice_hardware_final SRC3 ON SRC.sys_id=SRC3.sys_id AND SRC.sourceinstance=SRC3.sourceinstance AND SRC3.cdctype ='X'
Where SRC.cdctype='X'
AND SRC.name='10P1M72-W10';

Select a.documentkey,a.sys_id,a.oldvalue
FROM png_mdsdb.sys_audit_final a Where a.documentkey='eeb7f42adb6d970086eff1561d961994'
AND a.fieldname='hardware_status' 
AND a.cdctype='X';

Select a.sys_id,b.documentkey,a.name AS Device_name,b.tablename,a.sys_created_on AS Device_CreatedON,timestampdiff(Day,'2019-03-28 16:13:52','2020-07-02 21:07:04'),
timestampdiff(Day,'2019-03-28 12:13:52','2020-07-02 5:07:04'),
b.sys_created_on AS Created_Date,
b.fieldname,b.oldvalue AS OLD_VALUES,b.newvalue AS NEW_VALUES
From png_mdsdb.cmdb_ci_final a 
LEFT JOIN png_mdsdb.sys_audit_final b ON a.sys_id=b.documentkey AND a.sourceinstance=b.sourceinstance AND b.cdctype='X'
Where b.fieldname='hardware_status'
-- AND tablename IN ('cmdb_ci_hardware','cmdb_ci_voice_hardware','cmdb_ci_storage_device')
AND a.cdctype='X'
AND a.name='5CD9124H65-W10';

 