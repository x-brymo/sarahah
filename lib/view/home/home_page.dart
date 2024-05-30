import 'package:flutter/material.dart';
import 'package:sarahah/view/settings/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.person_2_rounded), ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),

            PopupMenuButton(itemBuilder: (_) {
              return [
                 PopupMenuItem(
                  child: Text('Settings'),
                  value: 'Settings',
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage()));
                  },
                ),
                const PopupMenuItem(
                  child: Text('Logout'),
                ),
              ];
            })
          ],
          bottom: const TabBar(
              indicatorColor: Colors.white,
              labelColor: Colors.white,
            tabs: [
            Tab(
              text: 'Wish List',
              icon: Icon(Icons.favorite),
            ),
            Tab(
              text: 'Received',
              icon: Icon(Icons.call_received_rounded),
            ),
            Tab(
              text: 'Sent',
              icon: Icon(Icons.call_made_rounded),
            ),
            
          ]),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Wish List')),
            Center(child: Text('Received')),
            Center(child: Text('Sent')),
          ],
        ),
      ),
    );
  }
}
