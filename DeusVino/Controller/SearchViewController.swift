import UIKit

class SearchViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UISearchBarDelegate {
    @IBOutlet private weak var wineTypePicker: UIPickerView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
    private let wineService = WineService()
    private let wineTypes = ["reds", "whites", "roses"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wineTypePicker.delegate = self
        wineTypePicker.dataSource = self
        searchBar.delegate = self
    }
    
    // MARK: - UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return wineTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return wineTypes[row]
    }
    
    // MARK: - UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedWineType = wineTypes[row]
        fetchWines(for: selectedWineType) { result in
            // Handle the result here
            switch result {
            case .success(let wineList):
                // Access the wines in wineList
                for wine in wineList.wines {
                    let wineType = wine.type
                    print("Wine Type: \(wineType.rawValue)")
                    // Handle other tasks with the wines
                }
                
            case .failure(let error):
                print("Error: \(error)")
                // Handle the error
            }
        }
    }
    
    // MARK: - UISearchBarDelegate
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchQuery = searchBar.text {
            // Assuming you want to search for the entered query, modify the fetchWines method accordingly
            fetchWines(for: searchQuery) { result in
                // Handle the result here
                switch result {
                case .success(let wineList):
                    // Access the wines in wineList
                    for wine in wineList.wines {
                        let wineType = wine.type
                        print("Wine Type: \(wineType.rawValue)")
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
    
    // MARK: - Wine API
    private func fetchWines(for wineType: String, completion: @escaping (Result<WineList, Error>) -> Void) {
        wineService.fetchWines(for: wineType) { result in
            completion(result)
        }
    }
}
