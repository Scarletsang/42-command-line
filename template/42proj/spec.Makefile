NAME=test
TESTS=###TESTS###
TARGET=###TARGET###
TESTS_OBJS=${TESTS:.c=.o}
CC=cc

all: ${NAME}

${NAME}: main.c ${TESTS_OBJS}
	${CC} main.c ${TESTS} ${TARGET} -o test.out

${TESTS_OBJS}: ${TESTS}
	${CC} -c ${TESTS}

clean: 
	rm -f ${OBJS}

fclean: clean
	rm -f ${NAME}

re: fclean all