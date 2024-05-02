class NoPilhaAtivacao:
    def __init__(self, nome=None, retorno=None):
        self.nome = nome
        self.retorno = retorno
        self.prox = None
        self.ant = None

class PilhaAtivacaoDuplamenteEncadeada:
    def __init__(self):
        self.topo = None

    def EstaVazia(self):
        return self.topo is None

    def Empilhar(self, nome, retorno):
        novo_no = NoPilhaAtivacao(nome, retorno)
        if self.EstaVazia():
            self.topo = novo_no
        else:
            novo_no.prox = self.topo
            self.topo.ant = novo_no
            self.topo = novo_no

    def Desempilhar(self):
        if self.EstaVazia():
            print("Pilha de ativação vazia, não é possível desempilhar.")
            return None
        nome = self.topo.nome
        self.topo = self.topo.prox
        if self.topo:
            self.topo.ant = None
        return nome

# Exemplo de uso
pilha_ativacao = PilhaAtivacaoDuplamenteEncadeada()
pilha_ativacao.Empilhar("Função A", "Main")
pilha_ativacao.Empilhar("Função B", "Função A")
pilha_ativacao.Empilhar("Função C", "Função B")
print(pilha_ativacao.Desempilhar())  # Saída: Função C
print(pilha_ativacao.Desempilhar())  # Saída: Função B