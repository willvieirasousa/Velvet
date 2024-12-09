-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26/11/2024 às 19:26
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `velvet`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `administrador`
--

CREATE TABLE `administrador` (
  `id_administrador` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `senha` varchar(10) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `administrador`
--

INSERT INTO `administrador` (`id_administrador`, `nome`, `email`, `senha`, `status`) VALUES
(1, 'aa', 'adm@gmail.com', '123', 1),
(2, 'ANA', 'aaa@gmail.com', '123', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `avaliacoes`
--

CREATE TABLE `avaliacoes` (
  `id_avaliacoes` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `comentario` varchar(150) DEFAULT NULL,
  `estrela` int(1) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `avaliacoes`
--

INSERT INTO `avaliacoes` (`id_avaliacoes`, `id_pedido`, `id_cliente`, `comentario`, `estrela`, `data`) VALUES
(1, 1, 1, 'Ótimo produto, recomendo!', 5, '2024-11-11'),
(2, 2, 2, 'Entrega rápida e produto de qualidade.', 4, '2024-11-12'),
(3, 3, 3, 'Produto bom, mas demorou para chegar.', 3, '2024-11-13'),
(4, 4, 4, 'Produto com defeito, precisei devolver.', 1, '2024-11-14'),
(5, 5, 5, 'Muito bom, gostei bastante.', 5, '2024-11-15'),
(6, 6, 6, 'Poderia ser melhor embalado.', 3, '2024-11-16'),
(7, 7, 7, 'Gostei muito, excelente qualidade.', 5, '2024-11-17'),
(8, 8, 8, 'Produto cancelado, não avaliado.', 0, '2024-11-18'),
(9, 9, 9, 'Atendimento muito bom, produto excelente.', 4, '2024-11-19'),
(10, 10, 10, 'Produto dentro do esperado.', 4, '2024-11-20');

-- --------------------------------------------------------

--
-- Estrutura para tabela `carrinho`
--

CREATE TABLE `carrinho` (
  `id_carrinho` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `email_cliente` varchar(30) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `carrinho`
--

INSERT INTO `carrinho` (`id_carrinho`, `id_produto`, `email_cliente`, `quantidade`, `total`) VALUES
(113, 4, 'sas@gagaga', 1, 230),
(116, 52, 'bb@gmail.com', 1, 250);

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `categoria` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `categoria`) VALUES
(1, 'Lancamentos'),
(2, 'Promoções'),
(3, 'Masculino'),
(4, 'Feminino'),
(5, 'Aromas'),
(6, 'Neutros'),
(7, 'Cítricos');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cidade`
--

CREATE TABLE `cidade` (
  `id_cidade` int(11) NOT NULL,
  `nomeCidade` varchar(100) NOT NULL,
  `sigla` varchar(10) NOT NULL,
  `id_estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefone` varchar(12) DEFAULT NULL,
  `dataNascimento` varchar(14) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `criacao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nome`, `cpf`, `email`, `telefone`, `dataNascimento`, `senha`, `criacao`) VALUES
(4, 'Diego Souza', '45678901234', 'diego@gmail.com', '4444444444', '1988-04-', 'senha456', NULL),
(5, 'Elaine Lopes', '56789012345', 'elaine@gmail.com', '5555555555', '1995-05-', 'senha567', NULL),
(6, 'Fernando Lima', '67890123456', 'fernando@gmail.com', '6666666666', '1993-06-', 'senha678', NULL),
(7, 'Gabriela Silva', '78901234567', 'gabriela@gmail.com', '7777777777', '1991-07-', 'senha789', NULL),
(8, 'Henrique Oliveira', '89012345678', 'henrique@gmail.com', '8888888888', '1994-08-', 'senha890', NULL),
(9, 'Isabela Castro', '90123456789', 'isabela@gmail.com', '9999999999', '1990-09-', 'senha901', NULL),
(10, 'João Pereira', '01234567890', 'joao@gmail.com', '1010101010', '1989-10-', 'senha012', NULL),
(11, 'ww', '123456', 'a@gmail.comm', '1212', '2024-11-', 'pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=', NULL),
(12, 'aaaa', '123456', 'sas@gagaga', '333333', '2024-11-10', 'pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=', NULL),
(13, 'aa', '122333', 'teste@email.com', '112333322', '2024-10-', 'pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=', NULL),
(14, 'aaaaa', '123456', 'anabeatrizstt10@gmail.com', '333333', '2024-11-', 'pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=', NULL),
(15, 'ANA BEATRIZ', '2222222222', 'bb@gmail.com', '1989302298', '2024-11-15', 'pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cupomdesconto`
--

CREATE TABLE `cupomdesconto` (
  `id_cupom_desconto` int(11) NOT NULL,
  `cod_cupom` varchar(100) NOT NULL,
  `valor` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cupomdesconto`
--

INSERT INTO `cupomdesconto` (`id_cupom_desconto`, `cod_cupom`, `valor`) VALUES
(1, 'BIA10', 12);

-- --------------------------------------------------------

--
-- Estrutura para tabela `endereco`
--

CREATE TABLE `endereco` (
  `id_endereco` int(11) NOT NULL,
  `cidade` varchar(20) NOT NULL,
  `id_clientes` int(11) NOT NULL,
  `logradouro` varchar(50) NOT NULL,
  `bairro` varchar(30) NOT NULL,
  `cep` varchar(9) NOT NULL,
  `numero` varchar(50) NOT NULL,
  `complemento` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `endereco`
--

INSERT INTO `endereco` (`id_endereco`, `cidade`, `id_clientes`, `logradouro`, `bairro`, `cep`, `numero`, `complemento`) VALUES
(1, '1', 1, 'ww2w', 'Jardim Guanhembu', '04814500', '123', 'dqdqdqd'),
(2, '1', 1, 'ww2w', 'Jardim Guanhembu', '04814500', '123', 'dqdqdqd'),
(3, '1', 1, 'ww2w', 'Jardim Guanhembu', '04814500', '123', 'dqdqdqd'),
(4, '1', 1, 'ww2w', 'Jardim Guanhembu', '04814500', '123', 'dqdqdqd'),
(5, '1', 1, 'fefe', 'feefe', '04814550', '123', 'feff'),
(6, '1', 1, 'fefe', 'feefe', '04814550', '123', 'feff'),
(7, '1', 1, 'fefe', 'feefe', '04814550', '123', 'feff'),
(8, '1', 1, 'fefe', 'feefe', '04814550', '123', 'feff'),
(9, '1', 1, 'fefe', 'feefe', '04814550', '123', 'feff'),
(10, '1', 1, 'fefe', 'feefe', '04814550', '123', 'feff'),
(11, '1', 1, 'fefe', 'feefe', '04814550', '123', 'feff'),
(12, '1', 1, 'fefe', 'feefe', '04814550', '123', 'feff'),
(13, '1', 1, 'fefe', 'feefe', '04814550', '123', 'feff'),
(14, '1', 1, 'fefe', 'feefe', '04814550', '123', 'feff'),
(15, '1', 1, 'fefe', 'feefe', '04814550', '123', 'feff'),
(16, '1', 1, 'dwdww', 'asasa', '04814550', '123', 'wfcwwc'),
(17, '1', 1, 'dwdww', 'asasa', '04814550', '123', 'wfcwwc'),
(18, '1', 1, 'dwdww', 'asasa', '04814550', '123', 'wfcwwc'),
(19, '2', 1, 'sddw', 'swsw', '04814550', '121', 'asasas'),
(20, '2', 1, 'sddw', 'swsw', '04814550', '121', 'asasas'),
(21, '2', 1, 'sddw', 'swsw', '04814550', '121', 'asasas'),
(22, '1', 1, 'dwdww', 'swsw', '04814550', '11', '123'),
(23, '1', 1, 'dwdww', 'swsw', '04814550', '11', '123'),
(24, '1', 2, 'ww2w', 'swsw', '04814550', '1123', 'wfcwwc'),
(25, '2', 2, 'asas', 'Jardim Guanhembu', '04814550', '121', '123'),
(26, '1', 1, 'ww2w', 'dwdde', '04814550', '123', '123'),
(27, '1', 1, 'ww2w', 'dwdde', '04814550', '123', '123'),
(28, '1', 1, 'fefe', 'wqsq', '04814550', '123', '123'),
(29, '1', 1, 'ww2w', 'Jardim Guanhembu', '04814500', '121', 'wdw'),
(30, '1', 1, 'ww2w', 'Jardim Guanhembu', '04814500', '121', 'wdw'),
(31, '1', 1, 'ww2w', 'Jardim Guanhembu', '04814500', '121', 'wdw'),
(32, '1', 1, 'ww2w', 'wqsq', '04814550', '123', 'dqdqdqd'),
(33, '1', 1, 'ww2w', 'wqsq', '04814550', '123', 'dqdqdqd'),
(34, '1', 1, 'ww2w', 'wqsq', '04814550', '123', 'dqdqdqd'),
(35, '1', 1, 'ww2w', 'dwdde', '04814550', '121', 'asasas'),
(36, '1', 1, 'ww2w', 'dwdde', '04814550', '123', 'asasas'),
(37, '1', 1, 'ww2w', 'dwdde', '04814550', '123', 'asasas'),
(38, '1', 1, 'fefe', 'wqsq', '04814550', '123', 'feff'),
(39, '1', 1, 'ww2w', 'asasa', '04814500', '123', '123'),
(40, '1', 1, 'ww2w', 'asasa', '04814500', '123', '123'),
(41, '1', 1, 'ww2w', 'asasa', '04814550', '121', 'feff'),
(42, '1', 1, 'ww2w', 'asasa', '04814550', '121', 'feff'),
(43, '1', 1, 'ww2w', 'asasa', '04814550', '121', 'feff'),
(44, '1', 1, 'ww2w', 'dwdde', '04814550', '121', 'wfcwwc'),
(45, '1', 1, 'ww2w', 'dwdde', '04814550', '121', 'wfcwwc'),
(46, '1', 1, 'ww2w', 'dwdde', '04814550', '121', 'wfcwwc'),
(47, '1', 1, 'ww2w', 'wqsq', '04814550', '123', 'wdw'),
(48, '1', 1, 'fefe', 'asasa', '04814550', '123', 'edeeee'),
(49, '1', 1, 'fefe', 'asasa', '04814550', '123', 'edeeee'),
(50, '1', 1, 'fefe', 'wqsq', '04814550', '121', 'feff'),
(51, '1', 1, 'fefe', 'wqsq', '04814550', '121', 'feff'),
(52, '1', 1, 'ww2w', 'dwdde', '04814500', '123', 'wdw'),
(1000, '2', 12, 'Rua André Grabois', 'aa', '121212', '121', 'd3r2'),
(1001, '1', 1, 'ww2w', 'wqsq', '04814550', '123', 'feff'),
(1002, '1', 1, 'ww2w', 'feef', '04814550', '123', 'eeee'),
(1003, '1', 1, 'ww2w', 'dee', '04814550', '111', 'dede'),
(1004, '1', 1, 'ww2w', 'Jardim Guanhembu', '04814550', '123', 'aaaaaa'),
(1005, '1', 1, 'ww2w', 'Jardim Guanhembu', '04814550', '123', 'aaaaaa'),
(1006, '1', 1, 'ww2w', 'swsw', '04814550', '123', 'deedede'),
(1007, 'São paulo', 12, 'wwww', 'wdwdwd', '04814550', '111', 'dwdwdw'),
(1008, 'São paulo', 12, 'ww2w', 'dwdde', '04814550', '123', 'sww'),
(1009, 'sasa', 12, 'dwdww', 'dwdde', '04814550', '1123', 'asas'),
(1010, 'São paulo', 11, 'fefe', 'asasa', '04814550', '123', '123');

-- --------------------------------------------------------

--
-- Estrutura para tabela `estado`
--

CREATE TABLE `estado` (
  `id_estado` int(11) NOT NULL,
  `nomeEstado` varchar(20) NOT NULL,
  `sigla` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `frete`
--

CREATE TABLE `frete` (
  `id_frete` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `metodo` int(11) NOT NULL,
  `valor` double NOT NULL,
  `data_entrega` date NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `marca`
--

CREATE TABLE `marca` (
  `id_marca` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `marca`
--

INSERT INTO `marca` (`id_marca`, `nome`) VALUES
(1, 'Eudora'),
(2, 'Oboticario\r\n'),
(3, 'Avon'),
(4, 'Natura'),
(5, 'Água de cheiro');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `id_pagamento` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `valor` double NOT NULL,
  `numero_card` varchar(20) NOT NULL,
  `data_venc` varchar(7) NOT NULL,
  `nome_titular` varchar(30) NOT NULL,
  `cvv` varchar(3) NOT NULL,
  `metodo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pagamento`
--

INSERT INTO `pagamento` (`id_pagamento`, `id_pedido`, `valor`, `numero_card`, `data_venc`, `nome_titular`, `cvv`, `metodo`) VALUES
(1, 1, 100, '4444', '43434', 'cscscscs', '343', 'cartão'),
(2, 1, 100, '4444', '43434', 'cscscscs', '343', 'cartão'),
(3, 1, 100, '4444', '43434', 'cscscscs', '343', 'cartão'),
(4, 1, 100, '4444', '43434', 'cscscscs', '343', 'cartão'),
(5, 1, 100, '4444', '43434', 'cscscscs', '343', 'cartão'),
(6, 1, 100, '1212 122', '121212', 'ewew', '122', 'cartão'),
(7, 1, 100, '1212 122', '121212', 'ewew', '122', 'cartão'),
(8, 1, 100, '1212 122', '121212', 'ewew', '122', 'cartão'),
(9, 1, 100, '1111 1111 1111', '222333', 'wewewe', '123', 'cartão'),
(10, 1, 100, '1111 1111 1111', '222333', 'wewewe', '123', 'cartão'),
(11, 1, 100, '1111 1111 1111', '222333', 'wewewe', '123', 'cartão'),
(12, 1, 100, '1212 1', '111111', 'asaqswws', '111', 'cartão'),
(13, 1, 100, '1212 1', '111111', 'asaqswws', '111', 'cartão'),
(14, 1, 100, '2332 3', '222222', 'wfdef', '123', 'cartão'),
(15, 1, 100, '1223 2', '111111', 'asaasas', '111', 'cartão'),
(16, 1, 100, '111', '111111', 'eded', '111', 'cartão'),
(17, 1, 100, '111', '111111', 'eded', '111', 'cartão'),
(18, 1, 100, '444', '111111', 'hbghg', '111', 'cartão'),
(19, 1, 100, '1121 2', '111111', 'sdwsdw', '111', 'cartão'),
(20, 1, 100, '1121 2', '111111', 'sdwsdw', '111', 'cartão'),
(21, 1, 100, '1121 2', '111111', 'sdwsdw', '111', 'cartão'),
(22, 1, 100, '222', '222222', 'wrww', '222', 'cartão'),
(23, 1, 100, '222', '222222', 'wrww', '222', 'cartão'),
(24, 1, 100, '222', '222222', 'wrww', '222', 'cartão'),
(25, 1, 100, '111', '111111', 'effe', '111', 'cartão'),
(26, 1, 100, '1111', '111111', 'cfcfcf', '111', 'cartão'),
(27, 1, 100, '1111', '111111', 'cfcfcf', '111', 'cartão'),
(28, 1, 100, '5555 5', '444444', 'gggg', '444', 'cartão'),
(29, 1, 100, '22', '222222', 'www', '222', 'cartão'),
(30, 1, 100, '22', '222222', 'www', '222', 'cartão'),
(31, 1, 100, '1212 21', '111111', 'aaaaaa', '111', 'cartão'),
(32, 1, 100, '1212 21', '111111', 'aaaaaa', '111', 'cartão'),
(33, 1, 100, '1212 21', '111111', 'aaaaaa', '111', 'cartão'),
(34, 1, 100, '2222', '222222', 'edde', '222', 'cartão'),
(35, 1, 100, '2222', '222222', 'edde', '222', 'cartão'),
(36, 1, 100, '2222', '222222', 'edde', '222', 'cartão'),
(37, 1, 100, '2', '222222', 'a', '222', 'cartão'),
(38, 1, 100, '33', '33333', 'ee', '333', 'cartão'),
(39, 1, 100, '33', '33333', 'ee', '333', 'cartão'),
(40, 1, 100, '1111 1111', '222222', 'efe', '222', 'cartão'),
(41, 1, 100, '1111 1111', '222222', 'efe', '222', 'cartão'),
(42, 1, 100, '2222 2222 2', '222222', 'aaaaaa', '222', 'cartão'),
(43, 1, 100, '1111', '111111', 'wsq', '111', 'cartão'),
(44, 1, 100, '1111 1111 1111 11', '111111', 'dsdwdw', '111', 'cartão'),
(45, 1, 100, '1111 1111 111', '111111', 'ceeec', '111', 'cartão'),
(46, 1, 100, '1111', '222222', 'aaaaaaaa', '222', 'cartão'),
(47, 1, 100, '1111', '222222', 'aaaaaaaa', '222', 'cartão'),
(48, 1, 100, '1111 1111 1', '111111', 'dddddd', '111', 'cartão'),
(49, 1, 100, '1111 111', '111111', 'dwdw', '111', 'cartão'),
(50, 1, 100, '1111 1111 1111 11', '111111', 'wddwqw', '111', 'cartão'),
(51, 1, 100, '1111 1111 1111', '111111', 'saas', '111', 'cartão'),
(52, 1, 100, '1111 1111 1111', '111111', 'aaaaaaaaaaaa', '111', 'cartão');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `data_criacao` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `total` double NOT NULL,
  `cod_pedido` varchar(20) NOT NULL,
  `qtd_itens_pedido` int(10) DEFAULT NULL,
  `criacao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedido`
--

INSERT INTO `pedido` (`id_pedido`, `id_cliente`, `data_criacao`, `status`, `total`, `cod_pedido`, `qtd_itens_pedido`, `criacao`) VALUES
(12, 13, '2024-11-24', 'Pendente', 310, 'P1732490048845', 0, NULL),
(13, 13, '2024-11-24', 'Pendente', 160, 'P1732494157865', 0, NULL),
(14, 13, '2024-11-24', 'Pendente', 350, 'P1732494289119', 0, NULL),
(15, 13, '2024-11-24', 'Pendente', 0, 'P1732494385079', 0, NULL),
(16, 13, '2024-11-24', 'Pendente', 200, 'P1732494717680', 0, NULL),
(17, 11, '2024-11-24', 'Pendente', 190, 'P1732494854197', 0, NULL),
(18, 11, '2024-11-24', 'Pendente', 0, 'P1732494885742', 0, NULL),
(19, 11, '2024-11-24', 'Pendente', 200, 'P1732494946260', 0, NULL),
(20, 11, '2024-11-24', 'Pendente', 0, 'P1732495115971', 0, NULL),
(21, 11, '2024-11-24', 'Pendente', 0, 'P1732495405683', 0, NULL),
(22, 11, '2024-11-24', 'Pendente', 130, 'P1732495466814', 0, NULL),
(23, 11, '2024-11-24', 'Pendente', 1000, 'P1732495800692', 0, NULL),
(24, 11, '2024-11-24', 'Pendente', 130, 'P1732496286705', 0, NULL),
(25, 13, '2024-11-24', 'Pendente', 160, 'P1732496947394', 0, NULL),
(26, 13, '2024-11-24', 'Pendente', 0, 'P1732497076257', 0, NULL),
(27, 13, '2024-11-24', 'Pendente', 130, 'P1732497206465', 0, NULL),
(28, 13, '2024-11-24', 'Pendente', 0, 'P1732497258013', 0, NULL),
(29, 13, '2024-11-24', 'Pendente', 275, 'P1732497352418', 0, NULL),
(30, 13, '2024-11-24', 'Pendente', 0, 'P1732497377866', 0, NULL),
(31, 12, '2024-11-24', 'Pendente', 150, 'P1732497451605', 0, NULL),
(32, 14, '2024-11-24', 'Pendente', 210, 'P1732497508567', 0, NULL),
(33, 14, '2024-11-24', 'Pendente', 0, 'P1732497581443', 0, NULL),
(34, 12, '2024-11-24', 'Pendente', 130, 'P1732498196848', 0, NULL),
(35, 12, '2024-11-24', 'Pendente', 0, 'P1732498265288', 0, NULL),
(36, 13, '2024-11-24', 'Pendente', 210, 'P1732498332277', 0, NULL),
(37, 12, '2024-11-25', 'Pendente', 420, 'P1732506451482', 0, NULL),
(38, 14, '2024-11-25', 'Pendente', 150, 'P1732572786459', 0, NULL),
(39, 14, '2024-11-25', 'Pendente', 1240, 'P1732572926018', 0, NULL),
(40, 12, '2024-11-25', 'Pendente', 550, 'P1732584073523', NULL, NULL),
(41, 12, '2024-11-25', 'Pendente', 310, 'P1732585835993', NULL, NULL),
(42, 12, '2024-11-25', 'Pendente', 180, 'P1732586708562', NULL, NULL),
(43, 12, '2024-11-25', 'Pendente', 180, 'P1732587330364', NULL, '2024-11-25'),
(44, 12, '2024-11-26', 'Pendente', 130, 'P1732630288802', NULL, '2024-11-26'),
(45, 11, '2024-11-26', 'Pendente', 180, 'P1732644844711', NULL, '2024-11-26');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedido_produto`
--

CREATE TABLE `pedido_produto` (
  `id_pedido_produto` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_produtos` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `preco_unitario` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedido_produto`
--

INSERT INTO `pedido_produto` (`id_pedido_produto`, `id_pedido`, `id_produtos`, `quantidade`, `preco_unitario`) VALUES
(3, 12, 62, 1, 160),
(4, 12, 65, 1, 150),
(5, 13, 25, 1, 160),
(6, 14, 73, 1, 170),
(7, 14, 74, 1, 180),
(8, 16, 36, 1, 200),
(9, 17, 49, 1, 190),
(10, 19, 36, 1, 200),
(11, 22, 24, 1, 130),
(12, 23, 1, 1, 1000),
(13, 24, 24, 1, 130),
(14, 25, 25, 1, 160),
(15, 27, 24, 1, 130),
(16, 29, 24, 1, 130),
(17, 29, 26, 1, 145),
(18, 31, 87, 1, 150),
(19, 32, 37, 1, 210),
(20, 34, 24, 1, 130),
(21, 36, 37, 1, 210),
(22, 37, 25, 1, 160),
(23, 37, 27, 1, 260),
(24, 38, 3, 1, 150),
(25, 39, 36, 1, 200),
(26, 39, 39, 1, 180),
(27, 39, 41, 1, 210),
(28, 39, 44, 1, 210),
(29, 39, 47, 1, 250),
(30, 39, 42, 1, 190),
(31, 40, 25, 1, 160),
(32, 40, 36, 1, 200),
(33, 40, 42, 1, 190),
(34, 41, 33, 1, 310),
(35, 42, 74, 1, 180),
(36, 43, 35, 1, 180),
(37, 44, 24, 1, 130),
(38, 45, 1, 1, 180);

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `id_produto` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `preco` double DEFAULT NULL,
  `estoque` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produto`
--

INSERT INTO `produto` (`id_produto`, `nome`, `descricao`, `preco`, `estoque`) VALUES
(1, 'Smartphone XYZ', 'Smartphone com tela de 6.5 polegadas', 1500, 10),
(2, 'Notebook ABC', 'Notebook potente para trabalho e jogos', 3500, 5),
(3, 'Smartwatch 123', 'Relógio inteligente com monitoramento cardíaco', 500, 15),
(4, 'Câmera HD', 'Câmera digital com alta resolução', 1200, 8),
(5, 'Fone de Ouvido', 'Fone de ouvido com cancelamento de ruído', 300, 20),
(6, 'Teclado Gamer', 'Teclado mecânico RGB', 250, 12),
(7, 'Mouse Wireless', 'Mouse sem fio ergonômico', 150, 25),
(8, 'Monitor 4K', 'Monitor de alta resolução para profissionais', 2000, 7),
(9, 'Impressora XYZ', 'Impressora multifuncional', 800, 10),
(10, 'Tablet LMN', 'Tablet para estudos e entretenimento', 1200, 9);

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `id_produto` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `valor` double NOT NULL,
  `custo` double NOT NULL,
  `descricao` varchar(300) NOT NULL,
  `tamanho` double NOT NULL,
  `capacidade` double NOT NULL,
  `imagem` varchar(100) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_marca` int(11) NOT NULL,
  `estoque` int(50) NOT NULL,
  `criacao` date NOT NULL,
  `status` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`id_produto`, `nome`, `valor`, `custo`, `descricao`, `tamanho`, `capacidade`, `imagem`, `id_categoria`, `id_marca`, `estoque`, `criacao`, `status`) VALUES
(1, 'Perfume Lancamento 1', 180, 70, 'Perfume de lançamento com notas frescas e florais', 100, 100, '9961651372062.jpg', 1, 1, 19, '0000-00-00', 1),
(2, 'Perfume Lancamento 2', 220, 90, 'Aroma marcante com notas amadeiradas e cítricas', 100, 100, '9962080600094.jpg', 1, 2, 25, '0000-00-00', 1),
(3, 'Perfume Lancamento 3', 250, 100, 'Notas de jasmim com fundo amadeirado e suave', 100, 100, '9962436657182.jpg', 1, 3, 18, '0000-00-00', 1),
(4, 'Perfume Lancamento 4', 230, 95, 'Fragrância refrescante e envolvente com toque de florais', 100, 100, '9962433511454.jpg', 1, 4, 22, '0000-00-00', 1),
(5, 'Perfume Lancamento 5', 210, 85, 'Aroma inovador com notas de musgo e limão', 100, 100, '9962404413470.jpg', 1, 5, 20, '0000-00-00', 1),
(6, 'Perfume Lancamento 6', 240, 100, 'Fragrância com toques de baunilha e flores silvestres', 100, 100, '9962404413470.jpg', 1, 6, 18, '0000-00-00', 1),
(7, 'Perfume Lancamento 7', 260, 110, 'Aroma com notas doces e florais, envolvente e sensual', 100, 100, '9962127065118.jpg', 1, 7, 28, '0000-00-00', 1),
(8, 'Perfume Lancamento 8', 270, 115, 'Notas de ambar e cedro com fundo de lavanda', 100, 100, '9962406772766.jpg', 1, 8, 30, '0000-00-00', 1),
(9, 'Perfume Promoção 1', 150, 60, 'Fragrância suave com notas de rosa e pêssego', 100, 100, '9961651372062.jpg', 2, 1, 15, '0000-00-00', 1),
(10, 'Perfume Promoção 2', 170, 70, 'Notas frescas com um toque de limão e menta', 100, 100, '9962080600094.jpg', 2, 2, 20, '0000-00-00', 1),
(11, 'Perfume Promoção 3', 180, 75, 'Fragrância envolvente com toques de lavanda e almíscar', 100, 100, '9962436657182.jpg', 2, 3, 22, '0000-00-00', 1),
(12, 'Perfume Promoção 4', 200, 80, 'Aroma de madeiras nobres e especiarias', 100, 100, '9962433511454.jpg', 2, 4, 18, '0000-00-00', 1),
(13, 'Perfume Promoção 5', 220, 90, 'Notas de frutas cítricas e musk', 100, 100, '9962404413470.jpg', 2, 5, 25, '0000-00-00', 1),
(14, 'Perfume Promoção 6', 240, 95, 'Fragrância doce com baunilha e coco', 100, 100, '9962404413470.jpg', 2, 6, 30, '0000-00-00', 1),
(15, 'Perfume Promoção 7', 250, 105, 'Notas amadeiradas com um toque de especiarias e lavanda', 100, 100, '9962127065118.jpg', 2, 7, 18, '0000-00-00', 1),
(16, 'Perfume Promoção 8', 270, 115, 'Aroma moderno com notas de maçã verde e pimenta', 100, 100, '9962406772766.jpg', 2, 8, 28, '0000-00-00', 1),
(17, 'Perfume Masculino 1', 200, 80, 'Aroma amadeirado com toques de vetiver e sândalo', 100, 100, '9961651372062.jpg', 3, 1, 22, '0000-00-00', 1),
(18, 'Perfume Masculino 2', 220, 90, 'Fragrância intensa com notas de tabaco e pimenta preta', 100, 100, '9962080600094.jpg', 3, 2, 18, '0000-00-00', 1),
(19, 'Perfume Masculino 3', 240, 100, 'Notas de bergamota e limão com fundo amadeirado', 100, 100, '9962436657182.jpg', 3, 3, 25, '0000-00-00', 1),
(20, 'Perfume Masculino 4', 260, 110, 'Aroma clássico com notas de lavanda e musk', 100, 100, '9962433511454.jpg', 3, 4, 28, '0000-00-00', 1),
(21, 'Perfume Masculino 5', 270, 115, 'Fragrância fresca com notas de maçã verde e limão', 100, 100, '9962404413470.jpg', 3, 5, 22, '0000-00-00', 1),
(22, 'Perfume Masculino 6', 280, 120, 'Notas de lavanda, jasmin e cedro', 100, 100, '9962404413470.jpg', 3, 6, 18, '0000-00-00', 1),
(23, 'Perfume Masculino 7', 290, 130, 'Aroma sofisticado com âmbar e couro', 100, 100, '9962127065118.jpg', 3, 7, 30, '0000-00-00', 1),
(24, 'Perfume Masculino 8', 300, 140, 'Notas intensas de pimenta e musk', 100, 100, '9962406772766.jpg', 3, 8, 20, '0000-00-00', 1),
(25, 'Perfume Feminino 1', 180, 70, 'Notas florais e de frutas vermelhas', 100, 100, '9961651372062.jpg', 4, 1, 18, '0000-00-00', 1),
(26, 'Perfume Feminino 2', 200, 80, 'Aroma suave com notas de rosa e peônia', 100, 100, '9962080600094.jpg', 4, 2, 22, '0000-00-00', 1),
(27, 'Perfume Feminino 3', 220, 90, 'Fragrância doce com baunilha e flor de laranjeira', 100, 100, '9962436657182.jpg', 4, 3, 28, '0000-00-00', 1),
(28, 'Perfume Feminino 4', 240, 100, 'Notas de lírio do vale com um toque de âmbar', 100, 100, '9962433511454.jpg', 4, 4, 25, '0000-00-00', 1),
(29, 'Perfume Feminino 5', 250, 110, 'Aroma fresco com notas de laranja e jasmim', 100, 100, '9962404413470.jpg', 4, 5, 20, '0000-00-00', 1),
(30, 'Perfume Feminino 6', 270, 120, 'Notas suaves de baunilha com toque de orquídea', 100, 100, '9962404413470.jpg', 4, 6, 30, '0000-00-00', 1),
(31, 'Perfume Feminino 7', 280, 130, 'Fragrância envolvente com notas de rosa e sândalo', 100, 100, '9962127065118.jpg', 4, 7, 15, '0000-00-00', 1),
(32, 'Perfume Feminino 8', 300, 140, 'Notas exóticas de flor de lótus com toques doces', 100, 100, '9962406772766.jpg', 4, 8, 18, '0000-00-00', 1),
(33, 'Perfume Aroma 1', 190, 80, 'Aroma fresco de bergamota e musgo', 100, 100, '9961651372062.jpg', 5, 1, 25, '0000-00-00', 1),
(34, 'Perfume Aroma 2', 210, 90, 'Notas de lavanda e sândalo', 100, 100, '9962080600094.jpg', 5, 2, 22, '0000-00-00', 1),
(35, 'Perfume Aroma 3', 230, 100, 'Fragrância cítrica com toques de maçã verde e limão', 100, 100, '9962436657182.jpg', 5, 3, 18, '0000-00-00', 1),
(36, 'Perfume Aroma 4', 250, 110, 'Notas exóticas de coco e baunilha', 100, 100, '9962433511454.jpg', 5, 4, 30, '0000-00-00', 1),
(37, 'Perfume Aroma 5', 270, 120, 'Fragrância doce com baunilha e castanha', 100, 100, '9962404413470.jpg', 5, 5, 20, '0000-00-00', 1),
(38, 'Perfume Aroma 6', 290, 130, 'Notas frescas com toque de eucalipto e limão', 100, 100, '9962404413470.jpg', 5, 6, 28, '0000-00-00', 1),
(39, 'Perfume Aroma 7', 310, 140, 'Aroma amadeirado com toques de musk e cedro', 100, 100, '9962127065118.jpg', 5, 7, 18, '0000-00-00', 1),
(40, 'Perfume Aroma 8', 330, 150, 'Notas de frutas vermelhas e flores tropicais', 100, 100, '9962406772766.jpg', 5, 8, 22, '0000-00-00', 1),
(41, 'Perfume Neutro 1', 160, 65, 'Aroma suave e fresco, ideal para o dia a dia', 100, 100, '9961651372062.jpg', 6, 1, 20, '0000-00-00', 1),
(42, 'Perfume Neutro 2', 180, 70, 'Notas de flor de laranjeira e cedro', 100, 100, '9962080600094.jpg', 6, 2, 25, '0000-00-00', 1),
(43, 'Perfume Neutro 3', 200, 80, 'Fragrância leve e elegante com baunilha e jasmim', 100, 100, '9962436657182.jpg', 6, 3, 30, '0000-00-00', 1),
(44, 'Perfume Neutro 4', 220, 90, 'Notas frescas e florais, com um toque de limão', 100, 100, '9962433511454.jpg', 6, 4, 18, '0000-00-00', 1),
(45, 'Perfume Neutro 5', 240, 100, 'Aroma suave com toques de jasmim e lírio do vale', 100, 100, '9962404413470.jpg', 6, 5, 22, '0000-00-00', 1),
(46, 'Perfume Neutro 6', 260, 110, 'Fragrância envolvente com notas de baunilha e musk', 100, 100, '9962404413470.jpg', 6, 6, 25, '0000-00-00', 1),
(47, 'Perfume Neutro 7', 280, 120, 'Notas delicadas de rosa e peônia', 100, 100, '9962127065118.jpg', 6, 7, 18, '0000-00-00', 1),
(48, 'Perfume Neutro 8', 300, 130, 'Aroma suave com toques de lavanda e musk', 100, 100, '9962406772766.jpg', 6, 8, 20, '0000-00-00', 1),
(49, 'Perfume Cítrico 1', 190, 75, 'Aroma fresco e energético com limão e laranja', 100, 100, '9961651372062.jpg', 7, 1, 28, '0000-00-00', 1),
(50, 'Perfume Cítrico 2', 210, 85, 'Notas vibrantes de grapefruit e limão', 100, 100, '9962080600094.jpg', 7, 2, 25, '0000-00-00', 1),
(51, 'Perfume Cítrico 3', 230, 95, 'Fragrância refrescante com toques de laranja e bergamota', 100, 100, '9962436657182.jpg', 7, 3, 20, '0000-00-00', 1),
(52, 'Perfume Cítrico 4', 250, 105, 'Notas de limão siciliano com fundo amadeirado', 100, 100, '9962433511454.jpg', 7, 4, 22, '0000-00-00', 1),
(53, 'Perfume Cítrico 5', 270, 115, 'Fragrância cítrica intensa com notas de tangerina', 100, 100, '9962404413470.jpg', 7, 5, 30, '0000-00-00', 1),
(54, 'Perfume Cítrico 6', 290, 125, 'Aroma fresco com limão e menta', 100, 100, '9962404413470.jpg', 7, 6, 18, '0000-00-00', 1),
(55, 'Perfume Cítrico 7', 310, 135, 'Notas de grapefruit com toques de laranja e limão', 100, 100, '9962127065118.jpg', 7, 7, 22, '0000-00-00', 1),
(56, 'Perfume Cítrico 8', 330, 145, 'Aroma energizante com limão e limão siciliano', 100, 100, '9962406772766.jpg', 7, 8, 25, '0000-00-00', 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id_administrador`);

--
-- Índices de tabela `avaliacoes`
--
ALTER TABLE `avaliacoes`
  ADD PRIMARY KEY (`id_avaliacoes`),
  ADD KEY `fk_id_cliente` (`id_cliente`),
  ADD KEY `fk_id_pedido` (`id_pedido`);

--
-- Índices de tabela `carrinho`
--
ALTER TABLE `carrinho`
  ADD PRIMARY KEY (`id_carrinho`),
  ADD KEY `fk_id_produto` (`id_produto`),
  ADD KEY `fk_id_clientes` (`email_cliente`);

--
-- Índices de tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Índices de tabela `cidade`
--
ALTER TABLE `cidade`
  ADD PRIMARY KEY (`id_cidade`);

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices de tabela `cupomdesconto`
--
ALTER TABLE `cupomdesconto`
  ADD PRIMARY KEY (`id_cupom_desconto`);

--
-- Índices de tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`id_endereco`);

--
-- Índices de tabela `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`id_estado`);

--
-- Índices de tabela `frete`
--
ALTER TABLE `frete`
  ADD PRIMARY KEY (`id_frete`);

--
-- Índices de tabela `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id_marca`);

--
-- Índices de tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`id_pagamento`);

--
-- Índices de tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`);

--
-- Índices de tabela `pedido_produto`
--
ALTER TABLE `pedido_produto`
  ADD PRIMARY KEY (`id_pedido_produto`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id_produto`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id_produto`),
  ADD KEY `fk_id_categoria` (`id_categoria`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `administrador`
--
ALTER TABLE `administrador`
  MODIFY `id_administrador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `avaliacoes`
--
ALTER TABLE `avaliacoes`
  MODIFY `id_avaliacoes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `carrinho`
--
ALTER TABLE `carrinho`
  MODIFY `id_carrinho` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `cidade`
--
ALTER TABLE `cidade`
  MODIFY `id_cidade` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `cupomdesconto`
--
ALTER TABLE `cupomdesconto`
  MODIFY `id_cupom_desconto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `id_endereco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1011;

--
-- AUTO_INCREMENT de tabela `estado`
--
ALTER TABLE `estado`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `frete`
--
ALTER TABLE `frete`
  MODIFY `id_frete` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `marca`
--
ALTER TABLE `marca`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `id_pagamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de tabela `pedido_produto`
--
ALTER TABLE `pedido_produto`
  MODIFY `id_pedido_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `fk_id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
