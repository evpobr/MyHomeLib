<?php   
	include('connect_db.php');	
	$list = $_POST['files'];
	
	for ($k=0;$k<count($list);$k++)
	{
		$FileName = $list[$k];
		$Ext = 'fb2';
		$query = 'SELECT `BookId`,`Title`,`FileSize`,`FileType`,`Deleted`,`Time`,`Lang`,`N`,`keywords` FROM libbook WHERE BookId='.$FileName.';';
		$q_book = mysql_query($query);
		if ($q_book)
		{
			$book = mysql_fetch_row($q_book);
			include('query.php');
		}	
	}
	mysql_close ($dbcnx); 
 ?>