                                            QUERY PLAN                                            
--------------------------------------------------------------------------------------------------
 Seq Scan on users  (cost=0.00..362.00 rows=8 width=16) (actual time=1.233..1.234 rows=0 loops=1)
   Filter: ((first_name)::text = 'nguyen'::text)
   Rows Removed by Filter: 10000
 Planning Time: 0.654 ms
 Execution Time: 1.267 ms
(5 rows)

                                                                  QUERY PLAN                                                                  
----------------------------------------------------------------------------------------------------------------------------------------------
 Aggregate  (cost=371.70..371.71 rows=1 width=8) (actual time=3.734..3.736 rows=1 loops=1)
   ->  Hash Join  (cost=8.18..371.65 rows=20 width=0) (actual time=0.054..3.487 rows=3353 loops=1)
         Hash Cond: (users.role_id = roles.role_id)
         ->  Seq Scan on users  (cost=0.00..337.00 rows=10000 width=16) (actual time=0.007..1.059 rows=10000 loops=1)
         ->  Hash  (cost=8.17..8.17 rows=1 width=16) (actual time=0.022..0.023 rows=1 loops=1)
               Buckets: 1024  Batches: 1  Memory Usage: 9kB
               ->  Index Scan using roles_role_name_key on roles  (cost=0.15..8.17 rows=1 width=16) (actual time=0.017..0.018 rows=1 loops=1)
                     Index Cond: ((role_name)::text = 'host'::text)
 Planning Time: 0.873 ms
 Execution Time: 3.796 ms
(10 rows)

                                                      QUERY PLAN                                                      
----------------------------------------------------------------------------------------------------------------------
 Aggregate  (cost=409.71..409.72 rows=1 width=8) (actual time=5.152..5.155 rows=1 loops=1)
   ->  Hash Join  (cost=1.05..401.38 rows=3333 width=0) (actual time=0.064..4.762 rows=3353 loops=1)
         Hash Cond: (users.role_id = roles.role_id)
         ->  Seq Scan on users  (cost=0.00..337.00 rows=10000 width=16) (actual time=0.009..1.355 rows=10000 loops=1)
         ->  Hash  (cost=1.04..1.04 rows=1 width=16) (actual time=0.019..0.020 rows=1 loops=1)
               Buckets: 1024  Batches: 1  Memory Usage: 9kB
               ->  Seq Scan on roles  (cost=0.00..1.04 rows=1 width=16) (actual time=0.012..0.013 rows=1 loops=1)
                     Filter: ((role_name)::text = 'host'::text)
                     Rows Removed by Filter: 2
 Planning Time: 1.682 ms
 Execution Time: 5.250 ms
(11 rows)

