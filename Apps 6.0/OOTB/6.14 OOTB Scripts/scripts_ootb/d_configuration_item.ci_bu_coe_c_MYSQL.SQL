select  CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
CASE WHEN CNT > 0 THEN 'MDS to DWH data validation failed for d_configuration_item.ci_bu_coe_c' ELSE 'SUCCESS' END as Message
from
(select count(1) as CNT from 
equifax_mdsdb.cmdb_ci_final SRC
left join equifax_mdwdb.d_configuration_item TRGT on SRC.sys_id=TRGT.row_id and SRC.sourceinstance=TRGT.source_id
left join equifax_mdwdb.d_lov lkp on coalesce(concat('BU_COE~CMDB_CI~',SRC.u_efx_bu_coe),'UNSPECIFIED')=lkp.row_id
and SRC.sourceinstance=lkp.source_id
where coalesce(lkp.row_key,case when SRC.u_efx_bu_coe is null then 0 else -1 end )<>TRGT.ci_bu_coe_c_key
AND SRC.CDCTYPE<>'D'
)temp;

