// PARA EXECUTAR O CÓDIGO NO NODE.JS (TERMINAL):
//  node Lista14_1.js
 
const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function parOuImpar(numero) {
    return numero % 2 === 0 ? 'par' : 'ímpar';
}

function somaParesMenores(numero) {
    let soma = 0;
    for (let i = 0; i < numero; i++) {
        if (i % 2 === 0) soma += i;
    }
    return soma;
}

function contarVetor(vetor, numero) {
    let contador = 0;
    for (let i = 0; i < vetor.length; i++) {
        if (vetor[i] === numero) contador++;
    }
    return contador;
}

rl.question("Digite um número para verificar se é par ou ímpar: ", (res1) => {
    const num1 = parseInt(res1);
    console.log(`O número ${num1} é ${parOuImpar(num1)}.`);

    rl.question("Digite um número para somar os pares menores que ele: ", (res2) => {
        const num2 = parseInt(res2);
        console.log(`A soma dos pares menores que ${num2} é ${somaParesMenores(num2)}.`);

        rl.question("Digite os números do vetor separados por vírgula (ex: 1,2,2,3): ", (res3) => {
            const vetor = res3.split(",").map(Number);

            rl.question("Digite o número que deseja contar no vetor: ", (res4) => {
                const numeroProcurado = parseInt(res4);
                const resultado = contarVetor(vetor, numeroProcurado);
                console.log(`O número ${numeroProcurado} aparece ${resultado} vez(es) no vetor.`);

                rl.close();
            });
        });
    });
});
