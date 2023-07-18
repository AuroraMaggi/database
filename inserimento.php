<html>
<head><title> Inserimento </title></head>
<body>
<form action='' method='post'>
  <button type='submit' formaction="index.html" name='Indietro'>Indietro</button>
  <input formaction="display_tab_articoli.php" name="visual" type="submit" value="Visualizza" />
</form>

<?php
	$myconn= new mysqli("localhost","amaggi"," ","my_amaggi");
    if($myconn->connect_errno){
    	echo "Errore";
        exit();
    }
    $sql="INSERT INTO Articoli(ID_A,Nome_A,PrezzoVendita)
    VALUES ('$_POST[ID]', '$_POST[Nome]', '$_POST[PrezzoVendita]')";
    if (mysqli_query($myconn, $sql)) {
      echo "Nuovo record creato con successo!";
    } else {
      echo "Errore: " . $sql . "<br>" . mysqli_error($myconn);
    }
	mysqli_close($myconn);
?>
</body>
</html>
