algoritmo "FilaPrioridade"

var
    comeco, fim: ponteiro

registro
    NoLista:
        item: caractere
        prioridade: inteiro
        prox: ponteiro
        ant: ponteiro

funcao EstaVazia(): logico
inicio
    retorna comeco = nulo
fim

procedimento Enfileirar(item: caractere, prioridade: inteiro)
var
    novo_no, atual: ponteiro
inicio
    novo_no := ponteiro para NoLista
    novo_no^.item := item
    novo_no^.prioridade := prioridade
    se EstaVazia() entao
        comeco := novo_no
        fim := novo_no
    senao
        atual := comeco
        enquanto atual <> nulo e prioridade <= atual^.prioridade faca
            atual := atual^.prox
        fimenquanto
        se atual = nulo entao  // O novo nó tem a menor prioridade
            fim^.prox := novo_no
            novo_no^.ant := fim
            fim := novo_no
        senao se atual^.ant = nulo entao  // O novo nó tem a maior prioridade
            novo_no^.prox := comeco
            comeco^.ant := novo_no
            comeco := novo_no
        senao  // O novo nó tem prioridade intermediária
            novo_no^.prox := atual
            novo_no^.ant := atual^.ant
            atual^.ant^.prox := novo_no
            atual^.ant := novo_no
        fimse
    fimse
fim

funcao Desenfileirar(): caractere
var
    item: caractere
inicio
    se EstaVazia() entao
        escreval("Fila de prioridade vazia, não é possível desenfileirar.")
        retorne ""
    item := comeco^.item
    comeco := comeco^.prox
    se comeco = nulo entao
        fim := nulo
    senao
        comeco^.ant := nulo
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
