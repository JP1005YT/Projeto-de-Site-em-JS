<?php
    include_once("../cn.php");
    $dados = json_decode(file_get_contents('php://input'), true);
    if ($dados['table'] == 0) {
        $sql = "INSERT INTO clientes (nome,email,date) VALUES ('$dados[nome]','$dados[email]','$dados[date]')";
    }elseif ($dados['table'] == 1) {
        $sql = "INSERT INTO vendedores (id_vend,nome,email,telefone) VALUES ('$dados[id]','$dados[nome]','$dados[email]','$dados[telefone]')";
    }else{
        $sql = "INSERT INTO produtos (nome,descricao,preco,quantidade,vendedor_id) VALUES ('$dados[nome]','$dados[descricao]','$dados[preco]','$dados[quantidade]','$dados[idvend]')";
    }
    $comando = mysqli_query($mysqli,$sql);
    echo json_encode($comando);
?>