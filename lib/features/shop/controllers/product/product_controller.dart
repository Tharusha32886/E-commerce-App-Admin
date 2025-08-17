import 'package:get/get.dart';
import 'package:yt_ecommerce_admin_panel/data/abstract/base_data_table_controller.dart';
import 'package:yt_ecommerce_admin_panel/data/repositories/product/product_repository.dart';
import 'package:yt_ecommerce_admin_panel/features/shop/models/product_model.dart';
import 'package:yt_ecommerce_admin_panel/utils/constants/enums.dart';

class ProductController extends TBaseController<ProductModel> {
    static ProductController get instance => Get.find();

    final _productRepository = Get.put(ProductRepository());

    @override
    Future<List<ProductModel>> fetchItems() async {
        return await _productRepository.getAllProducts();
    }

    @override
    bool containsSearchQuery(ProductModel item, String query) {
        return item.title.toLowerCase().contains(query.toLowerCase()) ||
            item.brand!.name.toLowerCase().contains(query.toLowerCase()) ||
            item.stock.toString().contains(query) ||
            item.price.toString().contains(query);
    }

    @override
    Future<void> deleteItem(ProductModel item) async {
       
        await _productRepository.deleteProduct(item);
    }

    /// Sorting related code
    void sortByName(int sortColumnIndex, bool ascending) {
        sortByProperty(sortColumnIndex, ascending, (ProductModel product) => product.title.toLowerCase());
    }

    /// Sorting related code
    void sortByPrice(int sortColumnIndex, bool ascending) {
        sortByProperty(sortColumnIndex, ascending, (ProductModel product) => product.price);
    }

    /// Sorting related code
    void sortByStock(int sortColumnIndex, bool ascending) {
        sortByProperty(sortColumnIndex, ascending, (ProductModel product) => product.stock);
    }

    /// Sorting related code
    void sortBySoldItems(int sortColumnIndex, bool ascending) {
        sortByProperty(sortColumnIndex, ascending, (ProductModel product) => product.soldQuantity);
    }

    /// Set the product price or price range for variations.
    String getProductPrice(ProductModel product) {
        // If no variations exist, return the single price or sale price
        if (product.productType == ProductType.single.toString() || product.productVariations!.isEmpty) {
            return (product.salePrice > 0.0 ? product.salePrice : product.price).toString();
        } else {
          double smallestPrice = double.infinity;
          double largestPrice = 0.0;
          for (var variation in product.productVariations!) {

            double priceToConsider = variation.salePrice > 0.0 ? variation.salePrice : variation.price;

            if (priceToConsider < smallestPrice) {
              smallestPrice = priceToConsider;
            }

            if (priceToConsider > largestPrice) {
              largestPrice = priceToConsider;
            }
          }
         if (smallestPrice.isEqual(largestPrice)) {
            return largestPrice.toString();
          } else {
            return '$smallestPrice - \$$largestPrice';
          }
        }
    }

    // -- Calculate Discount Percentage
String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
}

// -- Calculate Product Stock
String getProductStockTotal(ProductModel product) {
    return product.productType == ProductType.single.toString()
        ? product.stock.toString()
        : product.productVariations!.fold<int>(0, (previousValue, element) => previousValue + element.stock).toString();
}

// -- Calculate Product Sold Quantity
String getProductSoldQuantity(ProductModel product) {
    return product.productType == ProductType.single.toString()
        ? product.soldQuantity.toString()
        : product.productVariations!.fold<int>(0, (previousValue, element) => previousValue + element.soldQuantity).toString();
}

// -- Check Product Stock Status
String getProductStockStatus(ProductModel product) {
    return product.stock > 0 ? 'In Stock' : 'Out of Stock';
}
}