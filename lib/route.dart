import './screens/ProductsOverview.dart';
import './screens/ProductDetail.dart';
import './screens/Cart.dart';
import './screens/UserProducts.dart';
import './screens/EditProduct.dart';

final routes = {
  ProductOverview.routeName: (_) => ProductOverview(),
  ProductDetail.routeName: (_) => ProductDetail(),
  Cart.routeName: (_) => Cart(),
  UserProductsScreen.routeName: (_) => UserProductsScreen(),
  EditProductScreen.routeName: (_) => EditProductScreen(),
};
