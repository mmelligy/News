//
//  HomeViewController.swift
//  News
//
//  Created by Mahmoud El-Melligy on 06/06/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK:- Propertires
    let sectionNames = ["Stocks" , "Latest News" , "More News"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        collectionView.collectionViewLayout = createCompositionalLayout()
    }
    
    
    
    private func setupCollectionView() {
        collectionView.register(SectionHeaderCell.nib(), forSupplementaryViewOfKind: "header", withReuseIdentifier: SectionHeaderCell.cellIdentifier)
        collectionView.register(StocksCell.nib(), forCellWithReuseIdentifier: StocksCell.cellIdentifier)
        collectionView.register(LatestNewsCell.nib(), forCellWithReuseIdentifier: LatestNewsCell.cellIdentifier)
        collectionView.register(MoreNewsCell.nib(), forCellWithReuseIdentifier: MoreNewsCell.cellIdentifier)
    }
    
    // create Compositional Layout
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] (index, environment) -> NSCollectionLayoutSection? in
            return self?.createSectionFor(index: index, environment: environment)
        }
        return layout
    }
    
    // func to every section UI
    func createSectionFor(index : Int , environment : NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        switch index {
        case 0:
            let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(10),
                                                    heightDimension: .absolute(95))
            return createSection(itemSize: itemSize, groupSize: itemSize)
        case 1:
            let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(340),
                                                    heightDimension: .absolute(300))
            return createSection(itemSize: itemSize, groupSize: itemSize)
        case 2:
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                    heightDimension: .estimated(300))
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                    heightDimension: .estimated(300))
            return createSection(itemSize: itemSize, groupSize: groupSize,isHorizontalScrolling: false)
        default:
            let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(340),
                                                    heightDimension: .estimated(300))
            return createSection(itemSize: itemSize, groupSize: itemSize)
        }
    }
    
    // func to create section
    func createSection(spaceing:CGFloat = 2 ,
                            itemSize:NSCollectionLayoutSize,
                            groupSize:NSCollectionLayoutSize,
                       scrolling: UICollectionLayoutSectionOrthogonalScrollingBehavior = .continuous,
                       isHorizontalScrolling:Bool = true) -> NSCollectionLayoutSection {
        
        // item
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: spaceing, leading: spaceing, bottom: spaceing, trailing: spaceing)
        
        // group
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                     subitems: [item])
        
        //header
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                heightDimension: .absolute(30))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: "header" ,alignment: .topLeading)
        
        // section
        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [header]
        if isHorizontalScrolling == true{
        section.orthogonalScrollingBehavior = scrolling
        }
        return section
    }
    
}

extension HomeViewController : UICollectionViewDataSource{
    //number of sections
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 0
        case 1:
            return 0
        case 2:
            return 0
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StocksCell.cellIdentifier, for: indexPath) as? StocksCell else{
                return  UICollectionViewCell()
            }
            return cell
            
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LatestNewsCell.cellIdentifier, for: indexPath) as? LatestNewsCell else{
                return  UICollectionViewCell()
            }

            return cell
        case 2:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoreNewsCell.cellIdentifier, for: indexPath) as? MoreNewsCell else{
                return  UICollectionViewCell()
            }
            return cell
            
        default:
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: "header", withReuseIdentifier: SectionHeaderCell.cellIdentifier, for: indexPath) as? SectionHeaderCell else{
            return UICollectionReusableView()
        }
        view.title = sectionNames[indexPath.section]
        return view
        
    }
    
    
}
