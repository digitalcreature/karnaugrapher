bin/karnaugrapher: $(addprefix obj/, main.o ttable.o)
	gcc -o $@ $^
obj/%.o: src/%.c
	gcc -c $< -o $@ -I inc

obj/main.o: inc/ttable.h
obj/ttable.o: inc/ttable.h

clean:
	rm -f obj/*.o
cleanall: clean
	rm -f bin/*
