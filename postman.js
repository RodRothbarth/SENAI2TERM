function CEP(){
    let resultado = document.getElementById('resultado')
    let cep = document.getElementById('cep').value 
    let url = `http://viacep.com.br/ws/${cep}/json`;
    let request = new XMLHttpRequest(); //instancia method, process to exe function.
    request.open('GET', url, false); //"true" quando for assincrono
    request.send(null);//to do the methods "green light"

    let teste = JSON.parse(request.responseText);
    resultado.innerHTML = teste.cep
}
