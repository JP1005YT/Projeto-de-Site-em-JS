-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 10-Abr-2023 às 04:30
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `banco`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `cli_nome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `date` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id`, `cli_nome`, `email`, `date`) VALUES
(1, 'João Silva', 'joao.silva@example.com', '2022-03-28'),
(2, 'Maria Santos', 'maria.santos@example.com', '2022-03-28'),
(3, 'Pedro Oliveira', 'pedro.oliveira@example.com', '2022-03-27'),
(4, 'Ana Souza', 'ana.souza@example.com', '2022-03-26'),
(5, 'Lucas Pereira', 'lucas.pereira@example.com', '2022-03-25');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `pro_nome` varchar(255) NOT NULL,
  `descricao` text DEFAULT NULL,
  `preco` decimal(10,2) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `vendedor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id`, `pro_nome`, `descricao`, `preco`, `quantidade`, `vendedor_id`) VALUES
(1, 'Camiseta Branco', 'Camiseta branca de algodão', '29.99', 50, 1234),
(2, 'Calça Jeans', 'Calça jeans azul clara', '89.90', 30, 1234),
(3, 'Sapato Social', 'Sapato social preto de couro', '199.99', 20, 4321),
(4, 'Vestido Estampado', 'Vestido curto estampado', '69.99', 40, 5678),
(5, 'Camisa Polo', 'Camisa polo listrada', '49.99', 60, 9876);

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

CREATE TABLE `vendas` (
  `id_venda` int(4) NOT NULL,
  `cliente_id` int(4) NOT NULL,
  `produto_quant` int(10) NOT NULL,
  `venda_valor` double(50,2) NOT NULL,
  `pro_cod` int(4) NOT NULL,
  `data_venda` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `vendas`
--

INSERT INTO `vendas` (`id_venda`, `cliente_id`, `produto_quant`, `venda_valor`, `pro_cod`, `data_venda`) VALUES
(10, 1, 2, 179.80, 2, '2023-04-09');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendedores`
--

CREATE TABLE `vendedores` (
  `id_vend` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `vendedores`
--

INSERT INTO `vendedores` (`id_vend`, `nome`, `email`, `telefone`) VALUES
(1234, 'Maria Silva', 'maria.silva@email.com', '(11) 1111-1111'),
(4321, 'Pedro Souza', 'pedro.souza@email.com', '(33) 3333-3333'),
(5678, 'João Santas', 'joao.santos@email.com', '(22) 2222-2222'),
(8765, 'Ana Oliveira', 'ana.oliveira@email.com', '(44) 4444-4444'),
(9692, 'João Pedro', 'jpgarciagirotto12@gmail.com', '18991238584'),
(9876, 'Lucas Martins', 'lucas.martins@email.com', '(55) 5555-5555');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_vendedor_id` (`vendedor_id`);

--
-- Índices para tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`id_venda`);

--
-- Índices para tabela `vendedores`
--
ALTER TABLE `vendedores`
  ADD PRIMARY KEY (`id_vend`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `id_venda` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `fk_vendedor_id` FOREIGN KEY (`vendedor_id`) REFERENCES `vendedores` (`id_vend`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
