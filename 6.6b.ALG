algoritmo "ListaCircular"

var
    comeco: ponteiro

registro
    NoLista:
        item: inteiro
        prox: ponteiro

procedimento Remove(item: inteiro)
var
    atual, anterior: ponteiro
inicio
    se comeco = nulo entao
        escreval("Lista vazia!")
        retorne
    senao
        atual := comeco
        anterior := nulo
        enquanto verdadeiro faca
            se atual^.item = item entao
                se atual = comeco entao  // Remover o primeiro elemento
                    se comeco^.prox = comeco entao  // Lista tem apenas um elemento
                        comeco := nulo
                    senao
                        comeco := comeco^.prox
                        anterior^.prox := comeco
                    fimse
                senao
                    anterior^.prox := atual^.prox
                fimse
                libere atual
                retorne
            fimse
            anterior := atual
            atual := atual^.prox
            se atual = comeco entao
                escreval("Elemento não encontrado na lista!")
                retorne
            fimse
        fimenquanto
    fimse
fim

inicio
    comeco := nulo

    // Exemplo de uso
    Remove(1)  // Tentando remover em uma lista vazia
fimalgoritmo
