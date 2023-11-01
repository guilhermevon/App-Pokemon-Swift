struct PokemonRequest: BaseRequestProtocol {
    var method: HttpMethod
    var basePath: String
    var path: String
    var body: Parameters?
    var headers: Headers?
    
    init(){
        let randomId = Int.random(in: 1..<1293)
        self.method = .get
        self.body = nil
        self.headers = nil
        self.basePath = "https://pokeapi.co/api/"
        self.path = "\(basePath)v2/pokemon/\(randomId)/"
        
    }
}
