.DEFAULT: all
.PHONY: all clean fclean re libft.a
.SUFFIXES: .c .o

NAME := libftprintf.a

CC ?= clang
AR ?= ar

CFLAGS ?=
CFLAGS := $(CFLAGS) -Wall -Wextra -Werror -Iinc

OBJS := src/ft_printf.o src/ft_printers.o src/ft_printers_nbr.o src/ft_nbr_utils.o src/ft_parser.o

LIBFT_OBJS := libft/ft_atoi.o \
		libft/ft_bzero.o \
		libft/ft_calloc.o \
		libft/ft_isalnum.o \
		libft/ft_isalpha.o \
		libft/ft_isascii.o \
		libft/ft_isdigit.o \
		libft/ft_isprint.o \
		libft/ft_itoa.o \
		libft/ft_memccpy.o \
		libft/ft_memchr.o \
		libft/ft_memcmp.o \
		libft/ft_memcpy.o \
		libft/ft_memmove.o \
		libft/ft_memset.o \
		libft/ft_putchar_fd.o \
		libft/ft_putendl_fd.o \
		libft/ft_putnbr_fd.o \
		libft/ft_putstr_fd.o \
		libft/ft_split.o \
		libft/ft_strchr.o \
		libft/ft_strdup.o \
		libft/ft_strjoin.o \
		libft/ft_strlcat.o \
		libft/ft_strlcpy.o \
		libft/ft_strlen.o \
		libft/ft_strmapi.o \
		libft/ft_strncmp.o \
		libft/ft_strnstr.o \
		libft/ft_strrchr.o \
		libft/ft_substr.o \
		libft/ft_tolower.o \
		libft/ft_toupper.o \
		libft/ft_lstadd_back.o \
		libft/ft_lstadd_front.o \
		libft/ft_lstclear.o \
		libft/ft_lstdelone.o \
		libft/ft_lstiter.o \
		libft/ft_lstlast.o \
		libft/ft_lstmap.o \
		libft/ft_lstnew.o \
		libft/ft_lstsize.o

all: all-dependency $(NAME)

$(NAME): dependency $(OBJS)
	$(AR) rcs $(NAME) $(OBJS) $(LIBFT_OBJS)

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
