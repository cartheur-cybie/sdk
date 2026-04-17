CXX ?= g++
CXXFLAGS ?= -O2 -Wall -Wextra -std=c++11

TOOLS = convic3 adp2c splitic3 mergeic3 sicgrab sicburn

all: $(TOOLS)

convic3: convic3.cpp
	$(CXX) $(CXXFLAGS) -o $@ $<

adp2c: adp2c.cpp
	$(CXX) $(CXXFLAGS) -o $@ $<

splitic3: splitic3.cpp
	$(CXX) $(CXXFLAGS) -o $@ $<

mergeic3: mergeic3.cpp
	$(CXX) $(CXXFLAGS) -o $@ $<

sicgrab: sicgrab.cpp siclib.cpp siclib.h std.h
	$(CXX) $(CXXFLAGS) -o $@ sicgrab.cpp siclib.cpp

sicburn: sicburn.cpp siclib.cpp siclib.h std.h
	$(CXX) $(CXXFLAGS) -o $@ sicburn.cpp siclib.cpp

copy-to-bin: all
	cp -f $(TOOLS) ../bin/

clean:
	rm -f $(TOOLS)

.PHONY: all clean copy-to-bin
