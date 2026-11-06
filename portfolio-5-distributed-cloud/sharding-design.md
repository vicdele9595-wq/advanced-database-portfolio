# Sharding Design
**Shard Key:** Hashed `student_id`.
**Justification:** Distributes transcript queries evenly across nodes during result release week. Avoids chunk migrations that would occur if sharded by monotonic ID or semester.