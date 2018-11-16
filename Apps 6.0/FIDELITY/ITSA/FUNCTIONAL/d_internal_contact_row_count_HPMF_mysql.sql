 SELECT CASE WHEN count(1) > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN count(1) >0 THEN 'MDS to DWH row count failed for d_internal_contact' ELSE 'SUCCESS' END as Message
 from ( select * from
 (select count(*) count_src from fidelity_mdsdb.hp_knta_users_final SRC where cdctype<>'D') count_src,
 (select count(*) count_trgt from fidelity_mdwdb.d_internal_contact TRGT where TRGT.row_key not in (0, -1) and TRGT.source_id = 11) count_trgt
 where count_src.count_src <> count_trgt.count_trgt
 )SQ ;
 