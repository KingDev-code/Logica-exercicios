class Vinho:
    def __init__(self, produto, casta, safra):
        self.produto = produto
        self.casta = casta
        self.safra = safra

class Adega:
    def __init__(self):
        self.vinhos = []

    def incluir_vinho(self, produto, casta, safra):
        novo_vinho = Vinho(produto, casta, safra)
        self.vinhos.append(novo_vinho)

    def abrir_ocasiao_especial(self):
        if not self.vinhos:
            print("A adega está vazia, não há vinho para abrir.")
        else:
            ultimo_vinho = self.vinhos[-1]
            print(f"Vinho a ser aberto em uma ocasião especial: {ultimo_vinho.produto}, Safra: {ultimo_vinho.safra}")

    def listar_aquisicoes_antigas(self):
        if not self.vinhos:
            print("A adega está vazia.")
        else:
            print("As cinco aquisições mais antigas:")
            for vinho in self.vinhos[-5:]:
                print(f"Produto: {vinho.produto}, Safra: {vinho.safra}")

# Exemplo de uso
adega = Adega()
adega.incluir_vinho("Vinho A", "Cabernet Sauvignon", 2015)
adega.incluir_vinho("Vinho B", "Merlot", 2017)
adega.incluir_vinho("Vinho C", "Chardonnay", 2019)
adega.incluir_vinho("Vinho D", "Pinot Noir", 2020)
adega.incluir_vinho("Vinho E", "Sauvignon Blanc", 2016)

adega.abrir_ocasiao_especial()
adega.listar_aquisicoes_antigas()
