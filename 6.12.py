class Nomes:
    def __init__(self):
        self.nomes_homem = []
        self.nomes_mulher = []

    def incluir_nome_homem(self, nome):
        self.nomes_homem.append(nome)

    def incluir_nome_mulher(self, nome):
        self.nomes_mulher.append(nome)

    def incluir_nome(self, nome, sexo):
        if sexo.lower() == 'homem':
            self.nomes_homem.append(nome)
        elif sexo.lower() == 'mulher':
            self.nomes_mulher.append(nome)
        else:
            print("Sexo inválido. Use 'homem' ou 'mulher'.")

    def excluir_nome_homem(self, nome):
        if nome in self.nomes_homem:
            self.nomes_homem.remove(nome)
        else:
            print(f"O nome {nome} não está na lista de homens.")

    def excluir_nome_mulher(self, nome):
        if nome in self.nomes_mulher:
            self.nomes_mulher.remove(nome)
        else:
            print(f"O nome {nome} não está na lista de mulheres.")

    def localizar_e_excluir_nome(self, nome, sexo):
        if sexo.lower() == 'homem':
            if nome in self.nomes_homem:
                self.nomes_homem.remove(nome)
            else:
                print(f"O nome {nome} não está na lista de homens.")
        elif sexo.lower() == 'mulher':
            if nome in self.nomes_mulher:
                self.nomes_mulher.remove(nome)
            else:
                print(f"O nome {nome} não está na lista de mulheres.")
        else:
            print("Sexo inválido. Use 'homem' ou 'mulher'.")

    def localizar_e_alterar_nome(self, nome, sexo, novo_nome, novo_sexo):
        if sexo.lower() == 'homem':
            if nome in self.nomes_homem:
                index = self.nomes_homem.index(nome)
                self.nomes_homem[index] = novo_nome
            else:
                print(f"O nome {nome} não está na lista de homens.")
        elif sexo.lower() == 'mulher':
            if nome in self.nomes_mulher:
                index = self.nomes_mulher.index(nome)
                self.nomes_mulher[index] = novo_nome
            else:
                print(f"O nome {nome} não está na lista de mulheres.")
        else:
            print("Sexo inválido. Use 'homem' ou 'mulher'.")

    def listar_nomes(self):
        print("Nomes de homens:", self.nomes_homem)
        print("Nomes de mulheres:", self.nomes_mulher)


# Exemplo de uso
nomes = Nomes()
nomes.incluir_nome_homem("João")
nomes.incluir_nome_mulher("Maria")
nomes.listar_nomes()

nomes.incluir_nome("Pedro", "homem")
nomes.incluir_nome("Ana", "mulher")
nomes.listar_nomes()

nomes.excluir_nome_homem("João")
nomes.excluir_nome_mulher("Maria")
nomes.listar_nomes()

nomes.localizar_e_excluir_nome("Pedro", "homem")
nomes.localizar_e_excluir_nome("Ana", "mulher")
nomes.listar_nomes()

nomes.localizar_e_alterar_nome("José", "homem", "Carlos", "homem")
nomes.localizar_e_alterar_nome("Mariana", "mulher", "Camila", "mulher")
nomes.listar_nomes()
