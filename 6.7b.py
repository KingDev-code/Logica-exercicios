class NoLista:
    def __init__(self, item=None, prioridade=0):
        self.item = item
        self.prioridade = prioridade
        self.prox = None
        self.ant = None

class FilaPrioridade:
    def __init__(self):
        self.comeco = None
        self.fim = None

    def EstaVazia(self):
        return self.comeco is None

    def Enfileirar(self, item, prioridade):
        novo_no = NoLista(item, prioridade)
        if self.EstaVazia():
            self.comeco = novo_no
            self.fim = novo_no
        else:
            atual = self.comeco
            while atual is not None and prioridade <= atual.prioridade:
                atual = atual.prox
            if atual is None:  # O novo nó tem a menor prioridade
                self.fim.prox = novo_no
                novo_no.ant = self.fim
                self.fim = novo_no
            elif atual.ant is None:  # O novo nó tem a maior prioridade
                novo_no.prox = self.comeco
                self.comeco.ant = novo_no
                self.comeco = novo_no
            else:  # O novo nó tem prioridade intermediária
                novo_no.prox = atual
                novo_no.ant = atual.ant
                atual.ant.prox = novo_no
                atual.ant = novo_no

    def Desenfileirar(self):
        if self.EstaVazia():
            print("Fila de prioridade vazia, não é possível desenfileirar.")
            return None
        item = self.comeco.item
        self.comeco = self.comeco.prox
        if self.comeco is None:
            self.fim = None
        else:
            self.comeco.ant = None
        return item

# Exemplo de uso
fila_prioridade = FilaPrioridade()
fila_prioridade.Enfileirar("Tarefa 1", 2)
fila_prioridade.Enfileirar("Tarefa 2", 1)
fila_prioridade.Enfileirar("Tarefa 3", 3)
print(fila_prioridade.Desenfileirar())  # Saída: Tarefa 2
print(fila_prioridade.Desenfileirar())  # Saída: Tarefa 1
