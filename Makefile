.DEFAULT: all
.PHONY: all clean fclean re libft.a
.SUFFIXES: .c .o

NAME := libftprintf.a

CC ?= clang
AR ?= ar

CFLAGS ?=
CFLAGS := $(CFLAGS) -Wall -Wextra -Werror -Iinc

OBJS := src/ft_printf.o src/ft_printers.o src/ft_printers_nbr.o src/ft_nbr_utils.o src/ft_parser.o

all: all-dependency $(NAME)

$(NAME): dependency $(OBJS)
	mv libft/libft.a $(NAME)
	$(AR) rcs $(NAME) $(OBJS)

%.o: %.c libft.h
	$(CC) $(CFLAGS) -o $@ -c $<

clean: clean-dependency
	rm -f $(OBJS) $(BONUS_OBJS)

fclean: fclean-dependency clean
	rm -f $(NAME)

re: fclean all

# DEPENDENCIES TARGET

dependency: all-dependency

all-dependency:
	make -C libft all

clean-dependency:
	make -C libft/ clean

fclean-dependency:
	make -C libft/ fclean

re-dependency:
	make -C libft/ re

test: all
	$(CC) $(CFLAGS) main.c libftprintf.a -o ft_printf_main
	time ./ft_printf_main
	rm ft_printf_main
