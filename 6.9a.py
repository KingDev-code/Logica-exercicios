class NoPilha:
    def __init__(self, item=None):
        self.item = item
        self.prox = None
        self.ant = None

class PilhaDuplamenteEncadeada:
    def __init__(self):
        self.topo = None

    def EstaVazia(self):
        return self.topo is None

    def Empilhar(self, item):
        novo_no = NoPilha(item)
        if self.EstaVazia():
            self.topo = novo_no
        else:
            novo_no.prox = self.topo
            self.topo.ant = novo_no
            self.topo = novo_no

    def Desempilhar(self):
        if self.EstaVazia():
            print("Pilha vazia, não é possível desempilhar.")
            return None
        item = self.topo.item
        self.topo = self.topo.prox
        if self.topo:
            self.topo.ant = None
        return item

# Exemplo de uso
pilha = PilhaDuplamenteEncadeada()
pilha.Empilhar(1)
pilha.Empilhar(2)
pilha.Empilhar(3)
print(pilha.Desempilhar())  # Saída: 3
print(pilha.Desempilhar())  # Saída: 2
