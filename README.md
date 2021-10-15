# O desafio

Reproduzir a tela de início (Home) do app do KaBuM! atualmente disponível na App Store (iOS) ou Google Play (Android).

Obs.: Não é necessário desenvolver o banner rotativo do topo, nem o setor de Ofertas. Desenvolver apenas a listagem de "Produtos em destaque".

# Informações

Você pode obter a listagem de produtos no seguinte endpoint

@GET (https://servicespub.prod.api.aws.grupokabum.com.br/home/v1/home/produto)
utilizando os seguintes parâmetros

app: Int -> indicação de origem, app = 1

limite: Int -> limite de produtos por página

pagina: Int -> offset da página a ser carregada

# Requisitos

Utilizar Swift (iOS) ou Kotlin (Android)

Arquitetura MVC

Código comentado no que for necessário para entendimento

Infinite Scrolling com paginação de 10 produtos, exibindo indicador de loading ao final da listagem

O código deve possuir bom desempenho, sem travamentos
