/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putnbr.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rpinto-m <rpinto-m@student.42porto.co      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/05/08 11:25:44 by rpinto-m          #+#    #+#             */
/*   Updated: 2023/05/08 11:38:33 by rpinto-m         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

int	ft_putnbr(long nb)
{
	int	count;

	count = 0;
	if (nb == -2147483648)
	{
		count += write (1, "-2147483648", 11);
	}
	else if (nb < 0)
	{
		count += ft_putchar('-');
		nb = -1 * nb;
		count += ft_putnbr(nb);
	}
	else if (nb >= 10)
	{
		count += ft_putnbr(nb / 10);
		count += ft_putnbr(nb % 10);
	}
	else
		count += ft_putchar(nb + '0');
	return (count);
}
