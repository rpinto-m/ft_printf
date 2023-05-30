/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putbase_hex.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rpinto-m <rpinto-m@student.42porto.co      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/05/08 14:12:07 by rpinto-m          #+#    #+#             */
/*   Updated: 2023/05/08 14:12:12 by rpinto-m         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

int	ft_putbase_hex(unsigned long nb, char c)
{
	int		count;
	char	*base;

	count = 0;
	if (c == 'x')
		base = "0123456789abcdef";
	if (c == 'X')
		base = "0123456789ABCDEF";
	if (nb >= 16)
	{
		count += ft_putbase_hex((nb / 16), c);
		count += ft_putbase_hex((nb % 16), c);
	}
	else
		count += write(1, &base[nb], 1);
	return (count);
}

/*#include <stdio.h>
#include <stdlib.h>

int	main()
{
	int a = 9843;
	// %x
	printf("%x\n", a);
  	ft_putbase_hex(a, 'x');
	printf("\n");
	// %X
	printf("%X\n", a);
	ft_putbase_hex(a, 'X');
	printf("\n");

	return(0);
}*/
