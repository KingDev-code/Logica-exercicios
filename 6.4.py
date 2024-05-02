class Lista:
    def __init__(self):
        self.lista = [None] * 101
        self.comeco = 0

    def existe(self, posicao):
        if self.comeco == 0:
            return False
        i = self.comeco
        while i!= 0:
            if self.lista[i] is not None and self.lista[i].prox == posicao:
                return True
            i = self.lista[i].prox
        return False

    def novo(self):
        i = 1
        while i <= 100:
            if self.lista[i] is None or self.lista[i].item == "":
                if self.lista[i] is None:
                    self.lista[i] = Elem(i)
                return i
            i += 1
        return 0

    def insere(self, info, antecessor):
        if not self.existe(antecessor):
            print("Antecessor não pertence à lista!")
            return
        pos = self.novo()
        if pos == 0:
            print("Não existem mais posições disponíveis!")
            return
        self.lista[pos] = Elem(info)
        if self.comeco == 0:
            self.comeco = pos
            self.lista[pos].prox = 0
        else:
            self.lista[pos].prox = antecessor
            self.lista[antecessor].prox = pos

class Elem:
    def __init__(self, item):
        self.item = item
        self.prox = 0

if __name__ == "__main__":
    lista = Lista()

    # Testando os módulos
    print(lista.existe(1))  # Deve retornar False, pois não há elementos na lista ainda
    print(lista.novo())  # Deve retornar 1, pois é a primeira posição disponível na lista
    lista.insere("A", 0)  # Inserindo "A" na primeira posição
    lista.insere("B", 1)  # Inserindo "B" após "A"
    lista.insere("C", 2)  # Inserindo "C" após "B"