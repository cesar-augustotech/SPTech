
function validar(valores){
    
for (let i = 0; i < valores.length; i++){
    
    if (valores[i] == null || valores[i] == undefined) return `Parâmetro ${valores[i]} não pode ser nulo ou indefinido`
    if (typeof valores[i] != "number") return `Tipo inválido para o argumento ${valores[i]}`
}

return 'valido'

}


function somar(num1, num2){
console.log("-----função Somar: -----")
    let validacao = validar(num1,num2)
    if (validacao == 'valido'){

    let soma = num1 + num2;
         return soma
    } else return validacao
    

  
        
    
}

function distancia([x1,y1,x2,y2]){
    console.log("-----Função calcular distância:-----")
let validacao = validar([x1,y1,x2,y2])

  if (validacao == 'valido'){
    let calculo = ((((x2-x1) *(x2-x1)) + ((y2-y1) * (y2-y1)))) ** 1/2
    return calculo

  }else return validacao

}
console.log(somar("e",5))
console.log(distancia([1,2,3,2]))


 function converterParaHoraMinutoSegundo(numero){
    console.log("-----Função converter horário: -----")
    let validacao = validar(numero)
    let min = 0;
    let hr = 0;

    if (validacao == 'valido'){
    while (numero > 59){
        numero -= 60;
        min ++
        while (min > 59){
            min -= 60;
            hr ++;
        }
}
    return (hr + " : " + min + " : " + numero)
    } else return validacao

 }

 console.log(converterParaHoraMinutoSegundo(140153))


 function ePrimo(numero){
    console.log("-----Função verificar número primo: -----")
    let validacao = validar(numero)
    let primo = true;
    if (validacao == "valido"){
    for (let i = 0; i <= numero; i++)
    {
        if (i != numero && i != 1 && numero % i == 0){
        
            primo = false
            break
        }
    }
    if (primo) return true
    if (primo == false) return false

 } return validacao
}

 console.log(ePrimo(4));


 function calcularFatorial(){
    
 }