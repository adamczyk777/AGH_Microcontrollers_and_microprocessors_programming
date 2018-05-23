all: lab_8x lab_8 clean
		
lab_8x: lab_8x.s
		gcc -no-pie -o ./bin/lab_8x lab_8x.s

lab_8: lab_8.s
		as -o lab_8.o lab_8.s
		ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -lc -o ./bin/lab_8 lab_8.o

.PHONY: clean

clean:
		rm -f *.o
