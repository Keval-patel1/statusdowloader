import 'package:flutter/material.dart';
class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> with SingleTickerProviderStateMixin{
  TabController? _tabController;
  @override
  void initState() {


    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: [
          // Content for Tab 1
          Center(
            child: Text('Content for Tab 1'),
          ),
          // Content for Tab 2
          Center(
            child: Text('Content for Tab 2'),
          ),
        ],
      ),
    );
  }
}
