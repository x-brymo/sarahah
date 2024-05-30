import 'package:flutter/material.dart';

import 'widgets/change_password.dart';
import 'widgets/delete_account.dart';
import 'widgets/general.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings', style: TextStyle(color: Colors.white, fontSize: 17),),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.admin_panel_settings_rounded), text: 'General',),
              Tab(icon: Icon(Icons.lock), text: 'Password',),
              Tab(icon: Icon(Icons.account_circle), text: 'Account',),
            ],
          ),),
        body: const TabBarView(
          children: [
            GeneralPage(),
            ChangePassword(),
            DeleteAccount(),
          ],
        ),
      ),
    );
  }
}
