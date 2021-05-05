-- 1
select usuario.idusuario, usuario.nome, acesso.idacesso, acesso.data, acesso.hora, episodio.idepisodio, episodio.nome, episodio.numero, episodio.temporada from usuario join acesso on usuario.idusuario = acesso.idusuario join episodio on episodio.idepisodio = acesso.idepisodio where data between '01/07/2016' and '31/07/2016' order by usuario.nome, episodio.idepisodio;
-- 2
select usuario.idusiario, usuario.nome, usuario.email, count(episodio.idepisodio) as contador, max(contador) from usuario left join acesso on usuario.idusuario = acesso.idusuario left join episodio on episodio.idepisodio = acesso.idepisodio group by usuario.idusiario, usuario.nome, usuario.email;
-- 3
select episodio.temporada, sum(datediff(minute, "0:00:00", episodio.duracao)) from episodio group by episodio.temporada;
-- 4
select usuario.nome, usuario.email from usuario join acesso on usuario.idusuario = acesso.idusuario where count(acesso.idusuario) = 6;
-- 5
select episodio.temporada, count(episodio.idepisodio), count(acesso.idacesso), count(acesso.idusuario) from episodio join acesso on episodio.idepisodio = acesso.idepisodio group by episodio.temporada;