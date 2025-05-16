                                                               QUERY PLAN                                                                
-----------------------------------------------------------------------------------------------------------------------------------------
 Hash Join  (cost=3415.00..4877.84 rows=50000 width=52) (actual time=86.647..278.266 rows=50000 loops=1)
   Hash Cond: (p.host_id = u.user_id)
   ->  Hash Join  (cost=2953.00..4284.53 rows=50000 width=54) (actual time=71.708..211.833 rows=50000 loops=1)
         Hash Cond: (b.property_id = p.property_id)
         ->  Hash Join  (cost=1840.00..3040.26 rows=50000 width=38) (actual time=48.407..129.838 rows=50000 loops=1)
               Hash Cond: (payments.booking_id = b.booking_id)
               ->  Seq Scan on payments  (cost=0.00..1069.00 rows=50000 width=22) (actual time=0.049..18.209 rows=50000 loops=1)
               ->  Hash  (cost=1215.00..1215.00 rows=50000 width=32) (actual time=46.214..46.216 rows=50000 loops=1)
                     Buckets: 65536  Batches: 1  Memory Usage: 3637kB
                     ->  Seq Scan on bookings b  (cost=0.00..1215.00 rows=50000 width=32) (actual time=0.060..17.058 rows=50000 loops=1)
         ->  Hash  (cost=863.00..863.00 rows=20000 width=32) (actual time=23.019..23.019 rows=20000 loops=1)
               Buckets: 32768  Batches: 1  Memory Usage: 1506kB
               ->  Seq Scan on properties p  (cost=0.00..863.00 rows=20000 width=32) (actual time=0.014..11.842 rows=20000 loops=1)
   ->  Hash  (cost=337.00..337.00 rows=10000 width=30) (actual time=14.761..14.762 rows=10000 loops=1)
         Buckets: 16384  Batches: 1  Memory Usage: 735kB
         ->  Seq Scan on users u  (cost=0.00..337.00 rows=10000 width=30) (actual time=0.019..8.823 rows=10000 loops=1)
 Planning Time: 3.529 ms
 Execution Time: 284.727 ms
(18 rows)

                                                               QUERY PLAN                                                                
-----------------------------------------------------------------------------------------------------------------------------------------
 Hash Join  (cost=3415.00..4877.84 rows=50000 width=52) (actual time=133.119..360.036 rows=50000 loops=1)
   Hash Cond: (p.host_id = u.user_id)
   ->  Hash Join  (cost=2953.00..4284.53 rows=50000 width=54) (actual time=114.725..280.355 rows=50000 loops=1)
         Hash Cond: (b.property_id = p.property_id)
         ->  Hash Join  (cost=1840.00..3040.26 rows=50000 width=38) (actual time=81.804..186.897 rows=50000 loops=1)
               Hash Cond: (payments.booking_id = b.booking_id)
               ->  Seq Scan on payments  (cost=0.00..1069.00 rows=50000 width=22) (actual time=0.025..11.765 rows=50000 loops=1)
               ->  Hash  (cost=1215.00..1215.00 rows=50000 width=32) (actual time=80.314..80.316 rows=50000 loops=1)
                     Buckets: 65536  Batches: 1  Memory Usage: 3637kB
                     ->  Seq Scan on bookings b  (cost=0.00..1215.00 rows=50000 width=32) (actual time=0.037..29.909 rows=50000 loops=1)
         ->  Hash  (cost=863.00..863.00 rows=20000 width=32) (actual time=32.283..32.283 rows=20000 loops=1)
               Buckets: 32768  Batches: 1  Memory Usage: 1506kB
               ->  Seq Scan on properties p  (cost=0.00..863.00 rows=20000 width=32) (actual time=0.024..12.855 rows=20000 loops=1)
   ->  Hash  (cost=337.00..337.00 rows=10000 width=30) (actual time=18.000..18.001 rows=10000 loops=1)
         Buckets: 16384  Batches: 1  Memory Usage: 735kB
         ->  Seq Scan on users u  (cost=0.00..337.00 rows=10000 width=30) (actual time=0.033..7.355 rows=10000 loops=1)
 Planning Time: 6.801 ms
 Execution Time: 366.059 ms
(18 rows)

                                                               QUERY PLAN                                                                
-----------------------------------------------------------------------------------------------------------------------------------------
 Hash Join  (cost=3415.00..4877.84 rows=50000 width=52) (actual time=91.393..333.115 rows=50000 loops=1)
   Hash Cond: (p.host_id = u.user_id)
   ->  Hash Join  (cost=2953.00..4284.53 rows=50000 width=54) (actual time=84.324..270.013 rows=50000 loops=1)
         Hash Cond: (b.property_id = p.property_id)
         ->  Hash Join  (cost=1840.00..3040.26 rows=50000 width=38) (actual time=66.206..167.995 rows=50000 loops=1)
               Hash Cond: (payments.booking_id = b.booking_id)
               ->  Seq Scan on payments  (cost=0.00..1069.00 rows=50000 width=22) (actual time=0.017..23.589 rows=50000 loops=1)
               ->  Hash  (cost=1215.00..1215.00 rows=50000 width=32) (actual time=65.339..65.341 rows=50000 loops=1)
                     Buckets: 65536  Batches: 1  Memory Usage: 3637kB
                     ->  Seq Scan on bookings b  (cost=0.00..1215.00 rows=50000 width=32) (actual time=0.017..24.162 rows=50000 loops=1)
         ->  Hash  (cost=863.00..863.00 rows=20000 width=32) (actual time=17.691..17.692 rows=20000 loops=1)
               Buckets: 32768  Batches: 1  Memory Usage: 1506kB
               ->  Seq Scan on properties p  (cost=0.00..863.00 rows=20000 width=32) (actual time=0.020..7.430 rows=20000 loops=1)
   ->  Hash  (cost=337.00..337.00 rows=10000 width=30) (actual time=6.914..6.914 rows=10000 loops=1)
         Buckets: 16384  Batches: 1  Memory Usage: 735kB
         ->  Seq Scan on users u  (cost=0.00..337.00 rows=10000 width=30) (actual time=0.014..2.868 rows=10000 loops=1)
 Planning Time: 2.600 ms
 Execution Time: 339.986 ms
(18 rows)

