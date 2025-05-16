                                                                        QUERY PLAN                                                                        
----------------------------------------------------------------------------------------------------------------------------------------------------------
 Hash Join  (cost=1328.29..2637.42 rows=3020 width=60) (actual time=24.545..39.932 rows=3018 loops=1)
   Hash Cond: (b.property_id = p.property_id)
   ->  Hash Join  (cost=462.00..1763.21 rows=3020 width=60) (actual time=9.011..22.175 rows=3018 loops=1)
         Hash Cond: (b.user_id = u.user_id)
         ->  Append  (cost=0.00..1293.28 rows=3020 width=62) (actual time=0.021..10.582 rows=3018 loops=1)
               ->  Seq Scan on bookings_2025_q2 b_1  (cost=0.00..179.86 rows=3018 width=62) (actual time=0.020..3.446 rows=3018 loops=1)
                     Filter: ((start_date >= '2025-04-01'::date) AND (end_date <= '2025-04-30'::date))
                     Rows Removed by Filter: 3106
               ->  Seq Scan on bookings_default b_2  (cost=0.00..1098.32 rows=2 width=62) (actual time=6.478..6.478 rows=0 loops=1)
                     Filter: ((start_date >= '2025-04-01'::date) AND (end_date <= '2025-04-30'::date))
                     Rows Removed by Filter: 37488
         ->  Hash  (cost=337.00..337.00 rows=10000 width=30) (actual time=8.795..8.797 rows=10000 loops=1)
               Buckets: 16384  Batches: 1  Memory Usage: 735kB
               ->  Seq Scan on users u  (cost=0.00..337.00 rows=10000 width=30) (actual time=0.010..3.657 rows=10000 loops=1)
   ->  Hash  (cost=616.29..616.29 rows=20000 width=16) (actual time=15.144..15.145 rows=20000 loops=1)
         Buckets: 32768  Batches: 1  Memory Usage: 1194kB
         ->  Index Only Scan using idx_property_id on properties p  (cost=0.29..616.29 rows=20000 width=16) (actual time=0.098..6.459 rows=20000 loops=1)
               Heap Fetches: 0
 Planning Time: 3.450 ms
 Execution Time: 40.618 ms
(20 rows)

`Perfomance and speed has improved after partitioning`