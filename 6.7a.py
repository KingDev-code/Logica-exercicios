class NoLista:
    def __init__(self, item=None):
        self.item = item
        self.prox = None
        self.ant = None

class Fila:
    def __init__(self):
        self.comeco = None
        self.fim = None

    def EstaVazia(self):
        return self.comeco is None

    def Enfileirar(self, item):
        novo_no = NoLista(item)
        if self.EstaVazia():
            self.comeco = novo_no
        else:
            self.fim.prox = novo_no
            novo_no.ant = self.fim
        self.fim = novo_no

    def Desenfileirar(self):
        if self.EstaVazia():
            print("Fila vazia, não é possível desenfileirar.")
            return None
        item = self.comeco.item
        self.comeco = self.comeco.prox
        if self.comeco is None:
            self.fim = None
        else:
            self.comeco.ant = None
        return item

# Exemplo de uso
fila = Fila()
fila.Enfileirar(1)
fila.Enfileirar(2)
fila.Enfileirar(3)
print(fila.Desenfileirar())  # Saída: 1
print(fila.Desenfileirar())  # Saída: 2
