# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clegirar <clegirar@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2017/11/07 08:52:25 by clegirar          #+#    #+#              #
#    Updated: 2018/09/21 15:35:51 by clementgirard    ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	=	libft.a

CC		=	gcc
CFLAGS	=	-Wall -Wextra -Werror

_SRCS_BASICS	=	ft_atoi.c ft_strchar.c ft_atol.c ft_atoi_base.c			   \
					ft_atol_signed.c ft_iterative_power.c ft_bzero.c		   \
					ft_isalnum.c ft_isalpha.c ft_strlcat.c ft_isascii.c		   \
					ft_isdigit.c ft_isprint.c ft_memccpy.c ft_memchr.c		   \
					ft_memcmp.c ft_memcpy.c	ft_memmove.c ft_memset.c		   \
					ft_strcat.c	ft_strchr.c ft_strcmp.c	ft_strcpy.c			   \
					ft_strdup.c	ft_strlen.c	ft_strncat.c ft_strncmp.c		   \
					ft_strncpy.c ft_strnstr.c ft_strrchr.c ft_strstr.c		   \
					ft_tolower.c ft_toupper.c ft_itoa.c	ft_lltoa.c			   \
					ft_lltoa_signed.c ft_memalloc.c	ft_memdel.c	ft_putchar.c   \
					ft_putchar_fd.c	ft_putendl.c ft_putendl_fd.c ft_putnbr.c   \
					ft_putnbr_fd.c ft_putstr.c ft_putstr_fd.c ft_strclr.c	   \
					ft_strdel.c	ft_strequ.c	ft_striter.c ft_striteri.c		   \
					ft_strjoin.c ft_strnjoin.c ft_strjoindel.c ft_strmap.c	   \
					ft_strmapi.c ft_strnequ.c ft_strnew.c ft_strsplit.c	       \
					ft_strsub.c	ft_strtrim.c ft_puttab.c ft_epurstr.c ft_swap.c\
					ft_strcapitalize.c ft_strrev.c ft_memrealloc.c ft_tabdel.c \
					ft_tabdup.c ft_tablen.c	ft_puttab_int.c	ft_tablen_int.c    \
					ft_intlen.c	ft_putint.c	ft_tabdel_int.c	ft_itoa_base.c	   \
					ft_lltoa_base.c	ft_len_dup.c ft_strndup.c ft_atoll_base.c  \
					ft_tabcpy.c ft_splitspace.c	ft_stridx.c	ft_string_isdigit.c\
					ft_countchr.c

_SRCS_GNL	=	get_next_line.c

_SRCS_PRINTF	=	ft_printf.c	ft_dprintf.c ft_sprintf.c ft_vprintf.c		   \
					create_list.c fill_list.c manage_list.c	algo.c conv_char.c \
					conv_float.c conv_mod.c conv_signed.c conv_string.c		   \
					conv_unsigned.c conv_pointeur.c	check_mng_buff.c		   \
					mask_unicode.c conv_string_unicode.c manage_flags.c		   \
					fill_list_len.c zero_unsigned.c	no_zero_unsigned.c		   \
					zero_signed.c no_zero_signed.c fill_field_no_zero_signed.c \

_SRCS_LISTS		=	ft_lstadd.c	ft_lstdel.c	ft_lstdelone.c ft_lstiter.c		\
					ft_lstmap.c	ft_lstnew.c	ft_lstlen.c	ft_lstparams.c

BASICS_DIR	=	./Basics
GNL_DIR		=	./GNL
PRINTF_DIR	=	./Printf/srcs
LISTS_DIR	=	./Lists

SRCS_BASICS	=	$(addprefix $(BASICS_DIR)/, $(_SRCS_BASICS))
SRCS_GNL	=	$(addprefix $(GNL_DIR)/, $(_SRCS_GNL))
SRCS_PRINTF	=	$(addprefix $(PRINTF_DIR)/, $(_SRCS_PRINTF))
SRCS_LISTS	=	$(addprefix $(LISTS_DIR)/, $(_SRCS_LISTS))

OBJS_BASICS	=	$(SRCS_BASICS:.c=.o)
OBJS_GNL	=	$(SRCS_GNL:.c=.o)
OBJS_PRINTF	=	$(SRCS_PRINTF:.c=.o)
OBJS_LISTS	=	$(SRCS_LISTS:.c=.o)

HEADER_DIR_PRINTF	=	./Printf/includes
HEADER_DIR	=	./includes

#COLORS
_CYAN=\x1b[36m
_GREEN=\x1b[32m
_YELLOW=\x1b[33m
_END=\x1b[0m


all		:	$(NAME)

$(NAME)	:	$(OBJS_BASICS) $(OBJS_GNL) $(OBJS_PRINTF) $(OBJS_LISTS)
	@ar rc $(NAME) $(OBJS_BASICS) $(OBJS_GNL) $(OBJS_PRINTF) $(OBJS_LISTS)
	@ranlib $(NAME)
	@echo "$(NAME) : $(GREEN)Done$(END)"

%.o		: 	%.c
	@$(CC) $(CFLAGS) -c $< -o $@ -I $(HEADER_DIR)/ -I $(HEADER_DIR_PRINTF)/

clean	:
	@echo "$(NAME) clean: $(GREEN)Done$(END)"
	@/bin/rm -rf $(OBJS_BASICS) $(OBJS_GNL) $(OBJS_PRINTF) $(OBJS_LISTS)

fclean	:
	@/bin/rm -rf $(OBJS_BASICS) $(OBJS_GNL) $(OBJS_PRINTF) $(OBJS_LISTS)
	@/bin/rm -rf $(NAME)
	@echo "$(NAME) fclean: $(GREEN)Done$(END)"

re		:	fclean all

.PHONY	:	all clean fclean re
