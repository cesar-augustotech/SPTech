var database = require("../database/config")

function autenticar(email, senha) {
    console.log("ACESSEI O USUARIO MODEL para autenticar:", email);
    var instrucaoSql = `
        SELECT id, nome, email
        FROM usuario
        WHERE email = '${email}' AND senha = '${senha}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

// Coloque os mesmos parâmetros aqui. Vá para a var instrucaoSql
function cadastrar(nomeUsuario, nomeEmpresa, email, telefone, cnpj, senha) {
    
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nomeUsuario, email, senha);
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucaoSql = `
        INSERT INTO empresa (nome, cnpj, telefone) VALUES ('${nomeEmpresa}', '${cnpj}', '${telefone}');
        SET @last_empresa_id = LAST_INSERT_ID();
        INSERT INTO unidade (nome, id_empresa) VALUES ('${nomeEmpresa} 1', @last_empresa_id);
        SET @last_unidade_id = LAST_INSERT_ID();
        INSERT INTO usuario (nome, email, senha, nivel_de_acesso) VALUES ('${nomeUsuario}', '${email}', '${senha}', 'admin');
        SET @last_usuario_id = LAST_INSERT_ID();
        INSERT INTO unidade_usuario (id_usuario, id_unidade) VALUES (@last_usuario_id, @last_unidade_id);
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    autenticar,
    cadastrar
};