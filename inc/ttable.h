#ifndef TTABLE_H
#define TTABLE_H

#include <stdint.h>

#define TTABLE_NINPUT 4
#define TTABLE_NOUTPUT 32
#define TTABLE_NRESULT 16

#define TT_INPUT_ARRAYDEF char *input[TTABLE_NINPUT]
#define TT_OUTPUT_ARRAYDEF char *output[TTABLE_NOUTPUT]

typedef struct _ttable {
	TT_INPUT_ARRAYDEF;						// input names
	TT_OUTPUT_ARRAYDEF;						// output names
	uint32_t result[TTABLE_NRESULT];		// result flags
} ttable_t;

ttable_t ttable(TT_INPUT_ARRAYDEF, TT_OUTPUT_ARRAYDEF);

#endif
