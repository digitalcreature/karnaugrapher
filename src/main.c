#include <stdio.h>
#include "ttable.h"

int main(int argc, char **argv) {
	TT_INPUT_ARRAYDEF;
	TT_OUTPUT_ARRAYDEF;
	input[0] = "a";
	input[1] = "b";
	input[2] = "c";
	output[0] = "A";
	output[1] = "B";
	output[2] = "C";
	ttable_t tt = ttable(input, output);
	printf("%s\n", tt.input[0]);
	printf("%s\n", tt.input[1]);
	printf("%s\n", tt.input[2]);
	printf("%s\n", tt.output[0]);
	printf("%s\n", tt.output[1]);
	printf("%s\n", tt.output[2]);
	return 0;
}
