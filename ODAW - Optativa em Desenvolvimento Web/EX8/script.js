document.addEventListener('DOMContentLoaded', (event) => {
    const financeForm = document.getElementById('financeForm');
    const incomeTable = document.getElementById('incomeTable').getElementsByTagName('tbody')[0];
    const expenseTable = document.getElementById('expenseTable').getElementsByTagName('tbody')[0];

    function updateTotal(tableId, totalId) {
        let table = document.getElementById(tableId);
        let rows = table.getElementsByTagName('tbody')[0].getElementsByTagName('tr');
        let total = 0;

        for (let i = 0; i < rows.length; i++) {
            let cells = rows[i].getElementsByTagName('td');
            let valueCell = cells[2];
            let value = parseFloat(valueCell.innerText.replace('R$ ', '').replace(',', '.').replace('.', ''));
            total += value;
        }

        document.getElementById(totalId).innerText = 'R$ ' + (total/100).toFixed(2).replace('.', ',');
    }

    financeForm.addEventListener('submit', function(e) {
        e.preventDefault();

        const type = document.getElementById('type').value;
        let date = document.getElementById('date').value;
        const category = document.getElementById('category').value;
        let value = parseFloat(document.getElementById('value').value) * 100; // Convertendo para centavos

        // Validar a data usando uma expressão regular
        const dateRegex = /^\d{4}-\d{2}-\d{2}$/;
        if (!dateRegex.test(date)) {
            alert('Por favor, insira uma data válida.');
            return;
        }

        // Converter a data para o formato DD/MM/AAAA
        date = date.split('-').reverse().join('/');

        const newRow = document.createElement('tr');
        const dateCell = document.createElement('td');
        const categoryCell = document.createElement('td');
        const valueCell = document.createElement('td');

        dateCell.textContent = date;
        categoryCell.textContent = category;
        valueCell.textContent = 'R$ ' + (value/100).toFixed(2).replace('.', ','); // Convertendo de volta para reais

        // Adicionar estilo de negrito às células
        dateCell.style.fontWeight = 'bold';
        categoryCell.style.fontWeight = 'bold';
        valueCell.style.fontWeight = 'bold';

        newRow.appendChild(dateCell);
        newRow.appendChild(categoryCell);
        newRow.appendChild(valueCell);

        if (type === 'receita') {
            incomeTable.appendChild(newRow);
        } else {
            expenseTable.appendChild(newRow);
        }

        // Limpar o formulário após a submissão
        financeForm.reset();

        // Atualize os totais
        updateTotal('incomeTable', 'incomeTotal');
        updateTotal('expenseTable', 'expenseTotal');
    });

    // Rotaciona a imagem e adiciona efeito de entrada da lista de features
    const stonksInner = document.querySelector('#stonks-inner');
    stonksInner.style.animation = 'rotate 5s linear infinite';

    const mainTitle = document.querySelector('#main-title');
    const featuresTitle = document.querySelector('#features-title');
    const featuresListItems = document.querySelectorAll('#features-list li');
    const dataTitle = document.querySelector('#data-title');

    mainTitle.classList.add('fade-in-fast');
    featuresTitle.classList.add('fade-in-fast');
    dataTitle.classList.add('fade-in-fast');
    featuresListItems.forEach((item) => {
        item.style.animation = `fadeIn 2s ease-in-out 0s forwards`;
        item.classList.add('fade-in');
    });
});
