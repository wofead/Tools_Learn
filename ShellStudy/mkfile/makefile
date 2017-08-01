#MakeFile

OBJS =  think.o   hello.o

main: ${OBJS}
	gcc -o main  ${OBJS}
#采用隐式规则
#hello.o:
#	cc -c -o hello.o hello.c
#
#think.o:
#	cc -c -o think.o think.c
#下面采用的时伪命令
.PHONY:clean

clean:
	rm -f main ${OBJS} 
