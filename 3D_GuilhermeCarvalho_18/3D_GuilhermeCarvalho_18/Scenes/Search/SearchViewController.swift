
import UIKit


class SearchViewController: UIViewController {
    @IBOutlet weak var btnSalvar: UIButton!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var lblDetalhes: UILabel!
    
    private var PokemonAsalvar: Pokemon? = nil
    var delegate: PokemonProtocol? = nil
    private var service: PokemonService? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.service = PokemonService()
        self.createButton()
    }
    
    private func createButton() {
        
        let item = UIBarButtonItem(barButtonSystemItem: .search,
                                   target: self,
                                   action: #selector(searchPokemon))
        self.navigationItem.rightBarButtonItem = item

    }
    
    @objc private func searchPokemon(_ sender: UIBarButtonItem) {
        PokemonAsalvar = nil
        sender.isEnabled = false
        self.btnSalvar.isEnabled = false
        self.image.image = UIImage(systemName: "questionmark")
        self .lblDetalhes.text = "Loading..."
        
        self.service?.load { [weak self] response in
            guard let self = self else { return }
            
            switch response {
            case .success(let pokemon):
                if let imageUrl = pokemon.sprites?.front_default {
                    self.image.loadFromUrl(imageUrl)
                }
                self.lblDetalhes.text = pokemon.toString()
                self.PokemonAsalvar = pokemon
                self.btnSalvar.isEnabled = true
                
            case .failure(let error):
                self.image.image = UIImage(systemName: "exclamationmark.icloud")
                self .lblDetalhes.text = error.localizedDescription
            }
            sender.isEnabled = true
        }
    }
    
    @IBAction func save(_ sender: Any) {
        if let bichinho = PokemonAsalvar,
        let localDelegate = delegate {
            
            localDelegate.save(pokemon: bichinho)
            self.navigationController?.popViewController(animated: true)
        }
    }
}


