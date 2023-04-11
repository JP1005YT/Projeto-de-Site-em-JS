<?php
    include_once("../cn.php");
    $dados = json_decode(file_get_contents('php://input'), true);
    if ($dados['table'] == 'clientes') {
        $sql = "UPDATE $dados[table] set nome = '$dados[nome]',email = '$dados[email]',date = '$dados[date]' where id = $dados[id]";
    }elseif ($dados['table'] == 'vendedores') {
        if($dados['cod'] == 1){
            $sql = "UPDATE $dados[table] set nome = '$dados[nome]',email = '$dados[email]',telefone = '$dados[telefone]' where id_vend = $dados[id]";
        }else{
            $sql = "UPDATE $dados[table] set nome = '$dados[nome]',email = '$dados[email]',telefone = '$dados[telefone]' where id = $dados[id]";
        }
    }else{
        if($dados['cod'] != 1){
            $sql = "UPDATE $dados[table] set pro_nome = '$dados[nome]',descricao = '$dados[descricao]',preco = '$dados[preco]',quantidade = '$dados[quantidade]',vendedor_id = '$dados[vendedor_id]' where id = $dados[id]";
        }else{
            $sql = "UPDATE $dados[table] set quantidade = '$dados[quantidade]' where id = $dados[id]";
        }
    }
    $comando = mysqli_query($mysqli,$sql);
    echo json_encode($comando);
?>  