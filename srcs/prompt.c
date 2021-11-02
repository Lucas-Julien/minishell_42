/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   prompt.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ljulien <ljulien@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/05/05 16:24:41 by ljulien           #+#    #+#             */
/*   Updated: 2021/11/02 21:27:02 by ljulien          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minishell.h"

char	*cur_dir_name(void)
{
	int		size;
	char	*buf;

	size = 50;
	buf = malloc(sizeof(char) * size);
	while (getcwd(buf, size) == NULL)
	{
		size += 50;
		free(buf);
		buf = malloc(sizeof(char) * size);
	}
	return (buf);
}

void	handle_prompt_heredoc(void)
{
	write(1, "> ", 2);
}
