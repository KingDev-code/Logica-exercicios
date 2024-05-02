class NoLista:
    def __init__(self, item=None):
        self.item = item
        self.prox = None

class ListaCircular:
    def __init__(self):
        self.comeco = None

    def Existe(self, posicao):
        if self.comeco is None:
            return False
        atual = self.comeco
        while True:
            if atual.item == posicao:
                return True
            atual = atual.prox
            if atual == self.comeco:
                break
        return False

    def Novo(self):
        novo = NoLista()
        if self.comeco is None:
            novo.prox = novo  # O novo nó aponta para ele mesmo
            self.comeco = novo
        else:
            novo.prox = self.comeco.prox
            self.comeco.prox = novo
        return novo

    def Insere(self, info, antecessor):
        if not self.Existe(antecessor):
            print("Antecessor não pertence à lista!")
        else:
            pos = self.Novo()
            pos.item = info
            atual = self.comeco
            while atual.item != antecessor:
                atual = atual.prox
            pos.prox = atual.prox
            atual.prox = pos

    def Remove(self, posicao):
        if self.comeco is None:
            print("Lista vazia, não há elementos para remover.")
            return
        atual = self.comeco
        anterior = None
        while True:
            if atual.item == posicao:
                if anterior:
                    anterior.prox = atual.prox
                    if atual == self.comeco:
                        self.comeco = atual.prox
                else:
                    self.comeco = None
                del atual
                return
            anterior = atual
            atual = atual.prox
            if atual == self.comeco:
                break
        print("Elemento não encontrado na lista.")

# Exemplo de uso
lista_circular = ListaCircular()
lista_circular.Insere(1, None)  # Insere o elemento 1 na lista
lista_circular.Remove(1)  # Remove o elemento 1 da lista
