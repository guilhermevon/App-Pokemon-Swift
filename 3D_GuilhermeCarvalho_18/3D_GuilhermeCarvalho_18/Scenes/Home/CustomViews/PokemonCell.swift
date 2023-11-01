
import UIKit


class PokemonCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var pkImageView: UIImageView!
    
    func populate(pokemon: Pokemon) {
        if let nome = pokemon.name {
            titleLabel.text = nome
            descriptionLabel.text = pokemon.toString()
            
            if let imageUrl = pokemon.sprites?.front_default {
              pkImageView.loadFromUrl(imageUrl)
            }
        }
    }
}
