# Makefile

# Compiler to use
CXX ?= c++

# Flags to pass to compiler
CXXFLAGS ?= -fsanitize=signed-integer-overflow -fsanitize=undefined -ggdb3 -O0 -Qunused-arguments -std=c++11 -Wall -Werror -Wextra -Wno-sign-compare -Wshadow

# Name for executable
EXE = billing

# Space separated list of header-files
HDRS = helpers.hpp

# Space separated list of libraries, if any,
# each of which should be prefixed with -l
LIBS =

# Space separated list of source-files
SRCS = main.cpp helpers.cpp

# Automatically generated list of object files
OBJS = $(SRCS:.c=.o)

.PHONY: all
all: $(EXE)

# Default target
$(EXE): $(OBJS) $(HDRS) Makefile
	$(CXX) $(CXXFLAGS) -o $@ $(OBJS) $(LIBS)

# Dependencies
$(OBJS): $(HDRS) Makefile

.PHONY: clean
clean:
	rm -f core $(EXE) *.o
