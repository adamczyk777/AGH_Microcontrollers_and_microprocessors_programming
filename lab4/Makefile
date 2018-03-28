all: lab_4a lab_4b clean

lab_4a: lab_4a.s
		as -o lab_4a.o lab_4a.s
		ld -o lab_4a lab_4a.o

lab_4b: lab_4b.s
		as -o lab_4b.o lab_4b.s
		ld -o lab_4b lab_4b.o

.PHONY: clean

clean:
		rm -f *.o
