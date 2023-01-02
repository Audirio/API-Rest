const database = require('../connection/databaseConnection');

async function listar() {
    let sql = 'SELECT * FROM tb_cliente';

    return await database.executar(sql);
}

async function buscarUm(id) {
    return await database.executar('SELECT * FROM tb_cliente WHERE id='+id);
}

function cadastrar() {
    return "Cadastrando cliente...";
}

module.exports = {
    listar,
    cadastrar,
    buscarUm,
};