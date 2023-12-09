<?php
    session_start();

    // Criando um Cookie que expira em uma hora
    setcookie("usuario", "teste", time() + 3600);

    // Criando uma variável de sessão
    $_SESSION["logado"] = true;

    echo "Valor do Cookie 'usuario': " . $_COOKIE["usuario"] . "<br>";
    echo "Usuário está logado? " . ($_SESSION["logado"] ? "Sim" : "Não");
?>

