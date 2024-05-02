algoritmo "FilaCircular"

var
    comeco, fim: ponteiro

registro
    NoListaCircular:
        item: inteiro
        prox: ponteiro

funcao EstaVazia(): logico
inicio
    retorna comeco = nulo
fim

procedimento Enfileirar(item: inteiro)
var
    novo_no: ponteiro
inicio
    novo_no := ponteiro para NoListaCircular
    novo_no^.item := item
    se EstaVazia() entao
        novo_no^.prox := novo_no  // O novo nó aponta para ele mesmo
        comeco := novo_no
    senao
        novo_no^.prox := comeco^.prox
        comeco^.prox := novo_no
    fimse
    fim := novo_no
fim

funcao Desenfileirar(): inteiro
var
    item: inteiro
inicio
    se EstaVazia() entao
        escreval("Fila vazia, não é possível desenfileirar.")
        retorne 0
    item := comeco^.prox^.item
    se comeco^.prox = fim entao
        comeco := nulo
        fim := nulo
    senao
        comeco^.prox := comeco^.prox^.prox
    fimse
    retorne item
fim

inicio
    comeco := nulo
    fim := nulo

    // Exemplo de uso
    Enfileirar(1)
    Enfileirar(2)
    Enfileirar(3)
    escreval(Desenfileirar())  // Saída: 1
    escreval(Desenfileirar())  // Saída: 2
fimalgoritmo
