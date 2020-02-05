 select CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH data validation failed ' ELSE 'SUCCESS' END as Message
 FROM
(select sys_id,u_ocm_description,sourceinstance from fidelity_mdsdb.u_fmr_operating_committee_final and cdctype<>'D'
)a left join 
(select OCM_description_c,row_id,source_id from fidelity_mdwdb.d_fmr_operating_committee_c) b on a.sys_id=b.row_id and a.sourceinstance=b.source_id
where coalesce(a.u_ocm_description,'unspecified')<>b.OCM_description_c 
;

