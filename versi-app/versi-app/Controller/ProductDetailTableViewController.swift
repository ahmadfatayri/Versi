//
//  ProductDetailTableViewController.swift
//  versi-app
//
//  Created by Ahmad Fatayri on 4/5/19.
//  Copyright © 2019 Ahmad Fatayri. All rights reserved.
//

import UIKit
import Lightbox

class ProductDetailTableViewController: UITableViewController {
    
    var relatedProducts: [Product]?
    var product: Product!
    
    @IBOutlet weak var productImagesHeaderView: ProductImagesHeaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = product.name
        
        tableView.estimatedRowHeight = self.tableView.rowHeight
        tableView.rowHeight = UITableView.automaticDimension
        
        ProductsService.instance.loadData(completion:  {data in
            self.relatedProducts = data
            self.tableView.reloadData()
        })
    }
    
    @objc func addToCart(_ sender: UIButton){ //<- needs `@objc`
        let vc = STORYBOARD.instantiateViewController(withIdentifier: PRODUCTVARIANTS) as! ProductVariantsVC
        vc.product = self.product
        //set anitmation for navigation
        let transition:CATransition = CATransition()
        transition.duration = 0.4
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromTop
        self.navigationController!.view.layer.add(transition, forKey: kCATransition)
        
        self.navigationController?.pushViewController(vc, animated: false)
        
    }
    
    @objc func checkout(_ sender: UIButton) {
        let vc = STORYBOARD.instantiateViewController(withIdentifier: CHECKOUT) as! CheckoutVC
        
        //set anitmation for navigation
        let transition:CATransition = CATransition()
        transition.duration = 0.4
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromTop
        self.navigationController!.view.layer.add(transition, forKey: kCATransition)
        
        self.navigationController?.pushViewController(vc, animated: false)
        
    }
    
    @objc func imageTapped(recognizer: UITapGestureRecognizer) {
        let images = [
            LightboxImage(imageURL: URL(string: self.product.qr_code!)!,
            text: "You can use this Qr Code to quick access to this product"
)
        ]
        
        // Create an instance of LightboxController.
        let controller = LightboxController(images: images)
        
        // Set delegates.
        controller.pageDelegate = self as? LightboxControllerPageDelegate
        controller.dismissalDelegate = self as? LightboxControllerDismissalDelegate
        
        // Use dynamic background.
        controller.dynamicBackground = true
        
        // Present your controller.
        present(controller, animated: true, completion: nil)
    }
    
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    struct Storyboard {
        static let showImagesPageVC = "ShowImagesPageViewController"
        static let productDetailCell = "ProductDetailCell"
        static let productDetailsCell = "ProductDetailsCell"
        static let suggestionCell = "SuggestionCell"
        static let buyButtonCell = "BuyButtonCell"
    }
    
    // MARK : - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.showImagesPageVC {
            if let imagesPageVC = segue.destination as? ProductImagesPageViewController {
                imagesPageVC.images = product.images
                imagesPageVC.pageViewControllerDelegate = productImagesHeaderView
            }
        }
    }
}

extension ProductDetailTableViewController
{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 0 - shoe detail cell
        // 1 - buy button
        // 2 - shoe full details button cell
        // 3 - you might like this cell
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.productDetailCell, for: indexPath) as! ProductDetailCell
            cell.product = product
            cell.selectionStyle = .none
            cell.qrcodeImage.isUserInteractionEnabled = true
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
            cell.qrcodeImage.addGestureRecognizer(tapRecognizer)
            
            return cell
        } else if indexPath.row == 1 {
            
            
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.buyButtonCell, for: indexPath) as! BuyButtonCell
            cell.product = product
            cell.selectionStyle = .none
            
            cell.addToCartBtn.addTarget(self, action: #selector(self.addToCart(_:)), for: .touchUpInside) //<- use `#selector(...)`

            cell.buyBtn.addTarget(self, action: #selector(self.checkout(_:)), for: .touchUpInside)
            if self.product.isAddedToBasket! {
                cell.addToCartBtn.setTitle("Remove From Cart", for: .normal)
            }
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.productDetailsCell, for: indexPath)
            
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.suggestionCell, for: indexPath) as! SuggestionTableViewCell
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        if indexPath.row == 3 {
            if let cell = cell as? SuggestionTableViewCell {
                cell.collectionView.dataSource = self
                cell.collectionView.delegate = self
                cell.collectionView.reloadData()
                cell.collectionView.isScrollEnabled = false
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt
        indexPath: IndexPath) -> CGFloat
    {
        if indexPath.row == 3 {
            return tableView.bounds.width + 68.0
        } else {
            return UITableView.automaticDimension
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        print("section: \(indexPath.section)")
        //        print("row: \(indexPath.row)")
        if indexPath.section == 1 {
            
        }
        
    }
}

extension ProductDetailTableViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (relatedProducts?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.suggestionCell, for: indexPath) as! SuggestionCollectionViewCell
        // TODO: - get your data model...
        
        cell.image = relatedProducts![indexPath.item].images?.first
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 5.0
        layout.minimumInteritemSpacing = 2.5

        let numberOfItemsPerRow: CGFloat = 2.0
        let itemWidth = (collectionView.bounds.width - layout.minimumLineSpacing) / numberOfItemsPerRow

        return CGSize(width: itemWidth, height: itemWidth)
    }

}
















