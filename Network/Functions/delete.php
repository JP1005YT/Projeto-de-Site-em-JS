<?php
include_once("../cn.php");
$dados = json_decode(file_get_contents('php://input'), true);
if($dados['cod'] === 0){
    $sql = "DELETE FROM $dados[table] WHERE id = $dados[id]";
    $comando = mysqli_query($mysqli,$sql);
}else{
    $sql = "DELETE FROM $dados[table] WHERE id_vend = $dados[id]";
    $comando = mysqli_query($mysqli,$sql);
}
?>  