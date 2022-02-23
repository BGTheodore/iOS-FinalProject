
//
//  MyCollectionViewController.swift
//  mbds
//
//  Created by mbdse on 23/02/2022.
//

import UIKit

private let reuseIdentifier = "myCell"

class MyCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    struct Todo: Decodable {
        let userId: Int
        let title: String
        let body: String
        let id: Int
    }
   // var library = [String]()
    var listTodo = [Todo]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                print("An error occurezd: ", err)
                return
            }
            guard let data = data else { return }
            guard let result: [Todo] = try? JSONDecoder().decode([Todo].self, from: data) else { return }
            
            DispatchQueue.main.async {
                            self.collectionView.reloadData()
                        }
            self.listTodo = result
            //print(self.listTodo)
        }
        task.resume()
        
        // Register cell classes
        self.collectionView!.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
       
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listTodo.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MyCollectionViewCell
    
        // Configure the cell
        //let activeStr: String = library[indexPath.row]
        
       
        let activeStr: Todo = self.listTodo[indexPath.row]
        cell.myLabel.text = activeStr.title
        return cell
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 50)
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
