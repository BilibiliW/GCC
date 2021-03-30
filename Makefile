TARGET=run
CC=g++

TARGETDIR=target
OBJDIR=obj
SRCDIR=./dirsrc

#VPATH=./:./dirsrc #use for complier's dependence relation
#VPATH=./ ./dirsrc
#VPATH +=./
#VPATH +=./dirsrc
#vpath %.cpp ./dirsrc/ 
#vpath %.cpp dirsrc ./
vpath %.cpp dirsrc:./
#vpath %.h dirlib #  the .h file maybe useless
SRC=$(wildcard *.cpp $(SRCDIR)/*.cpp)
OBJ=$(notdir $(SRC:.cpp=.o))
#OBJ=$(notdir $(SRC:%.cpp=%.o))
#OBJ=$(notdir $(patsubst %.cpp,%.o,$(SRC)))
OBJSUFFIX=$(addprefix $(OBJDIR)/,$(OBJ))

$(TARGETDIR)/$(TARGET):$(OBJSUFFIX)
	@if [ ! -d $(TARGETDIR) ];then mkdir -p $(TARGETDIR);fi
	$(CC) -o $@ $^

#$(OBJDIR)/%.o:%.cpp
$(OBJSUFFIX):$(OBJDIR)/%.o:%.cpp
	@if [ ! -d $(OBJDIR) ];then mkdir -p $(OBJDIR);fi
	@echo OBJSUFFIX:$(OBJSUFFIX)  OBJDIR:$(OBJDIR)
	$(CC) -c $^ -o $@ 


.PHONY:clean

clean:
	-rm -f $(TARGETDIR) $(OBJSUFFIX)
	#-rm $(TARGETDIR)/* $(OBJSUFFIX)
	#-rm -rf $(TARGETDIR) $(OBJSUFFIX) #  -fr could delete both the file and folder
