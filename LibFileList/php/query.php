<?
//  Основной блок 	
//	получение данных книги из базы; общий для всех типов файлов
//	
	$sep=chr(4);
	
	$BookId=$book[0];

	$query = 'select an.LastName, an.FirstName, an.MiddleName from (libavtor ba left outer join libavtoraliase aa on aa.badid = ba.avtorid) join libavtorname an on an.avtorid = COALESCE(aa.goodid, ba.avtorid)
WHERE  ba.bookid='.$BookId.';';

	$avt_out='';
	$q_avtor_id_list = mysql_query($query);
	if ($q_avtor_id_list)
	{
		while ($avtor=mysql_fetch_array($q_avtor_id_list))
			$avt_out=$avt_out.$avtor[0].','.$avtor[1].','.$avtor[2].':';
		$avt_out=$avt_out.$sep;
	}
	
	//---------------------   Добываем список жанров  --------------------------------------------------------------
	$query = 'SELECT G.GenreCode  FROM libgenrelist G, libgenre GL Where GL.BookID = '.$BookId.' AND G.GenreID = GL.GenreId';
	$genre_id_list=mysql_query($query);
	if ($genre_id_list)
	{
		$genres_out='';
		while ($genre_code=mysql_fetch_array($genre_id_list))
			$genres_out=$genres_out.$genre_code[0].':';
	} 
	else 
		$genres_out='other:';	

	//---------------------------   список серий   ------------------------------------------
	$query = 'SELECT S.SeqName, SL.SeqNumb FROM libseqname S, libseq SL Where SL.BookID = '.$BookId.' AND S.SeqID = SL.SeqId';
	$q_seq = mysql_query($query);
	if ($q_seq)
	{
		$seq = mysql_fetch_row($q_seq);
		$seq_out=$seq[0];
		$SeqNumber=$seq[1];
	}	
	else
	{		
		$seq_out='';
		$SeqNumber=0;
	}	

	//---------------------------- все остальное -----------------------------------
	$sdate=substr($book[5],0,strpos($book[5],' '));
		
	if (strlen($avt_out) < 4) $avt_out='неизвестный,автор,:'.$sep;
	
	// SELECT `BookId`,`Title`,`FileSize`,`FileType`,`Deleted`,`Time`,`Lang`,`N`,`keywords`	
			
	//      авторы ;    жанры ;        название ;        серия ;         номер в серии
	$out = $avt_out.$genres_out.$sep.$book[1].$sep.$seq_out.$sep.$SeqNumber;
	//       имя файла;         размер файла;          LibId;               Deleted
	$out.=$sep.$FileName.$sep.$book[2].$sep.$book[0].$sep.$book[4];
	//          тип файла ;              дата;       язык    N   keywords
	$out.=$sep.$Ext.$sep.$sdate.$sep.$book[6].$sep.$book[7].$sep.$book[8].$sep;
		
	$out = str_replace(chr(13),'',$out);
	$out = str_replace(chr(10),'',$out);
		
	echo $out; //.chr(13).chr(10);
?>

