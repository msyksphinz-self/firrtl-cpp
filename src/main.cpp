#include <iostream>

#include "antlr4-runtime.h"
#include "FIRRTL_beginLexer.h"
#include "FIRRTL_beginParser.h"
#include "FIRRTL_beginBaseListener.h"

using namespace antlr4;

int main(int argc, const char* argv[]) {
  std::ifstream stream;
  stream.open(argv[1]);
  ANTLRInputStream input(stream);
  FIRRTL_beginLexer lexer(&input);
  CommonTokenStream tokens(&lexer);
  FIRRTL_beginParser parser(&tokens);

  FIRRTL_beginParser::CircuitContext* tree = parser.circuit();

  std::cout << tree->toStringTree(&parser);
  return 0;
}
