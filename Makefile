#!make
# include mula-store/.env

up:
	docker compose up

down:
	docker compose down

.PHONY:	up down