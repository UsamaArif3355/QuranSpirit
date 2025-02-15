import 'package:eQuran/home/main_page.dart';
import 'package:eQuran/home/settings.dart';
import 'package:flutter/material.dart';

class Destinations {
  const Destinations(
      this.label, this.icon, this.selectedIcon, this.destination);

  final String label;
  final Widget icon;
  final Widget selectedIcon;
  final Widget destination;
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Destinations> _pageDestinations = <Destinations>[
    const Destinations(
        "QuranSpirit", Icon(Icons.book_outlined), Icon(Icons.book), MainPage()),
    const Destinations("Settings", Icon(Icons.settings_outlined),
        Icon(Icons.settings), SettingsPage()),
  ];
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavigationDrawer(
        onDestinationSelected: (index) {
          _scaffoldKey.currentState!.closeDrawer();
          _onItemTapped(index);
        },
        selectedIndex: _selectedIndex,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 16, 16, 10),
            child: Text(
              '',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          ..._pageDestinations.map(
            (Destinations destination) {
              return NavigationDrawerDestination(
                label: Text(destination.label),
                icon: destination.icon,
                selectedIcon: destination.selectedIcon,
              );
            },
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
        ],
      ),
      appBar: _selectedIndex == 1
          ? AppBar(
              title: Text(_pageDestinations[_selectedIndex].label),
              iconTheme: IconThemeData(
                  color: Theme.of(context).colorScheme.onBackground),
              centerTitle: true,
            )
          : null,
      body: _pageDestinations[_selectedIndex].destination,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
