algoritmo "FilaCircularPrioridade"

var
    comeco, fim: ponteiro

registro
    NoListaCircularPrioridade:
        item: caractere
        prioridade: inteiro
        prox: ponteiro

funcao EstaVazia(): logico
inicio
    retorna comeco = nulo
fim

procedimento Enfileirar(item: caractere, prioridade: inteiro)
var
    novo_no, atual: ponteiro
inicio
    novo_no := ponteiro para NoListaCircularPrioridade
    novo_no^.item := item
    novo_no^.prioridade := prioridade
    se EstaVazia() entao
        novo_no^.prox := novo_no  // O novo nó aponta para ele mesmo
        comeco := novo_no
        fim := novo_no
    senao
        atual := comeco
        enquanto atual^.prox <> comeco e atual^.prox^.prioridade >= prioridade faca
            atual := atual^.prox
        fimenquanto
        novo_no^.prox := atual^.prox
        atual^.prox := novo_no
        fim := novo_no
    fimse
fim

funcao Desenfileirar(): caractere
var
    item: caractere
inicio
    se EstaVazia() entao
        escreva("Fila de prioridade vazia, não é possível desenfileirar.")
        retorne ""
    item := comeco^.item
    se comeco^.prox = comeco entao
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
    Enfileirar("Tarefa 1", 2)
    Enfileirar("Tarefa 2", 1)
    Enfileirar("Tarefa 3", 3)
    escreval(Desenfileirar())  // Saída: Tarefa 2
    escreval(Desenfileirar())  // Saída: Tarefa 1
fimalgoritmo
