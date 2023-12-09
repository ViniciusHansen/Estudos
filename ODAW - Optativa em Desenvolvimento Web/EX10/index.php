<?php

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $texto = $_POST['texto'];
    $senha = $_POST['senha'];
    $acao = $_POST['acao'];

    $erro = "";
    if (empty($texto)) $erro .= "E-mail não preenchido.<br>";
    if (empty($senha)) $erro .= "Senha não preenchida.<br>";
    if (!filter_var($texto, FILTER_VALIDATE_EMAIL)) {
        $erro .= "E-mail inválido.<br>";
    }

    if ($acao == "cadastrar" && !$erro) {
        // Cifra a senha e salva junto com o e-mail
        $senhaCifrada = password_hash($senha, PASSWORD_DEFAULT);
        file_put_contents('autenticacao.txt', "$texto:$senhaCifrada\n", FILE_APPEND);
        echo "Usuário cadastrado com sucesso!";
    } elseif ($acao == "login") {
        $linhas = file('autenticacao.txt');
        $loginValido = false;
        foreach ($linhas as $linha) {
            list($u, $s) = explode(':', trim($linha));
            if ($u == $texto && password_verify($senha, $s)) {
                $loginValido = true;
                break;
            }
        }
        if (!$loginValido) {
            $erro .= "Falha no login.";
        } else {
            echo "Login bem-sucedido!";
        }
    }

    if ($erro) {
        echo $erro;
    }
}
?>

<form action="index.php" method="post">
    E-mail: <input type="text" name="texto"><br>
    Senha: <input type="password" name="senha"><br>
    <input type="submit" name="acao" value="cadastrar">
    <input type="submit" name="acao" value="login">
</form>
