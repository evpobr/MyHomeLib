<?php
	include('connect_db.php');
	
	mysql_query("SET NAMES 'utf8';");	
	$Start = @$_GET['Start'];
	$query = 'SELECT `BookId`,`Title`,`FileSize`,`FileType`,`Deleted`,`Time`,`Lang`,`N`,`keywords` FROM libbook WHERE BookId>='.$Start.' AND FileType="fb2" ';
	$q_book_list = mysql_query($query);
	while ($book = mysql_fetch_array($q_book_list))
	{
		$FileName = $book[0];
		$Ext = 'fb2';
		include('query.php');
	}
?>