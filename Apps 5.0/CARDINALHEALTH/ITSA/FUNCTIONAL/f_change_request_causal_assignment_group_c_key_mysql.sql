 SELECT
 CASE WHEN CNT > 0 THEN 'FAILURE' ELSE 'SUCCESS' END as Result,
 CASE WHEN CNT >0 THEN 'MDS to DWH data validation failed' ELSE 'SUCCESS' END as Message
 FROM (SELECT count(1) as CNT
FROM cardinalhealth_mdwdb.f_change_request f_chr
 JOIN (SELECT rfc_c_key,
			  max(causal_assignment_group_c_key) AS causal_assignment_group_c_key
	    FROM cardinalhealth_mdwdb.f_problem
		WHERE soft_deleted_flag = 'N'
		group by rfc_c_key) f_problem on f_problem.rfc_c_key = f_chr.change_request_key
where f_chr.causal_assignment_group_c_key <> f_problem.causal_assignment_group_c_key)a;



	