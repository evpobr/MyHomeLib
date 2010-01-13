<?php   
// получение usr
	include('connect_db.php');

	$list = $_POST['files'];
	$Extentions = $_POST['extentions']; 
	
	for ($k=0;$k<count($list);$k++)
	{
//		$FileName = str_replace(chr(10),'',trim($list[$k]));
		$FileName = $list[$k];
		$Ext = $Extentions[$k]; 
		$query = 'SELECT B.BookId, B.Title, B.FileSize, B.FileType, B.Deleted, B.Time, B.Lang, B.N, B.KeyWords, F.FileName FROM libbook B, libfilename F WHERE B.BookId = F.BookID AND F.FileName = "'.$FileName.'.'.$Ext.'";';
		$q_book = mysql_query($query);
		if ($q_book)
		{
			$book = mysql_fetch_row($q_book);
			include('query.php');
		}
	}
	mysql_close ($dbcnx); 
 ?>
