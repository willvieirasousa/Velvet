
function togglePaymentSelection(button) {

    const buttons = document.querySelectorAll('.payment-btn');
    buttons.forEach(btn => {
        btn.classList.remove('selected');
    });

    button.classList.add('selected');
}


function validarMes(event) {
    const mes = event.target.value;
    if (mes.length === 2) {
        if (parseInt(mes) > 12) {
            event.target.value = '12';
        }
    }
}

function validarAno(event) {
    const ano = event.target.value;

    if (ano.length === 4) {
        if (parseInt(ano) <= 2024) {
            event.target.setCustomValidity("O ano deve ser maior que 2024");
        } else {
            event.target.setCustomValidity("");
        }
    }
}


function onlyNumbers(event) {
    const input = event.target;

    input.value = input.value.replace(/[^0-9]/g, '');

    if (input.value.length > 14) {
        input.value = input.value.slice(0, 14);
    }
}

function toggleCVVInfo() {
    const tooltip = document.querySelector('.cvv-tooltip');
    tooltip.style.display = (tooltip.style.display === 'block') ? 'none' : 'block';
}


function hideCVVInfo(event) {
    const tooltip = document.querySelector('.cvv-tooltip');
    const cvvContainer = document.querySelector('.cvv-container');


    if (!cvvContainer.contains(event.target)) {
        tooltip.style.display = 'none';
    }
}

document.addEventListener('click', hideCVVInfo);


document.getElementById("numero-cartao").addEventListener("input", function (event) {
    let input = event.target;
    let value = input.value.replace(/\s+/g, "");
    value = value.replace(/\D/g, "");

    if (value.length > 16) {
        value = value.slice(0, 16);
    }
	
    let formattedValue = value.match(/.{1,4}/g)?.join(" ") || value;

    input.value = formattedValue;
});
