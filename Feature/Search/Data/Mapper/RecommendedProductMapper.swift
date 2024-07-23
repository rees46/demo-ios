import Foundation

extension RecommendedProduct {
    static func from(product: SearchProduct) -> RecommendedProduct {
        return RecommendedProduct(
            id: product.id,
            barcode: product.barcode,
            name: product.name,
            brand: product.brand,
            model: product.model,
            description: product.description,
            imageUrl: product.imageUrl,
            resizedImageUrl: product.resizedImageUrl,
            url: product.url,
            deeplinkIos: product.deeplinkIos,
            categories: [],
            locations: [],
            price: product.price,
            priceFormatted: product.priceFormatted,
            priceFull: product.priceFull,
            priceFullFormatted: product.priceFullFormatted,
            oldPrice: product.oldPrice,
            oldPriceFormatted: product.oldPriceFormatted,
            oldPriceFull: product.oldPriceFull,
            oldPriceFullFormatted: product.oldPriceFullFormatted,
            currency: product.currency,
            salesRate: product.salesRate,
            discount: product.discount,
            rating: Int(product.relativeSalesRate),
            relativeSalesRate: product.relativeSalesRate,
            paramsRaw: product.params,
            fashionOriginalSizes: [],
            fashionSizes: [],
            fashionColors: [],
            resizedImages: product.resizedImages
        )
    }
}
