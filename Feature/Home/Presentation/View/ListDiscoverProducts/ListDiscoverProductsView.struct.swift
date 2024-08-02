import SwiftUI

struct ListDiscoverProductsView: View {
    
    //TODO Use real data from SDK
    let imageItems: [ImageItem] = [
        ImageItem(urlString: "https://m.media-amazon.com/images/I/71qqPTyiatS._AC_UY580_.jpg", type: "Summer style", count: 10),
        ImageItem(urlString: "https://ankerliebe.com/wp-content/uploads/2022/10/6f147a6d-b07c-43b9-9185-74516049e68a.jpg", type: "Evening style", count: 5),
        ImageItem(urlString: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSr5xYylSSx5eBFzxggQRXoH-E2AAU05jcSckFoUGphRwWdBE1W9OSQbOiVP67RDq_kdX0&usqp=CAU", type: "Formal style", count: 7),
        ImageItem(urlString: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzWEQ1KTnzIU2I-xehvxIRR2hwg-SPwR--SOnmhUcuu3DgqshTkUVFfBrnVUKqSEXuDCg&usqp=CAU", type: "Official style", count: 3)
    ]
    
    var body: some View {
        VStack {
            Text("main_tab_title")
                .foregroundColor(.white)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(imageItems, id: \.urlString) { item in
                        VStack {
                            RemoteImageView(
                                urlString: item.urlString,
                                width: 140,
                                height: 180,
                                contentMode: .fill
                            )
                            .aspectRatio(contentMode: .fill)
                            .overlay(
                                VStack(alignment: .leading, spacing: 4) {
                                    Spacer()
                                    Text("\(item.type)")
                                        .font(.system(size: 18))
                                        .foregroundColor(.white)
                                    HStack() {
                                        Text("\(item.count)")
                                            .font(.system(size: 12))
                                            .foregroundColor(.white)
                                        Text("products_title")
                                            .font(.system(size: 12))
                                            .foregroundColor(.white)
                                        
                                    }
                                }
                                    .padding(8)
                                    .cornerRadius(8)
                            )
                        }
                    }
                }
                .padding(.horizontal, 8)
            }
        }
    }
}

struct ListDiscoverProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ListDiscoverProductsView()
    }
}
