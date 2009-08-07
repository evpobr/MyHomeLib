<?php   
	$dblocation = "127.0.0.1";   
	$dbname = "mynetlib";   
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
		echo "<p>проблемы с БД</p>";   
		exit();   
	} 

	mysql_query("SET NAMES 'utf8';");	
	
	$Folder = @$_POST['Folder'];
	$list = @$_POST['files'];
	
	$Create = @$_GET['Create'];

//		echo $Create;
	
	if ($Create == '1') CreateTable(); 

	for ($k=0;$k<count($list);$k++)
	{
		WriteFile(trim($list[$k]),$Folder,$Net,$Lang);
	}
	mysql_close ($dbcnx); 
 ?>
 <?php
//----------- Create table -------------------------------------------------------
function CreateTable()
{
	$query = "DROP TABLE IF EXISTS `files`;";
	mysql_query($query);

	$query = "CREATE TABLE IF NOT EXISTS `files` (
`Folder` varchar( 40 ) NOT NULL ,
`FileName` varchar( 255 ) NOT NULL ,
PRIMARY KEY ( `FileName` )) ENGINE = InnoDB DEFAULT CHARSET = utf8;";

	mysql_query($query);
	echo 'Таблица создана';
}

//--------------------------------------------------------------------------------
function WriteFile($FileName,$Folder)
{
	$query = "INSERT INTO `files` (`Folder`, `FileName`) VALUES ('".$Folder."','".$FileName."');";
	$q_book = mysql_query($query);
}?>