<?php
    include_once("../cn.php");
    $dados = json_decode(file_get_contents('php://input'), true);
    if ($dados['table'] == 0) {
        $sql = "INSERT INTO clientes (cli_nome,email,date) VALUES ('$dados[nome]','$dados[email]','$dados[date]')";
    }elseif ($dados['table'] == 1) {
        $sql = "INSERT INTO vendedores (id_vend,nome,email,telefone) VALUES ('$dados[id]','$dados[nome]','$dados[email]','$dados[telefone]')";
    }elseif ($dados['table'] == 2){
        $sql = "INSERT INTO produtos (pro_nome,descricao,preco,quantidade,vendedor_id) VALUES ('$dados[nome]','$dados[descricao]','$dados[preco]','$dados[quantidade]','$dados[idvend]')";
    }else{
        $sql = "INSERT INTO vendas (cliente_id,produto_quant,venda_valor,pro_cod,data_venda) VALUES ('$dados[cliente_id]','$dados[produto_quant]','$dados[venda_valor]','$dados[pro_cod]','$dados[data_venda])')";
    }
    $comando = mysqli_query($mysqli,$sql);
    echo json_encode($comando);
?>