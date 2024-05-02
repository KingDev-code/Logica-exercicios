class NoPilhaAtivacao:
    def __init__(self, nome=None, retorno=None):
        self.nome = nome
        self.retorno = retorno
        self.prox = None

class PilhaAtivacaoCircular:
    def __init__(self):
        self.topo = None

    def EstaVazia(self):
        return self.topo is None

    def Empilhar(self, nome, retorno):
        novo_no = NoPilhaAtivacao(nome, retorno)
        if self.EstaVazia():
            novo_no.prox = novo_no  # Aponta para ele mesmo
            self.topo = novo_no
        else:
            novo_no.prox = self.topo
            self.topo = novo_no

    def Desempilhar(self):
        if self.EstaVazia():
            print("Pilha de ativação vazia, não é possível desempilhar.")
            return None
        nome = self.topo.nome
        self.topo = self.topo.prox
        if self.topo:
            atual = self.topo
            while atual.prox != self.topo:
                atual = atual.prox
            atual.prox = self.topo
        return nome

# Exemplo de uso
pilha_ativacao = PilhaAtivacaoCircular()
pilha_ativacao.Empilhar("Função A", "Main")
pilha_ativacao.Empilhar("Função B", "Função A")
pilha_ativacao.Empilhar("Função C", "Função B")
print(pilha_ativacao.Desempilhar())  # Saída: Função C
print(pilha_ativacao.Desempilhar())  # Saída: Função B