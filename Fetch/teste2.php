<?php
include_once("cn.php");
$dados = filter_input_array(INPUT_POST, FILTER_DEFAULT);
$sql = "SELECT * FROM teste";
$comando = mysqli_query($mysqli,$sql);
$i = 0;
foreach($comando as $val){
    $rest[$i] = $val;
    $i++;
}
echo json_encode($rest);
?>  