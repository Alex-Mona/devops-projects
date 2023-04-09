CC= gcc -std=c11 -D_GNU_SOURCE
WWW= -Wall -Wextra -Werror
CAT= s21_cat.c

all: s21_cat

s21_cat:
	$(CC) $(WWW) $(CAT) -o s21_cat

test:
	chmod +x t_cat.sh
	./t_cat.sh

style:
	cp ../../materials/linters/.clang-format .clang-format
	cppcheck --enable=all --suppress=missingIncludeSystem *.c *.h
	clang-format -n *.c
	sleep 0.5
	clang-format -n *.c
	rm -rf .clang-format

leaks:
	CK_FORK=no leaks --atExit -- ./s21_cat

valgrind:
	CK_FORK=no valgrind --vgdb=no --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose --log-file=RESULT_VALGRIND.txt ./s21_cat

install_valgrind:
	brew install --HEAD LouisBrunner/valgrind/valgrind

install_cppcheck:
	brew install cppcheck

rebuild:
	make clean
	make all
	rm -rf  *.o *.a

clean:
	rm -rf s21_cat
	rm -rf *.a *.out *.o log.txt RESULT_VALGRIND.txt