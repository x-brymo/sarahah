import 'package:flutter/material.dart';

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
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            PopupMenuButton(itemBuilder: (_) {
              return [
                const PopupMenuItem(
                  child: Text('Settings'),
                ),
                const PopupMenuItem(
                  child: Text('Logout'),
                ),
              ];
            })
          ],
          bottom: const TabBar(
            
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
