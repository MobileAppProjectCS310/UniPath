import 'package:flutter/material.dart';
import 'package:UniPath/utils/color.dart';
import 'HomePage.dart';
import 'notificationPage.dart';
import 'search.dart';
import 'add.dart';
import 'settings.dart';
import 'announcements.dart';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';


class Search extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<Search> {
  int _selectedIndex=0;
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('Search');

  void _onItemTapped(int index){
    setState((){
      _selectedIndex=index;
      if(_selectedIndex==0) {
        Navigator.pushReplacement(context,MaterialPageRoute(builder:(context){

          return HomeScreen();
        }));}
      else if(_selectedIndex ==1){
        Navigator.pushReplacement(context,MaterialPageRoute(builder:(context){

          return Search();
        }));
      }
      else if(_selectedIndex ==2){
        Navigator.pushReplacement(context,MaterialPageRoute(builder:(context){

          return notificationPage();
        }));
      }
      else if(_selectedIndex ==3){
        Navigator.pushReplacement(context,MaterialPageRoute(builder:(context){

          return Add();
        }));
      }
      else if(_selectedIndex ==4){
        Navigator.pushReplacement(context,MaterialPageRoute(builder:(context){

          return Setting();
        }));
      }

    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:customSearchBar,
        automaticallyImplyLeading:false,
        backgroundColor: AppColors.headingColor,
        actions: <Widget>[
          IconButton(onPressed: (){
            setState(() {
              if (customIcon.icon == Icons.search) {
                customIcon = const Icon(Icons.cancel);
                customSearchBar = const ListTile(
                  leading: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 28,
                  ),
                  title: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              }
            });
          },
              icon: customIcon)
        ],
      ),
      body:Center(
        child:Text("Search")
        ),
      bottomNavigationBar: BottomNavigationBar(
        items:const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home),label:'home', backgroundColor: AppColors.loginBackBottom),
          BottomNavigationBarItem(icon: Icon(Icons.search_outlined),label:'home', backgroundColor: AppColors.loginBackBottom),
          BottomNavigationBarItem(icon: Icon(Icons.announcement),label:'home', backgroundColor: AppColors.loginBackBottom),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined),label:'home', backgroundColor: AppColors.loginBackBottom),
          BottomNavigationBarItem(icon: Icon(Icons.settings_outlined),label:'home', backgroundColor: AppColors.loginBackBottom),

        ],
        type: BottomNavigationBarType.shifting,
        currentIndex:_selectedIndex,
        iconSize:40,
        onTap:_onItemTapped,

      ),

    );
  }
}
