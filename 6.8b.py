class NoListaCircularPrioridade:
    def __init__(self, item=None, prioridade=0):
        self.item = item
        self.prioridade = prioridade
        self.prox = None

class FilaCircularPrioridade:
    def __init__(self):
        self.comeco = None
        self.fim = None

    def EstaVazia(self):
        return self.comeco is None

    def Enfileirar(self, item, prioridade):
        novo_no = NoListaCircularPrioridade(item, prioridade)
        if self.EstaVazia():
            novo_no.prox = novo_no  # O novo nó aponta para ele mesmo
            self.comeco = novo_no
            self.fim = novo_no
        else:
            atual = self.comeco
            while atual.prox != self.comeco and atual.prox.prioridade >= prioridade:
                atual = atual.prox
            novo_no.prox = atual.prox
            atual.prox = novo_no
            self.fim = novo_no

    def Desenfileirar(self):
        if self.EstaVazia():
            print("Fila de prioridade vazia, não é possível desenfileirar.")
            return None
        item = self.comeco.item
        if self.comeco.prox == self.comeco:
            self.comeco = None
            self.fim = None
        else:
            self.comeco.prox = self.comeco.prox.prox
        return item

# Exemplo de uso
fila_prioridade = FilaCircularPrioridade()
fila_prioridade.Enfileirar("Tarefa 1", 2)
fila_prioridade.Enfileirar("Tarefa 2", 1)
fila_prioridade.Enfileirar("Tarefa 3", 3)
print(fila_prioridade.Desenfileirar())  # Saída: Tarefa 2
print(fila_prioridade.Desenfileirar())  # Saída: Tarefa 1
