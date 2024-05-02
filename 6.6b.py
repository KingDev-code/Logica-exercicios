class ListaCircular:
    def __init__(self):
        self.comeco = None

    # Métodos Existe e Novo continuam iguais ao Algoritmo 6.2

    def Remove(self, item):
        if self.comeco is None:
            print("Lista vazia!")
            return
        atual = self.comeco
        anterior = None
        while True:
            if atual.item == item:
                if atual == self.comeco:  # Remover o primeiro elemento
                    if self.comeco.prox == self.comeco:  # Lista tem apenas um elemento
                        self.comeco = None
                    else:
                        self.comeco = self.comeco.prox
                        anterior.prox = self.comeco
                else:
                    anterior.prox = atual.prox
                del atual
                return
            anterior = atual
            atual = atual.prox
            if atual == self.comeco:
                break
        print("Elemento não encontrado na lista!")

# Exemplo de uso
lista_circular = ListaCircular()
lista_circular.Remove(1)  # Tentando remover em uma lista vazia
