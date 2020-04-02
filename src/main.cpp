#include <iostream>

#include "antlr4-runtime.h"
#include "FIRRTLLexer.h"
#include "FIRRTLParser.h"
#include "FIRRTLBaseListener.h"

using namespace antlr4;

int main(int argc, const char* argv[]) {
  std::ifstream stream;
  stream.open(argv[1]);
  ANTLRInputStream input(stream);
  FIRRTLLexer lexer(&input);
  CommonTokenStream tokens(&lexer);
  FIRRTLParser parser(&tokens);

  FIRRTLParser::CircuitContext* tree = parser.circuit();

  std::cout << tree->toStringTree(&parser);
  return 0;
}
