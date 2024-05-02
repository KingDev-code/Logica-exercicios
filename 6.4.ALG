algoritmo "Lista_Encadeada"

funcao existe(posicao: inteiro): logico
inicio
    se comeco = 0 entao
        retorna Falso
    senao
        i := comeco
        enquanto i <> 0 faca
            se lista[i].prox = posicao entao
                retorna Verdadeiro
            fimse
            i := lista[i].prox
        fimenquanto
        retorna Falso
    fimse
fim

funcao novo(): inteiro
inicio
    i := 1
    enquanto i <= 100 faca
        se lista[i].item = "" entao
            se i = 100 entao
                retorna 0
            senao
                se lista[i].prox = 0 entao
                    lista[i].prox := i + 1
                fimse
                retorna i
            fimse
        fimse
        i := i + 1
    fimenquanto
fim

procedimento insere(info: caractere, antecessor: inteiro)
var
    pos: inteiro
inicio
    se nao existe(antecessor) entao
        escreva("Antecessor nao pertence a lista!")
    senao
        pos := novo()
        se pos = 0 entao
            escreva("Nao existem mais posicoes disponiveis!")
        senao
            lista[pos].item := info
            se comeco = 0 entao
                comeco := pos
                lista[pos].prox := 0
            senao
                lista[pos].prox := lista[antecessor].prox
                lista[antecessor].prox := pos
            fimse
        fimse
    fimse
fim

inicio
var
    lista: vetor[1..100] de registro
        item: caractere
        prox: inteiro
    comeco: inteiro
    comeco := 0

    // Testando os modulos
    se nao existe(1) entao
        escreva("Deve retornar Falso, pois nao ha elementos na lista ainda")
    senao
        escreva("Erro na funcao existe!")
    fimse

    se novo() = 1 entao
        escreva("Deve retornar 1, pois e a primeira posicao disponivel na lista")
    senao
        escreva("Erro na funcao novo!")
    fimse

    insere("A", 0)  // Inserindo "A" na primeira posicao
    insere("B", 1)  // Inserindo "B" apos "A"
    insere("C", 2)  // Inserindo "C" apos "B"
fimalgoritmo