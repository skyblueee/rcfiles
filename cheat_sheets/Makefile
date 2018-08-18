VERSION = DEBUG  # DEBUG, PROFILE, RELEASE
############################################################
# flags
CFLAGS =  # -Iinclude
LDFLAGS =  # -Llibpath
LOADLIBES =  # -llibname
SOFLAGS = -fPIC -shared
############################################################
DEBUG_CFLAGS = -g -DUSE_HEAP_STATS
PROFILE_CFLAGS = -pg
RELEASE_CFLAGS = -O2

ifeq "$(VERSION)" "DEBUG"
	CFLAGS += $(DEBUG_CFLAGS)
else
	ifeq "$(VERSION)" "PROFILE"
		CFLAGS += $(PROFILE_CFLAGS)
	else
		ifeq "$(VERSION)" "RELEASE"
			CFLAGS += $(RELEASE_CFLAGS)
		endif
	endif
endif

CXX = g++
CC = $(CXX)
CXXFLAGS = $(CFLAGS)
############################################################
# files
# unittest
TESTSRC = main.cpp
TESTOBJ = $(TESTSRC:%.cpp=%.o)  # main.o
TESTEXE = $(TESTSRC:%.cpp=%.out)  # main.out

# libsrc
LIBSRC =
LIBHEADER = $(LIBSRC:%.cpp=%.h)
LIBOBJ = $(LIBSRC:%.cpp=lib%.so)

# funcsrc
FUNCSRC =
FUNCHEADER = $(FUNCSRC:%.cpp=%.h)
FUNCOBJ = $(FUNCSRC:%.cpp=%.o)

# python src
PYSRC =
PYOBJ = $(PYSRC:%.py=%.pyc)

#
SRC = $(TESTSRC) $(LIBSRC) $(FUNCSRC)
HEADER = $(LIBHEADER) $(FUNCHEADER)
############################################################
# rules
all: depend $(TESTEXE) $(PYOBJ)

depend:
	makedepend -Y $(SRC) 2> /dev/null; rm Makefile.bak

$(TESTEXE): $(TESTOBJ) $(FUNCOBJ) $(LIBOBJ)
	$(CXX) $(CXXFLAGS) $(LDFLAGS) $(LOADLIBES) -o $@ $(TESTOBJ) $(FUNCOBJ)

# TESTOBJ FUNCOBJ
%.o : %.cpp
	$(CXX) -c $(CXXFLAGS) -o $@ $<

# LIBOBJ
lib%.so : %.cpp
	$(CXX) $(SOFLAGS) $(CXXFLAGS) -o $@ $<

# PYOBJ
%.pyc : %.py
	python3 -c "import py_compile; py_compile.compile('$<', '$@')"

.PHONY: run clean
run: all
	LD_LIBRARY_PATH=. ./$(TESTEXE)

clean:
	rm -f $(TESTEXE) $(TESTOBJ) $(FUNCOBJ) $(LIBOBJ) $(PYOBJ)

