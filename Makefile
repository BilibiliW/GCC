TARGET=run
CC=g++

OBJDIR=obj

SRCDIR=./dirsrc

VPATH=./:./dirsrc #use for complier's dependence relation

SRC=$(wildcard *.cpp $(SRCDIR)/*.cpp)
OBJ=$(notdir $(SRC:.cpp=.o))
#OBJ=$(notdir $(SRC:%.cpp=%.o))
#OBJ=$(notdir $(patsubst %.cpp,%.o,$(SRC)))
OBJSUFFIX=$(addprefix $(OBJDIR)/,$(OBJ))

$(TARGET):$(OBJSUFFIX)
	$(CC) -o $@ $^

$(OBJDIR)/%.o:%.cpp
#$(OBJSUFFIX):$(OBJDIR)/%.o:%.cpp
	@if [ ! -d $(OBJDIR) ];then mkdir -p $(OBJDIR);fi
	$(CC) -c $^ -o $@


.PHONY:clean

clean:
	-rm $(TARGET) $(OBJSUFFIX)
