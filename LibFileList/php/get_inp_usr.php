<?php   
	include('connect_db.php');
	
	//$Folder = @$_POST['Folder'];
	$list = $_POST['files'];
	
	for ($k=0;$k<count($list);$k++)
	{
		$FileName = str_replace(chr(10),'',trim($list[$k]);
		$query = 'SELECT `BookID` FROM `libfilename` WHERE `FileName` = "'.$FileName.'";';
		$q_file = mysql_query($query);
		if ($q_file)
		{
			$file = mysql_fetch_row($q_file);
			$ID=$file[0];
			if ($ID > 0) 
				$query = 'SELECT `BookId`,`Title`,`FileSize`,`FileType`,`Deleted`,`Time`,`Lang`,`N`,`KeyWords` FROM libbook WHERE BookId='.$ID.';';
		}
		$q_book = mysql_query($query);
		if ($q_book)
		{
			$book = mysql_fetch_row($q_book);
			include('query.php');
		}
	}
	mysql_close ($dbcnx); 
 ?>
