/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.h                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rpinto-m <rpinto-m@student.42porto.co      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/04/27 11:55:02 by rpinto-m          #+#    #+#             */
/*   Updated: 2023/05/09 10:53:02 by rpinto-m         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef FT_PRINTF_H
# define FT_PRINTF_H

# include <stdarg.h>
# include <unistd.h>
# include <stdlib.h>

int		ft_printf(const char *str, ...);
int		ft_putbase_hex(unsigned long nb, char c);
int		ft_putunbr(unsigned int nb);
int		ft_putstr(char *s);
int		ft_putpointer(unsigned long nb);
int		ft_putnbr(long nb);
int		ft_putchar(int c);
int		ft_check(const char *str, va_list pf);

#endif
