.PHONY: firrtl_build

ANTLR = FIRRTL_begin

SRC  =
SRC += ../src/main.cpp
SRC += ../antlr4/$(ANTLR)Lexer.cpp
SRC += ../antlr4/$(ANTLR)Parser.cpp

INC_DIR  =
INC_DIR += ../antlr4
INC_DIR += ../runtime/runtime/src

CFLAGS += $(addprefix -I, $(INC_DIR))

all: firrtl_cpp

firrtl_cpp: $(SRC) firrtl_build
	g++ -o $@ $(SRC) $(CFLAGS) ../runtime/dist/libantlr4-runtime.a

firrtl_build:
	$(MAKE) -C ../antlr4 TARGET=$(ANTLR)
