# 🧩 Pokémon App SWIFT – UIKit + API

Aplicativo iOS desenvolvido com **UIKit**, que consome dados da **PokéAPI** para exibir uma lista de Pokémons com seus detalhes visuais e técnicos.


<img src="https://guilhermevon.github.io/portfolio-guilherme/imagens/apkPokemon.png" alt="Pokemons">

## 📱 Funcionalidades

- 🔍 Busca de Pokémons via PokéAPI
- 📄 Listagem com imagens e nomes
- 🧾 Tela de detalhes com stats, tipos, habilidades e imagens
- 🔄 Atualização dinâmica via requisições HTTP
- ✅ Interface 100% UIKit (sem SwiftUI)
- ⚙️ Navegação com **UIViewController** e **UINavigationController**

## 🛠 Tecnologias Utilizadas

- Swift 5
- UIKit
- ViewController padrão (programação sem Storyboard)
- [PokéAPI](https://pokeapi.co/)
- URLSession ou [Alamofire](https://github.com/Alamofire/Alamofire) *(dependendo do que você usou)*

## 📦 Estrutura do Projeto

PokemonApp/
├── Models/
│   └── Pokemon.swift                 # Modelo com as propriedades do Pokémon
├── Views/
│   └── PokemonCell.swift             # Célula personalizada para exibir cada Pokémon na lista
├── ViewControllers/
│   ├── PokemonListViewController.swift    # Tela principal com a lista de Pokémons
│   └── PokemonDetailViewController.swift # Tela com os detalhes de cada Pokémon
├── Services/
│   └── APIService.swift              # Serviço responsável por consumir a PokéAPI
└── Resources/
    └── Assets.xcassets               # Recursos visuais como imagens e cores

## 🚀 Como Rodar o Projeto

1. Clone o repositório:
   ```bash
   git clone https://github.com/guilhermevon/App-Pokemon-Swift.git

# by: @guilhermevon
