# Replication Steps
1. Initialized PostgreSQL primary node.
2. Configured streaming replication to secondary standby.
3. Verified read-only queries on standby.
4. Simulated failover by stopping primary; promoted standby.