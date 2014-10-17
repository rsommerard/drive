# $Id: Makefile,v 1.2 2004/10/12 09:06:17 marquet Exp $
##############################################################################

ROOTDIR=/home/enseign/ASE

CC	= gcc
CFLAGS	= -Wall -ansi -pedantic 
CFLAGS  += -g
LIBDIR  = $(ROOTDIR)/lib
INCDIR  = -I$(ROOTDIR)/include
LIBS    = -L$(LIBDIR) -lhardware

###------------------------------
### Main targets 
###------------------------------------------------------------
BINARIES = dmps frmt
OBJECTS	= dmps.o frmt.o

all: $(BINARIES) $(OBJECTS)


###------------------------------
### Main rules 
###------------------------------------------------------------
drive.o: drive.c drive.h
	$(CC) $(CFLAGS) -c drive.c drive.h $(INCDIR)
	    
dmps.o: dmps.c
	$(CC) $(CFLAGS) -c dmps.c $(INCDIR)
	
frmt.o: frmt.c
	$(CC) $(CFLAGS) -c frmt.c $(INCDIR)
	
dmps: dmps.o drive.o
	$(CC) $(CFLAGS) -o dmps dmps.o drive.o $(LIBS)
	
frmt: frmt.o drive.o
	$(CC) $(CFLAGS) -o frmt frmt.o drive.o $(LIBS)

###------------------------------
### Misc.
###------------------------------------------------------------
.PHONY: clean realclean depend
clean:
	$(RM) *.o $(BINARIES) *~
realclean: clean 
	$(RM) vdiskA.bin vdiskB.bin
