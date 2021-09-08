const express = require("express");

const app = express();

//conexão com DB MySQL

const mysql = require('mysql');

var connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'sisac'

});

connection.connect(function (err){
    if(err){
        console.error('error connectirg: ' + err.stack);
        return;
    }
    console.log('connected as id ' + connection.threadId);
});

// Cadastrado de Funcionarios SQL

connection.query("INSERT INTO `sisac`.`funcionarios` (`IdUsuario`, `Senha`, `Telefone`, `TipoUsuario`, `UsuarioNome`, `Nome`) VALUES ('3', 'meesqueci', '91999999999', 'Diretora', 'genera7sousa', 'Antonia Genara');",function(err,_result){
    if(!err){
        console.log('Funcionario cadastrado com sucesso!');
    }else{
        console.log('Erro, não foi possivel cadastrar o funcionario.');
    }
});

// Update
connection.query("UPDATE `sisac`.`funcionarios` SET `Senha` = '123456' WHERE (`IdUsuario` = '1');" ,function(err,_result){
    if(!err){
        console.log('Funcionario editado com sucesso!');
    }else{
        console.log('Erro, não foi possivel editar o funcionario.');
    }
});

//loscalhost:8080
app.listen(8080);
