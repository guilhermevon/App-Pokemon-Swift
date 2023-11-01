
import UIKit

class ViewController: UIViewController {
    private var list: [Pokemon] = []
    private let userDefaults = UserDefaults.standard
    private let listKey = "pokemonList"
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.table.dataSource = self
        self.table.delegate = self
        
        let fake = FakeViewController()
        self.navigationController?.pushViewController(fake, animated: false)
        
        self.loadList()
        self.table.reloadData()
    }
    
    private func loadList() {
        guard let data = userDefaults.object(forKey: listKey) as? Data else {
            return
        }
        do {
            let items = try JSONDecoder().decode([Pokemon].self, from: data)
            self.list = items
        } catch {
            print("Nao ha dados em disco que possam ser convertidos no tipo esperado")
        }
    }


    @IBAction func goToSearch(_ sender: Any) {
        let vc = SearchViewController()
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: PokemonProtocol {
    
    
    func save(pokemon: Pokemon) {
        if self.list.first(where: { $0.id == pokemon.id }) != nil {
            return
        }
        self.list.append(pokemon)
        do {
            let serialized = try JSONEncoder().encode(self.list)
            userDefaults.set(serialized, forKey: listKey)
            self.table.reloadData()
        } catch {
            self.list.removeAll(where: { $0.id == pokemon.id })
        }
    }
    
    func delete(pokemon: Pokemon) {
        let index = self.list.firstIndex(where: { $0.id == pokemon.id }) ?? -1
        self.list.removeAll(where: { $0.id == pokemon.id })
        do {
            let serialized = try JSONEncoder().encode(self.list)
            userDefaults.set(serialized, forKey: listKey)
            self.table.reloadData()
        } catch {
            //self.list.removeAll(where: { $0.id == pokemon.id })
            if index > -1 {
                self.list.insert(pokemon, at: index)
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? PokemonCell else {
            return UITableViewCell()
        }
        let item = self.list[indexPath.row]
        cell.populate(pokemon: item)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title: "Delete", handler: { [weak self] _,_,_ in
            
            guard let validSelf = self else { return }
            let item = validSelf.list[indexPath.row]
            validSelf.delete(pokemon: item)
        })
        
        deleteAction.backgroundColor = .red
        deleteAction.image = .init(systemName: "trash", withConfiguration: nil)
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

