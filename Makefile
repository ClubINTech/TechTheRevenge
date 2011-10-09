all:
	gcc -Wall -lpthread lib/main.c lib/asservissement.c -o bin/main

clean:
	rm -rf bin/*