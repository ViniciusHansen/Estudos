<?php
    function manipulaDados($string, $array) {
        // Manipulação de String
        $stringReversa = strrev($string);

        // Manipulação de Array
        $primeiroItem = array_shift($array);

        return "String Reversa: $stringReversa e Primeiro Item do Array: $primeiroItem";
    }

    $exemploString = "teste";
    $exemploArray = ["maçã", "banana", "cereja"];
    echo manipulaDados($exemploString, $exemploArray);
?>

