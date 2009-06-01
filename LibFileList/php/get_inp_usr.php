<?php   
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
		echo "<p>проблемы с БД</p>";   
		exit();   
	} 

	mysql_query("SET NAMES 'utf8';");	
	
	$Folder = @$_POST['Folder'];
	$list = $_POST['files'];
	
	for ($k=0;$k<count($list);$k++)
	{
		WriteFile(trim($list[$k]),$Folder);
	}
	mysql_close ($dbcnx); 
 ?>
 <?php 
//--------------------------------------------------------------------------------
function WriteFile($FileName,$Folder)
{
	$sep=chr(4);
    $FileName = str_replace(chr(10),'',$FileName);

	$query = 'SELECT `BookID` FROM `libfilename` WHERE `FileName` = "'.$FileName.'";';

	$q_file = mysql_query($query);
	if ($q_file)
	{
		$file = mysql_fetch_row($q_file);
		$ID=$file[0];
		if ($ID > 0) 
			$query = 'SELECT `BookId`,`Title`,`FileSize`,`FileType`,`Deleted`,`Time` FROM libbook WHERE BookId='.$ID.';';
	}

	$q_book = mysql_query($query);
	if ($q_book)
	{
		$book = mysql_fetch_row($q_book);
		$BookId=$book[0];

		$query = 'SELECT `AvtorId` FROM `libavtor` WHERE  BookId='.$BookId.';';
		$q_avtor_id_list = mysql_query($query);
		if ($q_avtor_id_list)
		{
			$avt_out='';
			while ($avtor_id=mysql_fetch_array($q_avtor_id_list))
			{
				$good_author_id=$avtor_id[0];
				$query = 'SELECT `GoodId`,`BadId` FROM libavtoraliase WHERE BadId='.$good_author_id.';';
				$q_bad_avtor = mysql_query($query);
				if ($q_bad_avtor)
				{
					$good_author = mysql_fetch_row($q_bad_avtor);
					if ($good_author[0]<>'')
					{ 
						$good_author_id=$good_author[0];
							echo "Bad: ".$good_author[1]."    Good: ".$good_author[0]."<br>";
						}
				} 
				$query = 'SELECT `FirstName`,`MiddleName`,`LastName` FROM libavtorname WHERE AvtorId='.$good_author_id.';';
				$q_avtor = mysql_query($query);
				if ($q_avtor)
				{
					$author = mysql_fetch_row($q_avtor);
					$avt_out=$avt_out.$author[2].','.$author[0].','.$author[1].':';
				}	
			}
			$avt_out=$avt_out.$sep;
		}
		//---------------------   Добываем список жанров  --------------------------------------------------------------
		$query = 'SELECT GenreID FROM libgenre WHERE  BookId='.$BookId.';';
		$genre_id_list=mysql_query($query);
		if ($genre_id_list)
		{
			$genres_out='';
			while ($genre_id=mysql_fetch_array($genre_id_list))
			{
				$query = 'SELECT GenreCode FROM libgenrelist WHERE GenreId='.$genre_id[0].';';
				$q_gen = mysql_query($query);
				if ($q_gen)
				{
					$genre=mysql_fetch_row($q_gen);
					$genres_out=$genres_out.$genre[0].':';
				}	
			}
		} 
		else $genres_out='other:';	
		//---------------------------   список серий   ------------------------------------------
		$query = 'SELECT `SeqId`,`SeqNumb` FROM libseq WHERE BookId='.$BookId.';';
		$q_seq = mysql_query($query);
		if ($q_seq)
		{
			$seq = mysql_fetch_row($q_seq);
			$SeqNumber=$seq[1];
			
			$query = 'SELECT SeqName FROM libseqname WHERE SeqId='.$seq[0].';';
			$q_seq_name = mysql_query($query);
			if ($q_seq_name)
			{
				$seq_name = mysql_fetch_row($q_seq_name);
				$seq_out=$seq_name[0];
			}	
		}	
		else
		{		
			$seq_out='';
			$SeqNumber=0;
		}	
		//---------------------------- все остальное -----------------------------------
		$sdate=substr($book[5],0,strpos($book[5],' '));
		
		if (strlen($avt_out) < 4) $avt_out='неизвестный,автор,:'.$sep;
		if ($Lang) 
				$LangStr = $book[6].$sep;
			else
				$LangStr = '';
		
        $ext = strtolower(array_pop(explode(".", $FileName)));
		
		$FileName = substr($FileName, 0 ,  strlen($FileName) - strlen($ext) - 1);
		
		// SELECT BookId,Title,FileSize,FileType,Deleted,Time	
			
		//      авторы ;    жанры ;        название ;        серия ;         номер в серии
		$out = $avt_out.$genres_out.$sep.$book[1].$sep.$seq_out.$sep.$SeqNumber;
		//       имя файла;         размер файла;          LibId;               Deleted
		$out.=$sep.$FileName.$sep.$book[2].$sep.$book[0].$sep.$book[4];
		//          тип файла ;              дата;       язык
		$out.=$sep.$ext.$sep.$sdate.$sep.$LangStr;
		echo $out.chr(13).chr(10);
	}
}?>