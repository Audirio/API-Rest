const database = require('../connection/databaseConnection');

async function listar() {
    let sql = `SELECT prod.*, cli.nome as Cliente FROM tb_produto prod INNER JOIN tb_cliente cli ON prod.cliente_id = cli.id`;

    return await database.executar(sql);
}

async function cadastrar({nome, preco, quantidade, descricao, categoria, cliente_id}) {
    let sql = `INSERT INTO tb_produto (nome, preco, quantidade, descricao, categoria, cliente_id)
                VALUES ('${nome}', '${preco}', '${quantidade}', '${descricao}', '${categoria}', '${cliente_id}')`;
    await database.executar(sql);
}

async function editar ({nome, preco, quantidade, descricao, categoria, cliente_id}, id) {
    let sql = `UPDATE tb_produto SET marca='${nome}', modelo='${preco}', ano='${quantidade}', descricao='${descricao}', categiria='${categoria}', cliente_id='${cliente_id} WHERE id=${id}`;
    await database.executar(sql);
}

async function excluir(id) {

    let sql = "DELETE FROM tb_produto WHERE id="+id;

    await database.executar(sql);
}

async function buscarUm(id) {
    let sql = "SELECT * FROM tb_produto WHERE id="+id;

    let resultado = await database.executar(sql);

    return resultado[0];
}

module.exports = {
    listar,
    cadastrar,
    editar,
    excluir,
    buscarUm,
};