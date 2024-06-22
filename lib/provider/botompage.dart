// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../screans of bottmnav/chat/chatpage.dart';
// import '../screans of bottmnav/home_comunity.dart';
// import '../screans of bottmnav/posts/new post.dart';
// import '../screans of bottmnav/profile.dart';
// import '../screans of bottmnav/search.dart';
// import 'botomwith provider.dart';
// class MyHomePage extends StatelessWidget {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//      floatingActionButton: FloatingActionButton(onPressed: () {
//        Navigator.push(context, MaterialPageRoute(builder: (context) =>new_post(),));
//       },
//         child:Icon(Icons.add) ,
//         backgroundColor: Colors.indigo[700],
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       body: _getPage(context),
//       bottomNavigationBar: _buildBottomAppBar(context),
//     );
//   }
//
//   Widget _getPage(BuildContext context) {
//     final provider = Provider.of<BottomNavigationProvider>(context);
//
//     switch (provider.selectedIndex) {
//       case 0:
//         return HomePage();
//       case 1:
//         return chatpage();
//       case 2:
//         return SearchPage();
//       case 3:
//         return ProfilePage();
//       default:
//         return HomePage();
//     }
//   }
//
//   Widget _buildBottomAppBar(BuildContext context) {
//
//     final provider = Provider.of<BottomNavigationProvider>(context);
//     return BottomAppBar(
//
//     shape: CircularNotchedRectangle(),
//     notchMargin: 5,
//     padding: EdgeInsets.only(top: 8),
//
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: <Widget>[
//         IconButton(
//           icon: Icon(Icons.home,
//               color: Provider.of<BottomNavigationProvider>(context).selectedIndex == 0 ? Provider.of<BottomNavigationProvider>(context).selectedColor : Colors.grey),
//
//           onPressed: () {
//             provider.updateSelectedIndex(0);
//
//           },
//         ),
//
//
//         IconButton(
//           icon: Icon(Icons.message_outlined,
//               color: Provider.of<BottomNavigationProvider>(context).selectedIndex == 1 ? Provider.of<BottomNavigationProvider>(context).selectedColor : Colors.grey),
//           onPressed: () {
//             provider.updateSelectedIndex(1);
//
//           },
//         ),
//
//
//         IconButton(
//           icon: Icon(Icons.search,
//               color:
//               Provider.of<BottomNavigationProvider>(context).selectedIndex == 2 ? Provider.of<BottomNavigationProvider>(context).selectedColor : Colors.grey),
//
//           onPressed: () {
//             provider.updateSelectedIndex(2);
//
//           },
//         ),
//         IconButton(
//           icon: Icon(Icons.person,
//               color:
//               Provider.of<BottomNavigationProvider>(context).selectedIndex == 3 ? Provider.of<BottomNavigationProvider>(context).selectedColor : Colors.grey),
//
//
//           onPressed: () {
//             provider.updateSelectedIndex(3);
//
//           },
//         ),
//       ],
//     ),
//     );
//   }
// }
//
