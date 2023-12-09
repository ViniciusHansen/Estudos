<?php
    $arquivo = "contador.txt";
    $contador = 0;

    if (file_exists($arquivo)) {
        $contador = file_get_contents($arquivo);
    }

    $contador++;

    file_put_contents($arquivo, $contador);

    echo "Esta página foi visitada $contador vezes";
?>

