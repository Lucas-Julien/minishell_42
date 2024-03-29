

# Name of the final executable
NAME = minishell

# Create a list of .c sources in DIRS
SOURCES =  	srcs/check_path.c		srcs/get_next_line.c 		srcs/parsing.c 				srcs/export.c		\
			srcs/search_cmd.c	 	srcs/exit_free.c	 		srcs/main.c	 				srcs/prompt.c 		\
			srcs/tokenizer.c	 	srcs/token_utils.c	 		srcs/check_syntax_error.c 	srcs/builtin_cd.c	\
			srcs/env.c 	  			srcs/parsing_tokenizer.c	srcs/echo.c	  				srcs/builtin_pwd.c	\
			srcs/print_export.c		srcs/unset.c				srcs/initialization.c		srcs/append_env.c	\
			srcs/execution.c		srcs/compare.c				srcs/parsing_io.c			srcs/builtin_exit.c	\
			srcs/handle_heredoc.c	srcs/tokenizer_text.c		srcs/expand_var.c			srcs/signal.c		\
			srcs/exec_multiple_cmd.c							srcs/exec_command_pipe.c	srcs/change_pwd.c	\
			
# Define objects for all sources
OBJS = $(SOURCES:.c=.o)
RL = -lreadline -L /Users/$(USER)/.brew/opt/readline/lib
		

# Define headers files
CFLAGS = -Wall -Werror -Wextra
HEADERS = -I include -I libft -I /Users/$(USER)/.brew/opt/readline/include

# Name the compiler
CC = clang

all: libft.a $(NAME)

#leaks: all
#	valgrind --suppressions=liberror --leak-check=full --show-leak-kinds=all --track-origins=yes --track-fds=yes ./$(NAME)

%.o : %.c
	$(CC) -c $(CFLAGS) $(HEADERS) $< -o $@ 

libft.a :
	cd libft && $(MAKE) && mv libft.a ../

$(NAME): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS) libft.a $(RL)

# Remove all objects, dependencies and executable files generated during the build
clean:
	rm -f $(OBJS)
	cd libft/ && make clean
	@echo Objects files delete done !

fclean: clean
	rm -f $(NAME) libft.a
	@echo Cleaning done !

re: fclean all

.PHONY: all clean  fclean re
