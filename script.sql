USE [master]
GO
/****** Object:  Database [Secretaria]    Script Date: 25/10/2023 18:28:39 ******/
CREATE DATABASE [Secretaria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Secretaria', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Secretaria.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Secretaria_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Secretaria_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Secretaria] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Secretaria].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Secretaria] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Secretaria] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Secretaria] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Secretaria] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Secretaria] SET ARITHABORT OFF 
GO
ALTER DATABASE [Secretaria] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Secretaria] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Secretaria] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Secretaria] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Secretaria] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Secretaria] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Secretaria] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Secretaria] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Secretaria] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Secretaria] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Secretaria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Secretaria] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Secretaria] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Secretaria] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Secretaria] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Secretaria] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Secretaria] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Secretaria] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Secretaria] SET  MULTI_USER 
GO
ALTER DATABASE [Secretaria] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Secretaria] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Secretaria] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Secretaria] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Secretaria] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Secretaria] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Secretaria] SET QUERY_STORE = ON
GO
ALTER DATABASE [Secretaria] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Secretaria]
GO
/****** Object:  Table [dbo].[Acessos]    Script Date: 25/10/2023 18:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Acessos](
	[idAcesso] [int] NOT NULL,
	[idAluno] [int] NOT NULL,
	[DataAcesso] [date] NOT NULL,
	[HoraAcesso] [time](7) NOT NULL,
	[IPAcesso] [nvarchar](15) NOT NULL,
	[DispositivoAcesso] [nvarchar](max) NOT NULL,
	[NavegadorAcesso] [nvarchar](max) NOT NULL,
	[DetalhesAcesso] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Acessos] PRIMARY KEY CLUSTERED 
(
	[idAcesso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Alunos]    Script Date: 25/10/2023 18:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alunos](
	[idAluno] [int] NOT NULL,
	[idEndereco] [int] NOT NULL,
	[idTelefone] [int] NOT NULL,
	[idMatricula] [int] NOT NULL,
	[RaAluno] [nvarchar](7) NOT NULL,
	[idCurso] [int] NOT NULL,
	[idBolsa] [int] NOT NULL,
 CONSTRAINT [PK_Alunos] PRIMARY KEY CLUSTERED 
(
	[idAluno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bolsas]    Script Date: 25/10/2023 18:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bolsas](
	[idBolsa] [int] NOT NULL,
	[ValorBolsa] [nvarchar](5) NOT NULL,
	[InstituicaoBolsa] [nvarchar](max) NOT NULL,
	[DuracaoBolsa] [nvarchar](50) NOT NULL,
	[idAluno] [int] NOT NULL,
 CONSTRAINT [PK_Bolsas] PRIMARY KEY CLUSTERED 
(
	[idBolsa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnderecoAlunos]    Script Date: 25/10/2023 18:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnderecoAlunos](
	[idEndereco] [int] NOT NULL,
	[idAluno] [int] NOT NULL,
	[TipoEndereco] [nvarchar](50) NOT NULL,
	[RuaEndereco] [nvarchar](max) NOT NULL,
	[NumeroEndereco] [nvarchar](10) NOT NULL,
	[ComplementoEndereco] [nvarchar](max) NULL,
	[BairroEndereco] [nvarchar](max) NOT NULL,
	[CidadeEndereco] [nvarchar](max) NOT NULL,
	[EstadoEndereco] [nvarchar](50) NOT NULL,
	[CEP] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_EnderecoAlunos] PRIMARY KEY CLUSTERED 
(
	[idEndereco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estagio]    Script Date: 25/10/2023 18:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estagio](
	[idEstagio] [int] NOT NULL,
	[EmpresaEstagio] [nvarchar](max) NOT NULL,
	[ResponsavelEstagio] [nvarchar](max) NOT NULL,
	[CargoEstagio] [nvarchar](max) NOT NULL,
	[DataConclusao] [date] NOT NULL,
 CONSTRAINT [PK_Estagio] PRIMARY KEY CLUSTERED 
(
	[idEstagio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Frequencia]    Script Date: 25/10/2023 18:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Frequencia](
	[idFrequencia] [int] NOT NULL,
	[idAluno] [int] NOT NULL,
	[idCurso] [int] NOT NULL,
	[idDisciplina] [int] NOT NULL,
	[CargaHoraira] [nvarchar](50) NOT NULL,
	[PresencaAluno] [nvarchar](5) NOT NULL,
 CONSTRAINT [PK_Frequencia] PRIMARY KEY CLUSTERED 
(
	[idFrequencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GradeHoraria]    Script Date: 25/10/2023 18:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GradeHoraria](
	[idGradeHoraria] [int] NOT NULL,
	[idProfessor] [int] NOT NULL,
	[idDisciplina] [int] NOT NULL,
	[idSala] [int] NOT NULL,
	[DiaSemana] [nvarchar](20) NOT NULL,
	[HoraInicio] [time](7) NOT NULL,
	[HoraFim] [time](7) NOT NULL,
 CONSTRAINT [PK_GradeHoraria] PRIMARY KEY CLUSTERED 
(
	[idGradeHoraria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Historico]    Script Date: 25/10/2023 18:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historico](
	[idHistorico] [int] NOT NULL,
	[idAluno] [int] NOT NULL,
	[idCurso] [int] NOT NULL,
	[SemestreAluno] [nvarchar](25) NOT NULL,
	[idNotas] [int] NOT NULL,
	[idGradeHoraria] [int] NOT NULL,
	[idFrequencia] [int] NOT NULL,
	[AtividadesAcademicas] [nvarchar](max) NOT NULL,
	[AlunoAprovado] [bit] NOT NULL,
 CONSTRAINT [PK_Historico] PRIMARY KEY CLUSTERED 
(
	[idHistorico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Matriculas]    Script Date: 25/10/2023 18:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matriculas](
	[idMatricula] [int] NOT NULL,
	[NumeroMatricula] [nchar](10) NOT NULL,
	[idTelefone] [int] NOT NULL,
	[idAluno] [int] NOT NULL,
	[RGAluno] [nvarchar](10) NOT NULL,
	[CPFAluno] [nvarchar](11) NOT NULL,
	[idEndereco] [int] NOT NULL,
	[ValorMatricula] [nvarchar](max) NOT NULL,
	[DescontoMatricula] [nvarchar](50) NOT NULL,
	[idCurso] [int] NOT NULL,
	[TrancamentoMatricula] [bit] NOT NULL,
 CONSTRAINT [PK_Matriculas] PRIMARY KEY CLUSTERED 
(
	[idMatricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notas]    Script Date: 25/10/2023 18:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notas](
	[idNotas] [int] IDENTITY(1,1) NOT NULL,
	[idAluno] [int] NOT NULL,
	[idCurso] [int] NOT NULL,
	[idDisciplina] [int] NOT NULL,
	[A1] [decimal](5, 2) NOT NULL,
	[A2] [decimal](5, 2) NOT NULL,
	[A3] [decimal](5, 2) NOT NULL,
	[A4] [decimal](5, 2) NOT NULL,
	[A5] [decimal](5, 2) NOT NULL,
	[N1]  AS (((([A1]+[A2])+[A3])+[A4])/(4)),
	[N2]  AS ([A5]),
	[MediaFinal] [decimal](5, 2) NOT NULL,
 CONSTRAINT [PK__Notas__7C2D49F0A88D8119] PRIMARY KEY CLUSTERED 
(
	[idNotas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Protocolos]    Script Date: 25/10/2023 18:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Protocolos](
	[idProtocolo] [int] NOT NULL,
	[NumeroProtocolo] [nvarchar](12) NOT NULL,
	[DataHoraAbertura] [datetime] NOT NULL,
	[DataHoraFechamento] [datetime] NOT NULL,
	[idFuncionario] [int] NOT NULL,
	[idAluno] [int] NOT NULL,
 CONSTRAINT [PK_Protocolos] PRIMARY KEY CLUSTERED 
(
	[idProtocolo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TelefoneAlunos]    Script Date: 25/10/2023 18:28:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TelefoneAlunos](
	[idTelefone] [int] NOT NULL,
	[idAluno] [int] NOT NULL,
	[TipoTelefone] [nvarchar](50) NOT NULL,
	[DDITelefone] [nchar](5) NOT NULL,
	[DDDTelefone] [nvarchar](3) NOT NULL,
	[NumeroTelefone] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_TelefoneAlunos] PRIMARY KEY CLUSTERED 
(
	[idTelefone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave Primária para tabela de Acessos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Acessos', @level2type=N'COLUMN',@level2name=N'idAcesso'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave estrangeira para a tabela de Alunos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Acessos', @level2type=N'COLUMN',@level2name=N'idAluno'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data do Acesso' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Acessos', @level2type=N'COLUMN',@level2name=N'DataAcesso'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hora do Acesso' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Acessos', @level2type=N'COLUMN',@level2name=N'HoraAcesso'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'IP do acesso' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Acessos', @level2type=N'COLUMN',@level2name=N'IPAcesso'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dispositivo usado no acesso' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Acessos', @level2type=N'COLUMN',@level2name=N'DispositivoAcesso'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Navegador usado no acesso' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Acessos', @level2type=N'COLUMN',@level2name=N'NavegadorAcesso'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Informações adicionais do acesso' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Acessos', @level2type=N'COLUMN',@level2name=N'DetalhesAcesso'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave Primária para Tabela Alunos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alunos', @level2type=N'COLUMN',@level2name=N'idAluno'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave estrangeira para a tabela de Endereços' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alunos', @level2type=N'COLUMN',@level2name=N'idEndereco'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave estrangeira para a tabela de Telefones' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alunos', @level2type=N'COLUMN',@level2name=N'idTelefone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave estrangeira para a tabela de Matricula' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alunos', @level2type=N'COLUMN',@level2name=N'idMatricula'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Registro do Aluno (RA)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alunos', @level2type=N'COLUMN',@level2name=N'RaAluno'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave estrangeira para a tabela de Cursos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alunos', @level2type=N'COLUMN',@level2name=N'idCurso'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave estrangeira para a tabela de Bolsas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Alunos', @level2type=N'COLUMN',@level2name=N'idBolsa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave Primária da Tabela de Bolsas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bolsas', @level2type=N'COLUMN',@level2name=N'idBolsa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Valor da bolsa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bolsas', @level2type=N'COLUMN',@level2name=N'ValorBolsa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Instituição responsável pela bolsa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bolsas', @level2type=N'COLUMN',@level2name=N'InstituicaoBolsa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Duração da bolsa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bolsas', @level2type=N'COLUMN',@level2name=N'DuracaoBolsa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave estrangeira para a tabela de Alunos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Bolsas', @level2type=N'COLUMN',@level2name=N'idAluno'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave Primária da Tabela de Endereços dos Alunos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EnderecoAlunos', @level2type=N'COLUMN',@level2name=N'idEndereco'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave estrangeira para a tabela de Alunos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EnderecoAlunos', @level2type=N'COLUMN',@level2name=N'idAluno'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo do endereço (Residencial, Correspondência, etc)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EnderecoAlunos', @level2type=N'COLUMN',@level2name=N'TipoEndereco'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Rua do imóvel' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EnderecoAlunos', @level2type=N'COLUMN',@level2name=N'RuaEndereco'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Número do imóvel' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EnderecoAlunos', @level2type=N'COLUMN',@level2name=N'NumeroEndereco'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Complemento do imóvel' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EnderecoAlunos', @level2type=N'COLUMN',@level2name=N'ComplementoEndereco'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bairro do imóvel' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EnderecoAlunos', @level2type=N'COLUMN',@level2name=N'BairroEndereco'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cidade do imóvel' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EnderecoAlunos', @level2type=N'COLUMN',@level2name=N'CidadeEndereco'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estado do imóvel' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EnderecoAlunos', @level2type=N'COLUMN',@level2name=N'EstadoEndereco'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CEP do imóvel' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EnderecoAlunos', @level2type=N'COLUMN',@level2name=N'CEP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave Primária da Tabela de Estágio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Estagio', @level2type=N'COLUMN',@level2name=N'idEstagio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Empresa onde o aluno faz seu estágio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Estagio', @level2type=N'COLUMN',@level2name=N'EmpresaEstagio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Responsável pelo estágio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Estagio', @level2type=N'COLUMN',@level2name=N'ResponsavelEstagio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cargo do estágio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Estagio', @level2type=N'COLUMN',@level2name=N'CargoEstagio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data de conclusão do estágio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Estagio', @level2type=N'COLUMN',@level2name=N'DataConclusao'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave Primária da Tabela de Frequência' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Frequencia', @level2type=N'COLUMN',@level2name=N'idFrequencia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave estrangeira para a tabela de Alunos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Frequencia', @level2type=N'COLUMN',@level2name=N'idAluno'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave estrangeira para a tabela de Cursos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Frequencia', @level2type=N'COLUMN',@level2name=N'idCurso'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave estrangeira para a tabela de Disciplinas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Frequencia', @level2type=N'COLUMN',@level2name=N'idDisciplina'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Carga Horária total do curso' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Frequencia', @level2type=N'COLUMN',@level2name=N'CargaHoraira'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Presença do Aluno' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Frequencia', @level2type=N'COLUMN',@level2name=N'PresencaAluno'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave Primária da Tabela de Grade Horária' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GradeHoraria', @level2type=N'COLUMN',@level2name=N'idGradeHoraria'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave estrangeira para a tabela de Professores' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GradeHoraria', @level2type=N'COLUMN',@level2name=N'idProfessor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave estrangeira para a tabela de Disciplinas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GradeHoraria', @level2type=N'COLUMN',@level2name=N'idDisciplina'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave estrangeira para a tabela de Salas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GradeHoraria', @level2type=N'COLUMN',@level2name=N'idSala'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dia da semana da disciplina' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GradeHoraria', @level2type=N'COLUMN',@level2name=N'DiaSemana'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Horário de início da aula' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GradeHoraria', @level2type=N'COLUMN',@level2name=N'HoraInicio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Horário de finalização da aula' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GradeHoraria', @level2type=N'COLUMN',@level2name=N'HoraFim'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave Primária da Tabela de Hitórico' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Historico', @level2type=N'COLUMN',@level2name=N'idHistorico'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave estrangeira para a tabela de Alunos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Historico', @level2type=N'COLUMN',@level2name=N'idAluno'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave estrangeira para a tabela de Cursos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Historico', @level2type=N'COLUMN',@level2name=N'idCurso'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Semestre do Aluno' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Historico', @level2type=N'COLUMN',@level2name=N'SemestreAluno'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave estrangeira para a tabela de Notas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Historico', @level2type=N'COLUMN',@level2name=N'idNotas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave estrangeira para a tabela de Grade Horária' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Historico', @level2type=N'COLUMN',@level2name=N'idGradeHoraria'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave estrangeira para a tabela de Frequência' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Historico', @level2type=N'COLUMN',@level2name=N'idFrequencia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Atividades extracurriculares, projetos e afins' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Historico', @level2type=N'COLUMN',@level2name=N'AtividadesAcademicas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Se o aluno está aprovado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Historico', @level2type=N'COLUMN',@level2name=N'AlunoAprovado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave Primária da Tabela de Matrículas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Matriculas', @level2type=N'COLUMN',@level2name=N'idMatricula'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Registro da matrícula' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Matriculas', @level2type=N'COLUMN',@level2name=N'NumeroMatricula'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave estrangeira para a tabela de Telefones' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Matriculas', @level2type=N'COLUMN',@level2name=N'idTelefone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave estrangeira para a tabela de Alunos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Matriculas', @level2type=N'COLUMN',@level2name=N'idAluno'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave estrangeira para a tabela de Endereço dos Alunos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Matriculas', @level2type=N'COLUMN',@level2name=N'idEndereco'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Valor da Matrícula' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Matriculas', @level2type=N'COLUMN',@level2name=N'ValorMatricula'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Desconto no valor da matrícula' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Matriculas', @level2type=N'COLUMN',@level2name=N'DescontoMatricula'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave estrangeira para a tabela de Cursos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Matriculas', @level2type=N'COLUMN',@level2name=N'idCurso'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Informa se o aluno tem a matrícula trancada' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Matriculas', @level2type=N'COLUMN',@level2name=N'TrancamentoMatricula'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave Primária da Tabela de Notas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notas', @level2type=N'COLUMN',@level2name=N'idNotas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave estrangeira para a tabela de Alunos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notas', @level2type=N'COLUMN',@level2name=N'idAluno'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave estrangeira para a tabela de Cursos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notas', @level2type=N'COLUMN',@level2name=N'idCurso'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave estrangeira para a tabela de Disciplinas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notas', @level2type=N'COLUMN',@level2name=N'idDisciplina'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nota da primeira avaliação (A1)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notas', @level2type=N'COLUMN',@level2name=N'A1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nota da primeira avaliação (A2)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notas', @level2type=N'COLUMN',@level2name=N'A2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nota da primeira avaliação (A3)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notas', @level2type=N'COLUMN',@level2name=N'A3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nota da primeira avaliação (A4)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notas', @level2type=N'COLUMN',@level2name=N'A4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nota da primeira avaliação (A5)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notas', @level2type=N'COLUMN',@level2name=N'A5'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Informa o valor do cálculo (A1 + A2 + A3 + A4) / 4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notas', @level2type=N'COLUMN',@level2name=N'N1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Informa o valor da coluna A5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notas', @level2type=N'COLUMN',@level2name=N'N2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Média Final do Aluno' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Notas', @level2type=N'COLUMN',@level2name=N'MediaFinal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave Primária da tabela de Protocolos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Protocolos', @level2type=N'COLUMN',@level2name=N'idProtocolo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Número do protocolo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Protocolos', @level2type=N'COLUMN',@level2name=N'NumeroProtocolo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data e hora de abertura do protocolo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Protocolos', @level2type=N'COLUMN',@level2name=N'DataHoraAbertura'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data e hora do fechamento do protocolo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Protocolos', @level2type=N'COLUMN',@level2name=N'DataHoraFechamento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave estrangeira para a tabela de Funcionários' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Protocolos', @level2type=N'COLUMN',@level2name=N'idFuncionario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave estrangeira para a tabela de Alunos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Protocolos', @level2type=N'COLUMN',@level2name=N'idAluno'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave Primária para tabela de Telefones dos Alunos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TelefoneAlunos', @level2type=N'COLUMN',@level2name=N'idTelefone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave estrangeira para a tabela de Alunos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TelefoneAlunos', @level2type=N'COLUMN',@level2name=N'idAluno'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo do telefone (Residencial, comercial, etc.)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TelefoneAlunos', @level2type=N'COLUMN',@level2name=N'TipoTelefone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'DDI do telefone' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TelefoneAlunos', @level2type=N'COLUMN',@level2name=N'DDITelefone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'DDD do telefone' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TelefoneAlunos', @level2type=N'COLUMN',@level2name=N'DDDTelefone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Numéro de telefone do aluno' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TelefoneAlunos', @level2type=N'COLUMN',@level2name=N'NumeroTelefone'
GO
USE [master]
GO
ALTER DATABASE [Secretaria] SET  READ_WRITE 
GO
