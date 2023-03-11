pg-create:
	docker run --name simplebank_postgres -e POSTGRES_USER=root -e POSTGRES_PASSWORD=root -p 5432:5432 -d postgres:15.2-alpine

pg-start:
	docker start simplebank_postgres

pg-stop:
	docker stop simplebank_postgres

pg-remove:
	docker rm simplebank_postgres

createdb:
	docker exec -it simplebank_postgres createdb --username=root --owner=root simplebank

dropdb:
	docker exec -it simplebank_postgres dropdb simplebank

migrate-up:
	migrate -path db/migration -database postgresql://root:root@localhost:5432/simplebank?sslmode=disable -verbose up

migrate-down:
	migrate -path db/migration -database postgresql://root:root@localhost:5432/simplebank?sslmode=disable -verbose down

.PHONY: postgres-create postgres-start postgres-stop postgres-remove createdb dropdb migrate-up migrate-down