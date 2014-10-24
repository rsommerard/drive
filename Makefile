# $Id: Makefile,v 1.2 2004/10/12 09:06:17 marquet Exp $
##############################################################################

ROOTDIR=./libhardware/

CC	= gcc
CFLAGS	= -Wall -ansi -pedantic 
CFLAGS  += -g
LIBDIR  = $(ROOTDIR)/lib
INCDIR  = -I$(ROOTDIR)/include
LIBS    = -L$(LIBDIR) -lhardware

###------------------------------
### Main targets 
###------------------------------------------------------------
BINARIES = dmps frmt mkhd
OBJECTS	= dmps.o frmt.o mkhd.o

all: $(BINARIES) $(OBJECTS)


###------------------------------
### Main rules 
###------------------------------------------------------------
drive.o: drive.c
	$(CC) $(CFLAGS) -c $^ $(INCDIR)
	    
dmps.o: dmps.c
	$(CC) $(CFLAGS) -c $^ $(INCDIR)
	
frmt.o: frmt.c
	$(CC) $(CFLAGS) -c $^ $(INCDIR)

mkhd.o: mkhd.c
	$(CC) $(CFLAGS) -c $^ $(INCDIR)
	
dmps: dmps.o drive.o
	$(CC) $(CFLAGS) -o dmps $^ $(LIBS)
	
frmt: frmt.o drive.o
	$(CC) $(CFLAGS) -o frmt $^ $(LIBS)

mkhd: mkhd.o
	$(CC) $(CFLAGS) -o mkhd $^ $(LIBS)

###------------------------------
### Misc.
###------------------------------------------------------------
.PHONY: clean realclean depend
clean:
	$(RM) *.o $(BINARIES) *~
realclean: clean 
	$(RM) vdiskA.bin vdiskB.bin
