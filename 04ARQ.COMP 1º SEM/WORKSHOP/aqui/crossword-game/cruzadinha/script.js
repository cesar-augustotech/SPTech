

// Matriz da cruzadinha 
const cruzadinhaRespostas = [
   
    ['','','','','','','','','','','','','','','','','','','',''],
    ['','','','','','','','','','','','I','5','','','','','','',''],
    ['','','','R','O','M','','','','','','7','','','','','','','',''],
    ['','','','A','','','','','','','','','','','','','','','',''],
    ['','','D','M','A','','','','','','','','','','','','','','',''],
    ['','','U','','','','','','','','','','Q','','','','','','',''],
    ['','D','A','T','A','','','','','','E','','U','','','','','','',''],
    ['','','L','','D','','','','','','P','','A','','','','C','P','U',''],
    ['','','','','R','E','G','I','S','T','R','A','D','O','R','E','S','','',''],
    ['','','U','','E','','','','','','O','','','','','','','','',''],
    ['','F','L','A','S','H','','','','','M','A','S','S','A','','','','',''],
    ['','','A','','S','','','','','','','','','','','','','','',''],
    ['','','','','','','','','','','','','','','','','','','','']
];

// Números das dicas nas posições iniciais das palavras
const dicaNumbers = {
    '2,2': '5➞',   // ROM
    '1,10': '13➞',  // I5
    '0,11': '14🠗',   // i7
    '1,3': '4🠗',   // RAM
    '5,4': '11🠗',  // 
    '4,1': '9➞',   // DMA
    '6,0': '12➞',   // DATA
    '4,12': '16🠗',  // Q (QUAD)
    '8,2': '2🠗',   // ULA
    '7,15': '1➞', // CPU
    '8,3': '3➞',  // REGISTRADORES
    '10,0': '7➞', // FLASH
    '10,9': '8➞',// MASSA
    '3,2': '15🠗', // DUAL
    '5,10': '6🠗', // EPROM
    '6,16': '10🠗', // CS
};

// Função para inicializar a cruzadinha
function inicializar() {
    const cruzadinhaContainer = document.getElementById('cruzadinha');
    renderizar(cruzadinhaContainer, cruzadinhaRespostas);
}

// Renderiza a matriz, mostrando inputs apenas onde há letras
function renderizar(container, grid) {
    container.innerHTML = '';
    grid.forEach((row, rowIndex) => {
        const rowDiv = document.createElement('div');
        rowDiv.className = 'cruzadinha-row';
        
        row.forEach((cell, colIndex) => {
            const cellWrapper = document.createElement('div');
            cellWrapper.style.position = 'relative';
            cellWrapper.style.display = 'inline-block';

            const cellDiv = document.createElement('input');
            cellDiv.className = 'cruzadinha-cell';
            cellDiv.maxLength = 1;
            cellDiv.dataset.row = rowIndex;
            cellDiv.dataset.col = colIndex;

            // Adiciona o input para verificar cada letra
            cellDiv.addEventListener('input', (e) => {
                const valor = e.target.value.toUpperCase();
                if (valor === cruzadinhaRespostas[rowIndex][colIndex]) {
                    cellDiv.style.background = '#90EE90'; 
                } else {
                    cellDiv.style.background = 'white';
                }
            });

            if (cell === '') {
                cellDiv.disabled = true;
                cellDiv.style.background = '#eee';
            }

            // Adiciona o número da dica
            const dicaKey = `${rowIndex},${colIndex}`;
            if (dicaNumbers[dicaKey]) {
                const numberSpan = document.createElement('span');
                numberSpan.textContent = dicaNumbers[dicaKey];
                numberSpan.style.position = 'absolute';
                numberSpan.style.top = '0';
                numberSpan.style.left = '0';
                numberSpan.style.width = '100%';
                numberSpan.style.height = '100%';
                numberSpan.style.display = 'flex';
                numberSpan.style.alignItems = 'center';
                numberSpan.style.justifyContent = 'center';
                numberSpan.style.fontSize = '14px';
                numberSpan.style.color = 'gray';
                numberSpan.style.pointerEvents = 'none';
                cellWrapper.appendChild(numberSpan);
            }

            cellWrapper.appendChild(cellDiv);
            rowDiv.appendChild(cellWrapper);
        });
        container.appendChild(rowDiv);
    });
}

// Checa as respostas
async function verificar() {
    let correct = true;
    document.querySelectorAll('.cruzadinha-cell').forEach(input => {
        const row = input.dataset.row;
        const col = input.dataset.col;
        if (cruzadinhaRespostas[row][col] && !input.disabled) {
            if (input.value.toUpperCase() !== cruzadinhaRespostas[row][col]) {
                input.style.background = 'red';
                correct = false;
            } else {
                input.style.background = 'green';
            }

            setTimeout(() => {
                input.style.background = 'white';

    },3000)
        }

        
    });
    if (correct) alert('Parabéns! Você completou a cruzadinha!');

    
}

// Inicializa ao carregar
inicializar();