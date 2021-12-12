SRCDIR = src
BINDIR = bin
CC = gcc
CFLAGS = -O2 -pedantic -Wall

all: client server

clean:
	@rm -rf $(BINDIR)/client $(BINDIR)/server

client:
	@rm -rf $(BINDIR)/client
	$(CC) $(CFLAGS) -o $(BINDIR)/client $(SRCDIR)/client.c

server:
	@rm -rf $(BINDIR)/server
	$(CC) $(CFLAGS) -o $(BINDIR)/server $(SRCDIR)/server.c