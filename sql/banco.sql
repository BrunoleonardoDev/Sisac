CREATE TABLE funcionarios (
    Senha VARCHAR(30),
    Telefone VARCHAR(12),
    IdUsuario INTEGER PRIMARY KEY,
    TipoUsuario VARCHAR(50),
    UsuarioNome VARCHAR(40),
    Nome VARCHAR(50)
);

CREATE TABLE ProfissionalSaude (
    IdProfissional INTEGER PRIMARY KEY,
    Especialidade VARCHAR(40),
    Nome VARCHAR(50),
    NumeroConselho VARCHAR(10)
);

CREATE TABLE Unidade (
    IdUnidade INTEGER PRIMARY KEY,
    Nome VARCHAR(50),
    MunicipioPactuado VARCHAR(50),
    TipoUnidade VARCHAR(50)
);

CREATE TABLE Paciente (
    IdPaciente INTEGER PRIMARY KEY,
    Nome VARCHAR(50),
    Cns VARCHAR(15),
    DataNascimento DATE,
    Bairro VARCHAR(50),
    Cidade VARCHAR(50),
    RuaNumero VARCHAR(50),
    Cpf VARCHAR(11)
);

CREATE TABLE Agendamento (
    IdAgendamento INTEGER PRIMARY KEY,
    DataAgendamento DATE,
    Hora TIME,
    TipoAgendamento Varchar(40),
    StatusAgendamento BOOLEAN,
    fk_Unidade_IdUnidade INTEGER,
    fk_funcionarios_IdUsuario INTEGER,
    fk_Paciente_IdPaciente INTEGER,
    fk_ProfissionalSaude_IdProfissional INTEGER
);

CREATE TABLE Trabalha (
    fk_ProfissionalSaude_IdProfissional INTEGER,
    fk_Unidade_IdUnidade INTEGER
);
 
ALTER TABLE Agendamento ADD CONSTRAINT FK_Agendamento_2
    FOREIGN KEY (fk_Unidade_IdUnidade)
    REFERENCES Unidade (IdUnidade)
    ON DELETE CASCADE;
 
ALTER TABLE Agendamento ADD CONSTRAINT FK_Agendamento_3
    FOREIGN KEY (fk_funcionarios_IdUsuario)
    REFERENCES funcionarios (IdUsuario)
    ON DELETE CASCADE;
 
ALTER TABLE Agendamento ADD CONSTRAINT FK_Agendamento_4
    FOREIGN KEY (fk_Paciente_IdPaciente)
    REFERENCES Paciente (IdPaciente)
    ON DELETE CASCADE;
 
ALTER TABLE Agendamento ADD CONSTRAINT FK_Agendamento_5
    FOREIGN KEY (fk_ProfissionalSaude_IdProfissional)
    REFERENCES ProfissionalSaude (IdProfissional)
    ON DELETE CASCADE;
 
ALTER TABLE Trabalha ADD CONSTRAINT FK_Trabalha_1
    FOREIGN KEY (fk_ProfissionalSaude_IdProfissional)
    REFERENCES ProfissionalSaude (IdProfissional)
    ON DELETE SET NULL;
 
ALTER TABLE Trabalha ADD CONSTRAINT FK_Trabalha_2
    FOREIGN KEY (fk_Unidade_IdUnidade)
    REFERENCES Unidade (IdUnidade)
    ON DELETE SET NULL;