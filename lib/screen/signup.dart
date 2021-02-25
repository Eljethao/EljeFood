import 'package:boydevfood/utility/my_style.dart';
import 'package:boydevfood/utility/normal_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SignUP extends StatefulWidget {
  @override
  _SignUPState createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  String chooseType, name, user, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: ListView(
        padding: EdgeInsets.all(30.0),
        children: <Widget>[
          myLogo(),
          MyStyle().mySizebox(),
          showAppName(),
          MyStyle().mySizebox(),
          nameForm(),
          MyStyle().mySizebox(),
          userForm(),
          MyStyle().mySizebox(),
          passwordForm(),
          MyStyle().mySizebox(),
          MyStyle().showTitleH2('Type of Member:'),
          MyStyle().mySizebox(),
          userRadio(),
          shopRadio(),
          riderRadio(),
          MyStyle().mySizebox(),
          registerButton(),
        ],
      ),
    );
  }

  Widget registerButton() => Container(
        width: 250.0,
        child: RaisedButton(
          color: MyStyle().darkColor,
          onPressed: () {
            print(
                "name = $name, user = $user, password = $password, choosType = $chooseType");
            if (name == null ||
                name.isEmpty ||
                user == null ||
                user.isEmpty ||
                password == null ||
                password.isEmpty) {
              print('Have space');
              normalDialog(context, 'It has space. Please fill the field');
            } else if (chooseType == null) {
              normalDialog(context, 'please select your type');
            } else {
              checkUser();            
            }
          },
          child: Text(
            'Register',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

      Future<Null> checkUser()async{
        String url = 'http://192.168.245.2/eljefood/getUserWhereUser.php?isAdd=true&User=$user';
        try {
          Response response = await Dio().get(url);
          if (response.toString() == 'null') {
            registerThread();
          } else {
            normalDialog(context, 'User ນີ້ $user ມີຄົນອື່ນໃຊ້ໄປແລ້ວ ກະລຸນາປ່ຽນ User ໃໝ່');
          }
        } catch (e) {
        }
      }

      Future<Null> registerThread()async{
        String url = 'http://192.168.245.2/eljefood/addUser.php?isAdd=true&Name=$name&User=$user&Password=$password&ChooseType=$chooseType';
       try {
          Response response = await Dio().get(url);
          print('res = $response');

          if (response.toString() == 'true') {
            Navigator.pop(context);
          } else {
            normalDialog(context, 'ບໍສາມາດສະມັກໄດ້ ກະລຸນາລອງໃໝ່');
          }
        } catch (e) {
        }

      }

  Widget userRadio() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: 250.0,
            child: Row(
              children: <Widget>[
                Radio(
                    value: 'User',
                    groupValue: chooseType,
                    onChanged: (value) {
                      setState(() {
                        chooseType = value;
                      });
                    }),
                Text(
                  'ຜູ້ສັ່ງອາຫານ',
                  style: TextStyle(color: MyStyle().darkColor),
                ),
              ],
            ),
          ),
        ],
      );

  Widget shopRadio() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: 250.0,
            child: Row(
              children: <Widget>[
                Radio(
                    value: 'Shop',
                    groupValue: chooseType,
                    onChanged: (value) {
                      setState(() {
                        chooseType = value;
                      });
                    }),
                Text(
                  'ເຈົ້າຂອງຮ້ານອາຫານ',
                  style: TextStyle(color: MyStyle().darkColor),
                ),
              ],
            ),
          ),
        ],
      );

  Widget riderRadio() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            width: 250.0,
            child: Row(
              children: <Widget>[
                Radio(
                    value: 'Rider',
                    groupValue: chooseType,
                    onChanged: (value) {
                      setState(() {
                        chooseType = value;
                      });
                    }),
                Text(
                  'ຜູ້ສົ່ງອາຫານ',
                  style: TextStyle(color: MyStyle().darkColor),
                ),
              ],
            ),
          ),
        ],
      );

  Widget nameForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 250.0,
            child: TextField(
              onChanged: (value) => name = value.trim(),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.face,
                  color: MyStyle().darkColor,
                ),
                labelStyle: TextStyle(color: MyStyle().darkColor),
                labelText: 'Name :',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyStyle().darkColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyStyle().primaryColor),
                ),
              ),
            ),
          ),
        ],
      );

  Widget userForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 250.0,
            child: TextField(
              onChanged: (value) => user = value.trim(),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.account_box,
                  color: MyStyle().darkColor,
                ),
                labelStyle: TextStyle(color: MyStyle().darkColor),
                labelText: 'User :',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyStyle().darkColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyStyle().primaryColor),
                ),
              ),
            ),
          ),
        ],
      );

  Widget passwordForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 250.0,
            child: TextField(
              onChanged: (value) => password = value.trim(),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock,
                  color: MyStyle().darkColor,
                ),
                labelStyle: TextStyle(color: MyStyle().darkColor),
                labelText: 'Password :',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyStyle().darkColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: MyStyle().primaryColor),
                ),
              ),
            ),
          ),
        ],
      );

  Row showAppName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        MyStyle().showTitle('BoyDev Food'),
      ],
    );
  }

  Widget myLogo() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MyStyle().showLogo(),
        ],
      );
}
