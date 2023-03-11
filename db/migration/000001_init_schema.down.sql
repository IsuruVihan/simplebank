DROP TABLE IF EXISTS entries;

DROP TABLE IF EXISTS transfers;

-- Need to drop "entries" and "transfers" tables befor "accounts" table because there's a foreign key constraint
DROP TABLE IF EXISTS accounts;