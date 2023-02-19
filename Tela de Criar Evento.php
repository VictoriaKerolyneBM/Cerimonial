<?php
    $servername = "localhost:3306";
    $database = "cerimonial";
    $username = "root";
    
    $conn = mysqli_connect($servername, $database,$username);
    
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    }else{
        $nome = $_POST("nome");
        $Agendamento = $_POST("data");

        $banco = mysql_select_db("cliente",$conn);
        $Agendamentobd = mysql_select_db("agendamento",$conn);

        $a = "INSERT INTO 'cliente'('nome') VALUE ('$nome')";
        $b = "INSERT INTO 'agendamento'('dataAgendamento') VALUE ('$Agendamento')";
        mysql_query($a,$conn);
        mysql_query($b,$conn);
        echo "<center><br><br>Registro OK!";
    }
?>