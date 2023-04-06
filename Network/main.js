let array_job = ['job','jab','jub']
let resposta = ''
async function Obter(){
    const dados = await fetch('./Network/request.php',{
        header:"Access-Control-Allow-Origin : *,Access-Control-Allow-Credentials : true",
        method: "POST",
    });
    resposta = await dados.json();
    console.log(resposta)
}
function construtor(){
    const main = document.querySelector('main')
    array_job.forEach(element => {
        let molde = document.createElement('span')
        molde.innerHTML = element
        main.appendChild(molde)
    })
}
Obter()
construtor()