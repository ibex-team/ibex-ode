CXXFLAGS := $(shell pkg-config --cflags ibex) 
LIBS	 := $(shell pkg-config --libs  ibex)

ifeq ($(DEBUG), yes)
CXXFLAGS := $(CXXFLAGS) -O0 -g -pg -Wall -frounding-math  
else
CXXFLAGS := $(CXXFLAGS) -O3 -DNDEBUG -Wno-deprecated -frounding-math 
endif

all: ibexode-attract-region dicho-scalable optim-scalable

ibexode-attract-region : src/ibex_AttractionRegion.o main/ibexode-attract-region.cpp
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -I../src -o $@ $^ $(LIBS)

dicho-scalable : src/ibex_AttractionRegion.o main/dicho-scalable.cpp
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -I../src -o $@ $^ $(LIBS)

optim-scalable : src/ibex_AttractionRegion.o main/optim-scalable.cpp
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -I../src -o $@ $^ $(LIBS)

src/ibex_AttractionRegion.o : src/ibex_AttractionRegion.cpp src/ibex_AttractionRegion.h
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c -o $@ $<

clean:
	rm -f src/*.o ibexode-attract-region dicho-scalable optim-scalable
	
