algoritmo "Adega"

registro
    Vinho:
        produto: caractere
        casta: caractere
        safra: inteiro

var
    vinhos: vetor[1..100] de Vinho
    quantidade_vinhos: inteiro

funcao AdegaVazia(): logico
inicio
    retorna quantidade_vinhos = 0
fim

procedimento IncluirVinho(produto, casta: caractere, safra: inteiro)
inicio
    se quantidade_vinhos < 100 entao
        quantidade_vinhos := quantidade_vinhos + 1
        vinhos[quantidade_vinhos].produto := produto
        vinhos[quantidade_vinhos].casta := casta
        vinhos[quantidade_vinhos].safra := safra
    senao
        escreval("A adega está cheia, não é possível incluir mais vinhos.")
    fimse
fim

procedimento AbrirOcasiaoEspecial()
inicio
    se AdegaVazia() entao
        escreval("A adega está vazia, não há vinho para abrir.")
    senao
        escreval("Vinho a ser aberto em uma ocasião especial: " + vinhos[quantidade_vinhos].produto + ", Safra: " + vinhos[quantidade_vinhos].safra)
    fimse
fim

procedimento ListarAquisicoesAntigas()
var
    i: inteiro
inicio
    se AdegaVazia() entao
        escreval("A adega está vazia.")
    senao
        escreval("As cinco aquisições mais antigas:")
        para i de quantidade_vinhos - 4 ate quantidade_vinhos faca
            escreval("Produto: " + vinhos[i].produto + ", Safra: " + vinhos[i].safra)
        fimpara
    fimse
fim

inicio
    quantidade_vinhos := 0

    // Exemplo de uso
    IncluirVinho("Vinho A", "Cabernet Sauvignon", 2015)
    IncluirVinho("Vinho B", "Merlot", 2017)
    IncluirVinho("Vinho C", "Chardonnay", 2019)
    IncluirVinho("Vinho D", "Pinot Noir", 2020)
    IncluirVinho("Vinho E", "Sauvignon Blanc", 2016)

    AbrirOcasiaoEspecial()
    ListarAquisicoesAntigas()
fimalgoritmo