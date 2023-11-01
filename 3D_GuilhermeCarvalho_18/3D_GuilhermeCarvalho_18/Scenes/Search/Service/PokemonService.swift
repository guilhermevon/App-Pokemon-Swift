class PokemonService: BaseService {
    func load(completion: @escaping(Result<Pokemon, Error>) -> Void) {
        
        let route = PokemonRequest()
        
        self.performRequest(route: route) { result in
            
            completion(result)
        }
    }
}
