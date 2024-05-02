class NoLista:
    def __init__(self, item=None, prox=None, ant=None):
        self.item = item
        self.prox = prox
        self.ant = ant

class ListaDuplamenteEncadeada:
    def __init__(self):
        self.comeco = None
        self.fim = None

    def Existe(self, posicao):
        atual = self.comeco
        while atual is not None:
            if atual.item == posicao:
                return True
            atual = atual.prox
        return False

    def Novo(self):
        novo = NoLista()
        novo.ant = None
        if self.comeco is None:
            self.comeco = novo
            self.fim = novo
        else:
            novo.ant = self.fim
            self.fim.prox = novo
            self.fim = novo
        return novo

    def Insere(self, info, antecessor):
        if not self.Existe(antecessor):
            print("Antecessor não pertence à lista!")
        else:
            pos = self.Novo()
            pos.item = info
            atual = self.comeco
            while atual is not None and atual.item != antecessor:
                atual = atual.prox
            if atual.ant is None:
                pos.prox = self.comeco
                self.comeco.ant = pos
                self.comeco = pos
            else:
                pos.prox = atual
                pos.ant = atual.ant
                atual.ant.prox = pos
                atual.ant = pos

# Testando o algoritmo
lista = ListaDuplamenteEncadeada()
lista.Insere(10, None)  # Insere o elemento 10 na lista
lista.Insere(20, 10)  # Insere o elemento 20 após o elemento 10
lista.Insere(30, 20)  # Insere o elemento 30 após o elemento 20
lista.Insere(40, 30)  # Insere o elemento 40 após o elemento 30