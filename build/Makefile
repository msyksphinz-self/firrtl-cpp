SRC  =
SRC += ../src/main.cpp
SRC += ../antlr4/FIRRTLLexer.cpp
SRC += ../antlr4/FIRRTLParser.cpp

INC_DIR  =
INC_DIR += ../antlr4
INC_DIR += ../runtime/runtime/src

CFLAGS += $(addprefix -I, $(INC_DIR))

all: firrtl_cpp

firrtl_cpp: $(SRC)
	g++ -o $@ $^ $(CFLAGS) ../runtime/dist/libantlr4-runtime.a
