import 'package:boydevfood/utility/my_style.dart';
import 'package:boydevfood/utility/signout_process.dart';
import 'package:boydevfood/widget/information_shop.dart';
import 'package:boydevfood/widget/list_food_menu_shop.dart';
import 'package:boydevfood/widget/order_list_shop.dart';
import 'package:flutter/material.dart';

class MainShop extends StatefulWidget {
  @override
  _MainShopState createState() => _MainShopState();
}

class _MainShopState extends State<MainShop> {
  //Field
  Widget currentWidget = OrderListShop();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Shop'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => signOutProcess(context),
          )
        ],
      ),
      drawer: showDrawer(),
      body: currentWidget,
    );
  }

  Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            showHeader(),
            homeMenu(),
            foodMenu(),
            informationMenu(),
            signOutMenu(),
          ],
        ),
      );

  ListTile homeMenu() => ListTile(
        leading: Icon(Icons.home),
        title: Text('ລາຍການອາຫານທີ່ລູກຄ້າສັ່ງ'),
        subtitle: Text('ລາຍການອາຫານທີ່ຍັງບໍໄດ້ ເຮັດສົ່ງລູກຄ້າ'),
        onTap: () {
          setState(() {
            currentWidget = OrderListShop();
          });
          Navigator.pop(context);
        },
      );

  ListTile foodMenu() => ListTile(
        leading: Icon(Icons.fastfood),
        title: Text('ລາຍການອາຫານ'),
        subtitle: Text('ລາຍການອາຫານ ຂອງຮ້ານ'),
        onTap: () {
          setState(() {
            currentWidget = ListFoodMenuShop();
          });
          Navigator.pop(context);
        },
      );

  ListTile informationMenu() => ListTile(
        leading: Icon(Icons.info),
        title: Text('ລາຍລະອຽດ ຂອງຮ້ານ'),
        subtitle: Text('ລາຍລະອຽດ ຂອງຮ້ານ ພ້ອມ Edit'),
        onTap: () {
          setState(() {
            currentWidget = InformationShop();
          });
          Navigator.pop(context);
        },
      );

  ListTile signOutMenu() => ListTile(
        leading: Icon(Icons.exit_to_app),
        title: Text('Sign Out'),
        subtitle: Text('Sign Out ແລະ ກັບໄປ ໜ້າຫຼັກ'),
        onTap: () => signOutProcess(context),
      );

  UserAccountsDrawerHeader showHeader() {
    return UserAccountsDrawerHeader(
      decoration: MyStyle().myBoxDecoration('shop.jpg'),
      currentAccountPicture: MyStyle().showLogo(),
      accountName: Text('Shop Login'),
      accountEmail: Text('Login'),
    );
  }
}
