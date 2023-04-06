<?php
include_once("../cn.php");
$dados = json_decode(file_get_contents('php://input'), true)['table'];
$sql = "SELECT * FROM $dados";
$comando = mysqli_query($mysqli,$sql);
$i = 0;
foreach($comando as $val){
    $rest[$i] = $val;
    $i++;
}
echo json_encode($rest);
?>  