#include <string.h>
#include "ttable.h"

ttable_t ttable(TT_INPUT_ARRAYDEF, TT_OUTPUT_ARRAYDEF) {
	ttable_t ttable;
	memcpy(ttable.input, input, TTABLE_NINPUT * sizeof(char *));
	memcpy(ttable.output, output, TTABLE_NOUTPUT * sizeof(char *));
	unsigned long int i;
	memset(&ttable.result, 0, TTABLE_NRESULT);
	return ttable;
}
