import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const Icon(
      Icons.task,
      size: 150,
    ),
    Column(
      children: [
        SizedBox(
          height: 75,
          width: 200,
          child: ElevatedButton(
            child: const Text('Sign In'),
            onPressed: () {},
          ),
        ),
        const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20)),
        SizedBox(
          height: 75,
          width: 200,
          child: ElevatedButton(
            child: const Text('Sign Up'),
            onPressed: () {},
          ),
        ),
      ],
    ),
    // SizedBox(
    //       height: 75,
    //       width: 200,
    //       child: ElevatedButton(
    //         child: const Text('Sign In'),
    //         onPressed: () {},
    //       ),
    //     ),
    const Icon(
      Icons.people,
      size: 150,
    ),
  ];
  

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Teams',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
