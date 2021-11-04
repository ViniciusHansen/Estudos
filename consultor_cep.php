<meta charset="utf-8">
<h1>Pesquisar Endereço</h1>
<form action="" method="post">
  <input type="text" name="cep">
  <button type="submit">Busca de Cep</button>
</form>

<h2>Resultado da busca:<h2>

<?php
function get_endereco($cep){
	$cep = preg_replace("/[^0-9]/", "", $cep);
	$url = "http://viacep.com.br/ws/{$cep}/json/";
	$json = file_get_contents($url);
	$data = json_decode($json);
	return $data;
}


session_start();
if (isset($_POST['cep']) || empty($_POST['cep'])) {
	$cep = $_POST['cep'];
	$endereco = get_endereco($cep);
	$_SESSION['cep'][$cep]['logradouro'] = (string) $endereco->logradouro;
	$_SESSION['cep'][$cep]['bairro'] = (string) $endereco->bairro;
	$_SESSION['cep'][$cep]['localidade'] = (string) $endereco->localidade;
	$_SESSION['cep'][$cep]['cep'] = (string) $cep;

# juntar os dados em um array de arrays
$array_cep = Array();
foreach ($_SESSION['cep'] as $index => $arrValores) {
	if (empty($arrValores['cep'])) {
		continue;
	}
	array_push($array_cep, array(
		'cep' => $arrValores['cep'],
		'logradouro' => $arrValores['logradouro'],
		'bairro' => $arrValores['bairro'],
		'localidade' => $arrValores['localidade']
	));
}

# ordenar os arrays pelo elemento: 'logradouro' ou 'bairro'
usort($array_cep, function($a, $b) {
	return $a['logradouro'] <=> $b['logradouro'];
	// return $a['bairro'] <=> $b['bairro'];
});

# print
foreach ($array_cep as $arrValores) {
	echo "CEP: {$arrValores['cep']} </br>" ;
	echo "Logradouro: {$arrValores['logradouro']}</br>";
	echo "Bairro: {$arrValores['bairro']}</br>";
	echo "Localidade: {$arrValores['localidade']}</br>";
	echo "<br>";
}
}

// limpar o cache:
	// session_destroy();

// ceps testados:
	// 89259000
	// 89210770
	// 89223215

?>
