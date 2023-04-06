<?php
include_once("cn.php");
$dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
$sql = "INSERT INTO teste (nome,codigo) VALUES ('$dados[test]','$dados[cod]')";
print_r($dados)
// $retorna = ['teste' => true,'test' => $dados['test']];
// $comando = mysqli_query($mysqli,$sql);
// if(mysqli_insert_id($mysqli))
//        {
//         echo json_encode("Dados Perdidos");
//        }
//        else
//        {
//         echo json_encode("Dados Cadastrados");
//         }

?>  