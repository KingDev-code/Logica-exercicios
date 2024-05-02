algoritmo "PilhaDuplamenteEncadeada"

var
    topo: ponteiro

registro
    NoPilha:
        item: inteiro
        prox: ponteiro
        ant: ponteiro

funcao EstaVazia(): logico
inicio
    retorna topo = nulo
fim

procedimento Empilhar(item: inteiro)
var
    novo_no: ponteiro
inicio
    novo_no := ponteiro para NoPilha
    novo_no^.item := item
    se EstaVazia() entao
        topo := novo_no
    senao
        novo_no^.prox := topo
        topo^.ant := novo_no
        topo := novo_no
    fimse
fim

funcao Desempilhar(): inteiro
var
    item: inteiro
inicio
    se EstaVazia() entao
        escreva("Pilha vazia, não é possível desempilhar.")
        retorne -1  // Valor arbitrário para indicar erro
    item := topo^.item
    topo := topo^.prox
    se topo <> nulo entao
        topo^.ant := nulo
    fimse
    retorne item
fim

inicio
    topo := nulo

    // Exemplo de uso
    Empilhar(1)
    Empilhar(2)
    Empilhar(3)
    escreval(Desempilhar())  // Saída: 3
    escreval(Desempilhar())  // Saída: 2
fimalgoritmo
