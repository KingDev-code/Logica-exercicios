class NoListaCircular:
    def __init__(self, item=None):
        self.item = item
        self.prox = None

class FilaCircular:
    def __init__(self):
        self.comeco = None
        self.fim = None

    def EstaVazia(self):
        return self.comeco is None

    def Enfileirar(self, item):
        novo_no = NoListaCircular(item)
        if self.EstaVazia():
            novo_no.prox = novo_no  # O novo nó aponta para ele mesmo
            self.comeco = novo_no
        else:
            novo_no.prox = self.comeco.prox
            self.comeco.prox = novo_no
        self.fim = novo_no

    def Desenfileirar(self):
        if self.EstaVazia():
            print("Fila vazia, não é possível desenfileirar.")
            return None
        item = self.comeco.prox.item
        if self.comeco.prox == self.fim:
            self.comeco = None
            self.fim = None
        else:
            self.comeco.prox = self.comeco.prox.prox
        return item

# Exemplo de uso
fila = FilaCircular()
fila.Enfileirar(1)
fila.Enfileirar(2)
fila.Enfileirar(3)
print(fila.Desenfileirar())  # Saída: 1
print(fila.Desenfileirar())  # Saída: 2
