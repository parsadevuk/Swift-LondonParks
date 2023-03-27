//
//  GalleryView.swift
//  LondonParks
//
//  Created by Parsa Dev on 30/08/2022.
//ToDo: create a gallery swift code call it "GalleryView" that take UIImage array as input and picture can be scroll horizontally and when it is scrolling it, the picture gets 3D animation effect when it is scrolling.

import SwiftUI

func parkImages(parkNumber: Int) -> [Image] {
    
    let parkID = String(parksData[parkNumber].id)
    var images: [Image] = []

    for i in 1..<100 {
        let index = String(format: "%02d", i)
        let imageName = "\(parkID)-\(index)"
        print("Trying to load image with name: \(imageName)")

        if let _ = UIImage(named: imageName) {
            print("Loaded image: \(imageName)")
            images.append(Image(imageName))
        } else {
            print("Image not found: \(imageName)")
            break
        }
    }
    if images.isEmpty {
            print("Eroor loading Images")
        }
    return images
}

struct GalleryView: View {
    private let parkNumber: Int
    private let images: [Image]
    
    @State private var currentIndex: Int = 0
    @State private var showingExpandedImage: Bool = false
    @State private var timer: Timer? = nil

    init(parkNumber: Int) {
        self.parkNumber = parkNumber
        self.images = parkImages(parkNumber: parkNumber)
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
            if images.count > 0 {
                currentIndex = (currentIndex + 1) % images.count
            }
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    private func scrollToImage(_ proxy: ScrollViewProxy, index: Int) {
        proxy.scrollTo(index, anchor: .center)
        currentIndex = index
    }
    

    var body: some View {
        VStack {
            TabView(selection: $currentIndex.animation(.default)) {
                ForEach(0..<images.count) { index in
                    images[index]
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .tag(index)
                        .cornerRadius(20)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .onAppear {
                startTimer()
            }
            .onDisappear {
                stopTimer()
            }
            .sheet(isPresented: $showingExpandedImage) {
                ZStack {
                    //Color(ColorSet(parkNumber: 0) as! CGColor)
                    Color(UIColor.systemBackground) // Accent background with 50% opacity
                    ScrollView(.horizontal, showsIndicators: false) {
                        ScrollViewReader { proxy in
                            HStack(spacing: 10) {
                                ForEach(0..<images.count) { index in
                                    images[index]
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .edgesIgnoringSafeArea(.all)
                                        .frame(maxWidth: UIScreen.main.bounds.width - 50, maxHeight: UIScreen.main.bounds.height - 200)
                                        .id(index)
                                }
                                }
                                .onAppear {
                                scrollToImage(proxy, index: currentIndex)
                                }
                                .padding(.horizontal, 5)
                                .gesture(
                                DragGesture(minimumDistance: 50, coordinateSpace: .global)
                                    .onEnded { value in
                                        let horizontalOffset = value.translation.width
                                        let newIndex = Int((-horizontalOffset / (UIScreen.main.bounds.width + 10)).rounded())
                                        let boundedIndex = (currentIndex + newIndex) % images.count
                                        if currentIndex != boundedIndex {
                                            scrollToImage(proxy, index: boundedIndex)
                                        }
                                    }
                            )
                        }
                    }
                    
                    VStack {
                        HStack {
                            Spacer()
                            Button(action: {
                                showingExpandedImage.toggle()
                            })
                            {
                                Image(systemName: "xmark.circle")
                                    .foregroundColor(Color.accentColor)
                                    .font(.system(size: 30))
                                    .padding()
                            }
                        }
                        Spacer()
                    }
                }
            }
            .onTapGesture {
                stopTimer()
                showingExpandedImage.toggle()
            }
            .onChange(of: showingExpandedImage) { isPresented in
                if !isPresented {
                    startTimer()
                }
            }
        }
    }
}

struct GalleryView_Previews: PreviewProvider {
static var previews: some View {
GalleryView(parkNumber: 0)
}
}


