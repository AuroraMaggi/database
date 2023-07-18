<html>
<head>
<title>display articoli e fornitori</title>
</head>
<body>
<form action='' method='post'>
  <button type='submit' formaction="index.html" name='Indietro'>Indietro</button><br><br>
</form>

<?php
    $myconn = mysqli_connect("localhost", "amaggi", "my_amaggi") or die("1.Errore... " . mysqli_error());
    mysqli_select_db($myconn, "my_amaggi") or die("2.Errore... " . mysqli_error($myconn)); 

    $sql = "SELECT * FROM Articoli
    		SELECT FORNITORI.Nome_F, COUNT (Articoli, ID_A) 
    		AS Articoli
    		FROM Articoli 
            LEFT JOIN Articoli ON Articoli.Fornitori = Fornitori.ID_A
            GROUP BY Fornitori.ID_F";
    $rs = mysqli_query($myconn, $sql) or die("3.Errore... " . mysqli_error($myconn));

    $numrows = mysqli_num_rows($rs);
    
    if ($numrows == 0) {
        echo "Database vuoto!";
    } else {
        while ($riga = mysqli_fetch_assoc($rs)) {
            $ID = $riga["ID_A"];
            $Nome = $riga["Nome_A"];
            $PrezzoVendita = $riga["PrezzoVendita"];
            $Quantita = $riga["Quantita"];
            
            echo "Id: <b>" . $ID . "</b>";
            echo " - Nome: <b>" . $Nome . "</b><br/>";
            echo "Prezzo: <b>" . $PrezzoVendita . "</b><br/>";
        }
    }
    
    mysqli_close($myconn);
?>

</body>
</html>
