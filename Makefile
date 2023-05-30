# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rpinto-m <rpinto-m@student.42porto.co      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/26 11:28:42 by rpinto-m          #+#    #+#              #
#    Updated: 2023/04/26 11:30:12 by rpinto-m         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# =============================================================================
#	GENERAL CONFIG & FLAGS
# =============================================================================

NAME	= libftprintf.a
RM		= rm -f

# "use cc"
CC		= gcc

# "submit a Makefile which will compile your source files to the required 
# output with the flags -Wall, -Wextra and -Werror"
CFLAGS	= -Wall -Wextra -Werror

# "You must use the command ar to create your library."
LIB1	= ar -rcs
LIB2	= ranlib

# =============================================================================
#	MANDATORY PART
# =============================================================================

SRCS_MAND = ${wildcard f*.c}

SRCS_MAND	=	ft_printf.c \
				ft_putbase_hex.c \
				ft_putchar.c \
				ft_putnbr.c \
				ft_putpointer.c \
				ft_putstr.c \
				ft_putunbr.c

# Takes the variable value ${SRCS_MAND}, which is a string composed of words 
# separated by spaces, and for each word, replace the suffix .c with .o
OBJS_MAND	=	${SRCS_MAND:.c=.o}

# =============================================================================
#	RULES
# =============================================================================

# "Your Makefile must at least contain the rules $(NAME), all, clean, fclean 
# and re."

# Compile the sources (*.c) to object files (*.o)
# Then generate a library file and index it
# 'nm libftprintf.a' to check content
$(NAME)	:	$(OBJS_MAND)
			$(LIB1) $(NAME) $(OBJS_MAND)

# 'all' is the second rule so 'libftprintf.a' (NAME) will show message library 
# filename 'make: `libftprintf.a' is up to date.' when trying to relink
all		:	$(NAME)

# Sample:
# cc -Wall -Wextra -Werror -c ft_isalpha.c -o ft_isalpha.o
#	-c			Only run preprocess, compile, and assemble steps
#	-o <file>	Write output to <file>
#	$< and $@	gnu.org/software/make/manual/make.html#Automatic-Variables
#%.o		:	%.c
#			$(CC) $(CFLAGS) -c $< -o $@

# Clean object files (*.o)
clean	:	
			$(RM) $(OBJS_MAND)

# Clean object files (*.o) and the binary file
fclean	:	clean
			$(RM) $(NAME)

# Clean object files (*.o) and the binary file; 
# Then create the binary file again, and generate the library and index it
re		:	fclean all

author: 
	echo 'rpinto-m'	

norm:
	echo 'Running Norminette'
	norminette -R CheckForbiddenSourceHeader *.c
	norminette -R CheckDefine *.h	

# .PHONY rule in order to avoid relinking
.PHONY	:	all clean fclean re norm author

#			$(CC) $(CFLAGS) ${SRCS_MAND} ${FRED}
# =================================================================================
# 				*** cspdiuxX% ***
# =================================================================================

# Sua função deve lidar com as seguintes conversões: cspdiuxX%

# Isso refere-se a uma especificação de formatação que é frequentemente usada
# em linguagens de programação, como a linguagem C. Essa especificação indica
# que sua função deve ser capaz de lidar com a conversão de valores para
# diferentes formatos de saída, dependendo da letra que segue o símbolo "%"
# (por exemplo, "%d" é usado para formatar um valor inteiro em decimal).

# As letras que seguem o símbolo "%" que foram mencionadas - c, s, p, d, i,
# u, x e X - representam diferentes tipos de dados que podem ser formatados.
# Por exemplo, "s" é usado para formatar uma sequência de caracteres (string),
# "d" e "i" são usados para formatar valores inteiros com sinal, "u" é usado
# para formatar valores inteiros sem sinal e "x" e "X" são usados para
# formatar valores inteiros em hexadecimal. O "c" é usado para formatar um
# caractere e o "%" é usado para imprimir o caractere "%" literalmente.

# Em resumo, a especificação "cspdiuxX%" é uma instrução para sua função
# lidar com diferentes tipos de dados e formatá-los de acordo com os símbolos
# específicos fornecidos.

# ===================================================================================================================
# 					** ar -rcs **
# ===================================================================================================================

# usar o comando ar para criar a livraria

#  1. ar -rcs é um comando usado no sistema Unix/Linux para criar ou atualizar
#     uma biblioteca estática de arquivos objeto.
#  2. O comando ar é uma ferramenta utilizada para gerenciar arquivos de bibliotecas no
#     Unix/Linux. Ele pode criar, atualizar, listar e extrair arquivos de bibliotecas estáticas.
#  3. A opção -rcs é usada em conjunto com o comando ar. Cada letra corresponde a uma opção
#     específica:
#     r: substitui ou adiciona arquivos na biblioteca, conforme especificado pelos argumentos seguintes;
#     c: cria uma nova biblioteca, se ela não existir;
#     s: grava um índice de símbolos na biblioteca.
#  4. Portanto, a opção -rcs é usada para criar uma nova biblioteca, atualizar os arquivos existentes
#     na biblioteca e gravar um índice de símbolos.

# =================================================================================
# 				*** ${wildcard f*.c} ***
# =================================================================================

# Num Makefile, esta linha significa que a variável SRCS_MAND irá conter todos
# os arquivos que iniciam com "f" e terminam com ".c" no diretório atual.
# A função wildcard é usada para expandir o nome de arquivo com caracteres asterisco
# (como "*") numa lista de nomes de arquivos. Então, essa linha é usada para
# identificar todos os arquivos de código-fonte necessários para serem compilados.

# =================================================================================
# 				*** libtool command is forbidden ***
# =================================================================================

# O libtool é uma ferramenta que é usada para simplificar o processo de criação
# de bibliotecas compartilhadas em sistemas Unix e Linux. Ele é usado para gerir
# a complexidade da criação de bibliotecas compartilhadas em diferentes
# plataformas e ambientes de desenvolvimento.

# O comando "libtool" é usado para automatizar a criação de bibliotecas
# compartilhadas em projetos C/C++. Ele fornece uma interface consistente
# para gerir a criação e a instalação de bibliotecas compartilhadas em
# diferentes sistemas operacionais e arquiteturas. O libtool também pode ser
# usado para criar arquivos de objeto compartilhados e arquivos de objeto estáticos.

# Em resumo, o comando "libtool" é uma ferramenta muito útil para desenvolvedores
# C/C++ que desejam criar bibliotecas compartilhadas e garantir a portabilidade
# dos seus projetos em diferentes plataformas.

# =================================================================================
# 				*** conversions ***
# =================================================================================

# • %c Prints a single character.
# • %s Prints a string (as defined by the common C convention).
# • %p The void * pointer argument has to be printed in hexadecimal format.
# • %d Prints a decimal (base 10) number.
# • %i Prints an integer in base 10.
# • %u Prints an unsigned decimal (base 10) number.
# • %x Prints a number in hexadecimal (base 16) lowercase format.
# • %X Prints a number in hexadecimal (base 16) uppercase format.
# • %% Prints a percent sign.

# =================================================================================
# 				*** variadic functions (va_list) in C *** RESUMO ***
# =================================================================================

# va_list é um tipo de dados definido na biblioteca padrão em C que é usado para
# representar uma lista variável de argumentos numa função. Essa lista é composta
# por argumentos que não possuem um tipo fixo e quantidade fixa como os argumentos
# padrão de uma função.

# Quando uma função aceita uma lista variável de argumentos, ela deve ser definida
# com pelo menos um argumento fixo e usar a sintaxe de reticências ... para indicar
# que ela aceita uma lista variável de argumentos. A lista variável de argumentos
# é passada para a função como uma série de valores que podem ser de tipos
# diferentes.

# A macro va_start é usada para inicializar um objeto va_list, que é um ponteiro
# para a lista variável de argumentos. Em seguida, a macro va_arg é usada para
# acessar cada argumento na lista, e a macro va_end é usada para finalizar o uso
# do objeto va_list.

# A sintaxe para declarar uma função que aceita uma lista variável de argumentos
# em C é a seguinte:
# 		retorno nome_da_funcao(argumento_fixo, ...);
# Por exemplo, a função printf em C é declarada como:
#		int printf(const char *format, ...);

# O primeiro argumento format é um argumento fixo que especifica a string de
# formato, e os argumentos subsequentes são uma lista variável de argumentos
# que correspondem aos especificadores de formato na string.

# O tipo va_list é definido no cabeçalho stdarg.h. É um tipo opaco, o que
# significa que a sua implementação exata é deixada para a implementação do
# compilador e não pode ser acessada diretamente pelo programador.

# =================================================================================
# 				*** va_start ***
# =================================================================================

# va_start é uma macro da biblioteca padrão em C que é usada para inicializar
# um objeto de lista variável de argumentos.

# Uma lista variável de argumentos é uma funcionalidade em C que permite que uma
# função aceite um número variável de argumentos. Esses argumentos são acessados
# usando um objeto do tipo va_list.

# A macro va_start é usada para inicializar o objeto va_list que é usado para
# acessar os argumentos variáveis da função. Ela é definida no cabeçalho stdarg.h.

# A sintaxe da macro va_start é a seguinte:

#		void va_start(va_list ap, last_arg);

# O primeiro argumento é um objeto do tipo va_list que será inicializado. O
# segundo argumento é o último argumento fixo da função. va_start é usada para
# iniciar a iteração pelos argumentos variáveis da função, após o último
# argumento fixo.

# É importante notar que a macro va_start deve ser usada antes de acessar
# qualquer argumento variável da função e que cada chamada para va_start
# deve ser correspondida com uma chamada para a macro va_end para liberar
# qualquer recurso alocado pela va_start.

# =================================================================================
# 				*** va_arg ***
# =================================================================================

# va_arg é uma macro da biblioteca padrão em C que é usada para acessar os
# argumentos variáveis de uma função que aceita uma lista variável de argumentos.
# Essa macro é definida no cabeçalho stdarg.h.

# Quando uma função aceita uma lista variável de argumentos, os argumentos são
# passados em uma ordem fixa e o programador precisa iterar sobre a lista de
# argumentos para acessá-los. A macro va_arg é usada para acessar o próximo
# argumento da lista.

# A sintaxe da macro va_arg é a seguinte:

#		type va_arg(va_list ap, type);

# O primeiro argumento ap é um objeto do tipo va_list que foi inicializado usando
# va_start. O segundo argumento type é o tipo do argumento que se deseja acessar
# na lista variável.

# O valor de retorno da macro va_arg é o próximo argumento da lista na posição
# atual do objeto va_list. Após cada chamada para va_arg, o objeto va_list é
# incrementado para apontar para o próximo argumento na lista.

# É importante notar que o programador deve saber de antemão qual é o tipo
# do argumento a ser acessado, pois a macro va_arg não verifica o tipo do
# argumento por si só. Além disso, deve-se tomar cuidado para acessar
# a lista de argumentos na ordem correta e garantir que o número de argumentos
# acessados corresponda ao número de argumentos passados ​​para a função.

# =================================================================================
# 				*** va_copy ***
# =================================================================================

# va_copy é uma macro da biblioteca padrão em C que é usada para copiar um objeto
# do tipo va_list. Essa macro é definida no cabeçalho stdarg.h.

# Quando uma função aceita uma lista variável de argumentos, é comum precisar
# criar uma cópia do objeto va_list para poder iterar sobre os argumentos
# novamente ou passá-los para outra função que aceita uma lista variável de
# argumentos. A macro va_copy é usada para fazer uma cópia segura do objeto
# va_list.

# A sintaxe da macro va_copy é a seguinte:

#		void va_copy(va_list dest, va_list src);

# O primeiro argumento dest é um objeto do tipo va_list que será a cópia do
# objeto src. O segundo argumento src é um objeto do tipo va_list que será
# copiado para o objeto dest.

# É importante notar que a macro va_copy é uma funcionalidade introduzida na
# norma C99 e que nem todos os compiladores podem suportá-la. Além disso, a
# macro va_copy deve ser usada somente após a inicialização do objeto dest com
# va_start, pois esse objeto deve estar preparado para receber os argumentos
# variáveis.

# A macro va_copy é útil em situações onde é necessário trabalhar com a lista
# variável de argumentos mais de uma vez em uma função ou quando uma função
# precisa repassar a lista variável de argumentos para outra função.

# =================================================================================
# 				*** va_end ***
# =================================================================================

# va_end é uma macro da biblioteca padrão em C que é usada para finalizar o uso
# de um objeto va_list. Essa macro é definida no cabeçalho stdarg.h.

# Quando uma função aceita uma lista variável de argumentos, a macro va_start é
# usada para inicializar um objeto va_list, e a macro va_arg é usada para acessar
# cada argumento variável na lista. Após o uso completo dos argumentos, a
# macro va_end é usada para finalizar o uso do objeto va_list e liberar quaisquer
# recursos alocados por va_start.

# A sintaxe da macro va_end é a seguinte:

#		void va_end(va_list ap);

# O argumento ap é um objeto do tipo va_list que foi inicializado usando a
# macro va_start.

# É importante notar que após a chamada para va_end, o objeto va_list não pode
# mais ser usado para acessar argumentos variáveis ​​e qualquer tentativa de fazer
# isso pode levar a comportamentos indefinidos.

# A macro va_end é uma prática comum em C para evitar vazamento de recursos e
# garantir a segurança da memória. É importante garantir que cada chamada para
# va_start seja correspondida com uma chamada para va_end para evitar vazamentos
# de memória ou comportamentos inesperados.