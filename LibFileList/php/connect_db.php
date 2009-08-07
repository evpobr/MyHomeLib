<?
	$dblocation = "127.0.0.1";   
	$dbname = "librusec";   
	$dbuser = "root";   
	$dbpasswd = "2def1234";   

	$dbcnx = mysql_connect($dblocation, $dbuser, $dbpasswd);   
	if (!$dbcnx)   
	{   
		echo "<p>не удалось подключиться к mySQL</p>";   
		exit();   
	}   
	if (!mysql_select_db($dbname,$dbcnx) )   
	{   
		echo "<p>Проблемы с БД  :-(</p>";   
		exit();   
	}

	mysql_query("SET NAMES 'utf8';");	
?>