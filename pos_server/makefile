reset-g: 
	docker compose down -v && docker compose up --build --build --detach && serverpod generate && dart bin/main.dart --apply-migrations

reset: 
	docker compose down -v && docker compose up --build --build --detach && dart bin/main.dart --apply-migrations

g-mig:
	serverpod generate && serverpod create-migration && dart bin/main.dart --apply-migrations