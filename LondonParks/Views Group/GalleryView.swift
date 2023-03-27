//
//  GalleryView.swift
//  LondonParks
//
//  Created by Parsa Shobany on 30/08/2022.
//ToDo: create a gallery swift code call it "GalleryView" that take UIImage array as input and picture can be scroll horizontally and when it is scrolling it, the picture gets 3D animation effect when it is scrolling.

import SwiftUI
import Foundation
import UIKit

class GalleryView: UICollectionView{

    private let galleryCellIdentifier = "galleryCell"
    var images: [UIImage] = []

    init(images: [UIImage], frame: CGRect) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        self.images = images
        super.init(frame: frame, collectionViewLayout: layout)
        self.register(GalleryCell.self, forCellWithReuseIdentifier: galleryCellIdentifier)
        self.dataSource = self
        self.delegate = self
        self.isPagingEnabled = true
        self.showsHorizontalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension GalleryView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: galleryCellIdentifier, for: indexPath) as! GalleryCell
        cell.imageView.image = images[indexPath.row]
        return cell
    }
}

extension GalleryView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.contentView.layer.transform = CATransform3DMakeScale(0.5, 0.5, 1.0)
        UIView.animate(withDuration: 0.3) {
            cell.contentView.layer.transform = CATransform3DIdentity
        }
    }
}

extension GalleryView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let visibleCells = self.visibleCells
        
        for cell in visibleCells {
            let xOffset = cell.center.x - self.contentOffset.x - self.bounds.width / 2
            let angle = CGFloat.pi / 20 * xOffset / self.bounds.width
            
            var transform = CATransform3DIdentity
            transform.m34 = -1.0 / 500
            transform = CATransform3DRotate(transform, angle, 0, 1, 0)
            cell.contentView.layer.transform = transform
        }
    }
}

class GalleryCell: UICollectionViewCell {
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupImageView() {
           imageView.contentMode = .scaleAspectFit
           imageView.clipsToBounds = true
           imageView.translatesAutoresizingMaskIntoConstraints = false
           contentView.addSubview(imageView)
           
           NSLayoutConstraint.activate([
               imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
               imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
               imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
               imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
           ])
       }
   }

struct GalleryViewRepresentable: UIViewRepresentable {
    typealias UIViewType = GalleryView

    let images: [UIImage]

    func makeUIView(context: Context) -> GalleryView {
        return GalleryView(images: images, frame: .zero)
    }

    func updateUIView(_ uiView: GalleryView, context: Context) {}
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            GalleryViewRepresentable(images: parkImages(parkID: String(parksData[0].id)))
                .frame(width: geometry.size.width, height: 200)
        }
        .previewLayout(.sizeThatFits)
    }
}
