import 'package:flutter/material.dart';
import './screens/product_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './screens/orders_screen.dart';
import './screens/admin_screen.dart';
import './screens/cart_screen.dart';
import './screens/edit_screen.dart';
import './screens/auth_screen.dart';
import './providers/products.provider.dart';
import './providers/cart.provider.dart';
import './providers/order.provider.dart';
import './providers/auth.provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          update: (context, auth, previousProducts) => Products(auth.token,
              previousProducts == null ? [] : previousProducts.items),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => Orders(),
        ),
      ],
      child: Consumer<Auth>(
          builder: (ctx, authData, _) => MaterialApp(
                title: 'MyShop',
                theme: ThemeData(
                    primarySwatch: Colors.purple,
                    accentColor: Colors.deepOrange,
                    fontFamily: 'Lato'),
                home: authData.isAuthenticated
                    ? ProductOverviewScreen()
                    : AuthScreen(),
                routes: {
                  AuthScreen.routeName: (ctx) => AuthScreen(),
                  ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
                  CartScreen.routeName: (ctx) => CartScreen(),
                  OrderScreen.routeName: (ctx) => OrderScreen(),
                  AdminScreen.routeName: (ctx) => AdminScreen(),
                  EditScreen.routeName: (ctx) => EditScreen(),
                },
              )),
    );
  }
}
