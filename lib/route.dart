import './screens/ProductsOverview.dart';
import './screens/ProductDetail.dart';
import './screens/Cart.dart';

final routes = {
  ProductOverview.routeName: (_) => ProductOverview(),
  ProductDetail.routeName: (_) => ProductDetail(),
  Cart.routeName: (_) => Cart(),
};
