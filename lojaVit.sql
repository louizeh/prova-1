-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 07/05/2019 às 11:58
-- Versão do servidor: 10.1.38-MariaDB
-- Versão do PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `lojaVit`
--
CREATE DATABASE IF NOT EXISTS `lojaVit` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `lojaVit`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Clientes`
--

CREATE TABLE `Clientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `celular` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `numero` int(11) NOT NULL,
  `complemento` varchar(50) NOT NULL,
  `bairro` varchar(100) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `cep` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `Clientes`
--

INSERT INTO `Clientes` (`id`, `nome`, `telefone`, `celular`, `email`, `endereco`, `numero`, `complemento`, `bairro`, `cidade`, `cep`) VALUES
(0, 'JOSIVAL', '2525-1541', '9861-5166', 'josival78@gmail.com', 'pai eterno', 200, 'casa', 'eternidade', 'saranda', '1234567891'),
(44, 'lima barreto', '4002-8002', '4002-8922', 'lima200@gmail.com', 'av. araguaia', 20, 'casa', 'primavera', 'terra do nunca', '12354789'),
(55, 'elimar gonzalez', '44444-5555', '66666-9997', 'elimar23@gmail.com', 'venezuela', 89, 'apartamento', 'espanhol', 'saranda', '45612789');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text NOT NULL,
  `valor_venda` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Vendas`
--

CREATE TABLE `Vendas` (
  `id` int(11) NOT NULL,
  `data_venda` date NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_vendedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `Vendas_itens`
--

CREATE TABLE `Vendas_itens` (
  `id` int(11) NOT NULL,
  `id_vendas` int(11) NOT NULL,
  `id_produtos` int(11) NOT NULL,
  `quantidade` decimal(12,2) NOT NULL,
  `valor_unitario` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendedores`
--

CREATE TABLE `vendedores` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `celular` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `perc_comissao` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `Clientes`
--
ALTER TABLE `Clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `Vendas`
--
ALTER TABLE `Vendas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_cliente` (`id_cliente`),
  ADD KEY `fk_id_vendedor` (`id_vendedor`);

--
-- Índices de tabela `Vendas_itens`
--
ALTER TABLE `Vendas_itens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_produtos` (`id_produtos`),
  ADD KEY `fk_vendas` (`id_vendas`);

--
-- Índices de tabela `vendedores`
--
ALTER TABLE `vendedores`
  ADD PRIMARY KEY (`id`);

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `Vendas`
--
ALTER TABLE `Vendas`
  ADD CONSTRAINT `fk_id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `Clientes` (`id`),
  ADD CONSTRAINT `fk_id_vendedor` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedores` (`id`);

--
-- Restrições para tabelas `Vendas_itens`
--
ALTER TABLE `Vendas_itens`
  ADD CONSTRAINT `fk_id_produtos` FOREIGN KEY (`id_produtos`) REFERENCES `produtos` (`id`),
  ADD CONSTRAINT `fk_vendas` FOREIGN KEY (`id_vendas`) REFERENCES `Vendas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
