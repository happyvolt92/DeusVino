import UIKit


class SearchViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var RedWineSorterButton: UIButton!
    @IBOutlet weak var WhiteWineSorterButton: UIButton!
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet weak var RoseWineSorterButon: UIButton!
    
    
    private let wineService = WineService()

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }

    // Function called when the search button is clicked
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchQuery = searchBar.text {
            // Fetch wines based on the entered search query
            fetchWines(for: searchQuery) { result in
                // Handle the result here
                switch result {
                case .success(let wines):
                    // Access the wines in the array
                    for wine in wines {
                        let wineType = wine.type
                        print("Wine Type: \(wineType)")
                        // Handle other tasks with the wines
                    }

                case .failure(let error):
                    print("Error: \(error)")
                    // Handle the error
                }
            }
        }
        searchBar.resignFirstResponder()
    }

    // Function to fetch wines based on the entered search query
    private func fetchWines(for wineName: String, completion: @escaping (Result<[Wine], Error>) -> Void) {
        // Call the fetchWines function in WineService
        wineService.fetchWines(for: wineName) { result in
            completion(result)
        }
    }
}
