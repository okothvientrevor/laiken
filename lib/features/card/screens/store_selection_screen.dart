import 'package:flutter/material.dart';
import 'package:store/features/shop/screens/home/add_card_form.dart';

class StoreSelectionPage extends StatefulWidget {
  @override
  _StoreSelectionPageState createState() => _StoreSelectionPageState();
}

class _StoreSelectionPageState extends State<StoreSelectionPage> {
  final List<Map<String, dynamic>> _stores = [
    {
      'name': 'Publix',
      'logo': 'assets/logos/publix.png',
      'primaryColor': Color(0xFFFFFFFFF),
    },
    {
      'name': 'Meijer',
      'logo': 'assets/logos/meijer.png',
      'primaryColor': Color(0xFF0033A0),
    },
    {
      'name': 'Wegmans',
      'logo': 'assets/logos/wegmans.png',
      'primaryColor': Color(0xFFFFCC00),
    },
    {
      'name': 'Whole Foods',
      'logo': 'assets/logos/wholefoods.png',
      'primaryColor': Color.fromARGB(255, 79, 152, 127),
    },
    {
      'name': 'Aldi',
      'logo': 'assets/logos/aldi.png',
      'primaryColor': Color(0xFF0036A7),
    },
    {
      'name': 'Morrisons',
      'logo': 'assets/logos/morissons.png',
      'primaryColor': Color(0xFF000000),
    },
    {
      'name': 'Asda',
      'logo': 'assets/logos/asda.png',
      'primaryColor': Color(0xFF008542),
    },
    {
      'name': 'Tesco',
      'logo': 'assets/logos/tesco.png',
      'primaryColor': Color(0xFF00539F),
    },
    {
      'name': 'Sainsbury’s',
      'logo': 'assets/logos/sainsbury.png',
      'primaryColor': Color(0xFF000000),
    },
    {
      'name': 'Co-op',
      'logo': 'assets/logos/coop.png',
      'primaryColor': Color(0xFFFFFFFFF),
    },
    {
      'name': 'Waitrose',
      'logo': 'assets/logos/waitrose.png',
      'primaryColor': Color(0xFF00643D),
    },
    {
      'name': 'Ocado',
      'logo': 'assets/logos/ocado.png',
      'primaryColor': Color.fromARGB(255, 106, 66, 123),
    },
    {
      'name': 'Iceland',
      'logo': 'assets/logos/iceland.png',
      'primaryColor': Color(0xFF000000),
    },
    {
      'name': 'Londis',
      'logo': 'assets/logos/londis.png',
      'primaryColor': Color(0xFF00A94F),
    },
    {
      'name': 'Shell',
      'logo': 'assets/logos/shell.png',
      'primaryColor': Color(0xFFFFCC00),
    },
    {
      'name': 'ExxonMobil',
      'logo': 'assets/logos/exonmobil.png',
      'primaryColor': Color(0xFF002878),
    },
    {
      'name': 'Chevron',
      'logo': 'assets/logos/chevron.png',
      'primaryColor': Color(0xFF0079C1),
    },
    {
      'name': 'BP',
      'logo': 'assets/logos/bp.png',
      'primaryColor': Color(0xFF00B140),
    },
    {
      'name': 'Esso',
      'logo': 'assets/logos/esso.png',
      'primaryColor': Color(0xFF004882),
    },
    {
      'name': 'Costa Coffee',
      'logo': 'assets/logos/costacoffe.png',
      'primaryColor': Color(0xFF8A1538),
    },
    {
      'name': 'Nando’s',
      'logo': 'assets/logos/nandos.png',
      'primaryColor': Color(0xFFFFFFFF),
    },
    {
      'name': 'Gulf',
      'logo': 'assets/logos/gulf.png',
      'primaryColor': Color(0xFFFFFFFFF),
    },
    {
      'name': 'Starbucks',
      'logo': 'assets/logos/starbucks.png',
      'primaryColor': Color.fromARGB(255, 58, 150, 120),
    },
    {
      'name': 'Wagamama',
      'logo': 'assets/logos/wagamama.png',
      'primaryColor': Color(0xFFFFFFFF),
    },
    {
      'name': 'Pizza Hut',
      'logo': 'assets/logos/pizzahut.png',
      'primaryColor': Color(0xFFD00000),
    },
    {
      'name': 'Domino’s',
      'logo': 'assets/logos/dominos.png',
      'primaryColor': Color(0xFFFFFFFF),
    },
    {
      'name': 'Burger King',
      'logo': 'assets/logos/burgerking.png',
      'primaryColor': Color(0xFFFFFFFF),
    },
    {
      'name': 'Hard Rock',
      'logo': 'assets/logos/hardrock.png',
      'primaryColor': Color(0xFF000000),
    },
    {
      'name': 'Walmart',
      'logo': 'assets/logos/walmart.png',
      'primaryColor': Color(0xFFFFFFFF),
    },
    {
      'name': 'Target',
      'logo': 'assets/logos/target.png',
      'primaryColor': Color(0xFFFFFFFF),
    },
    {
      'name': 'Lidl',
      'logo': 'assets/logos/lidl.png',
      'primaryColor': Color(0xFF00529B),
    },
    {
      'name': 'John Lewis',
      'logo': 'assets/logos/johnlewis.png',
      'primaryColor': Color(0xFF000000),
    },
    {
      'name': 'Debenhams',
      'logo': 'assets/logos/debenhams.png',
      'primaryColor': Color(0xFF000000),
    },
    {
      'name': 'M&S',
      'logo': 'assets/logos/m&s.png',
      'primaryColor': Color(0xFFFFFFFF),
    },
    {
      'name': 'Harrods',
      'logo': 'assets/logos/harrods.png',
      'primaryColor': Color(0xFFFFFFFF),
    },
    {
      'name': 'Costco',
      'logo': 'assets/logos/costco.png',
      'primaryColor': Color(0xFFFFFFFF),
    },
    {
      'name': 'Kroger',
      'logo': 'assets/logos/kroger.png',
      'primaryColor': Color(0xFFFFFFFF),
    },
  ];

  List<Map<String, dynamic>> _filteredStores = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredStores = _stores;
  }

  void _filterStores(String query) {
    setState(() {
      _filteredStores = _stores
          .where((store) =>
              store['name'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Store'),
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search stores...',
                hintStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Color.fromARGB(255, 95, 95, 95),
              ),
              onChanged: _filterStores,
            ),
          ),
          Expanded(
            child: _filteredStores.isEmpty
                ? Center(
                    child: Text(
                      'No stores found',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                : ListView.separated(
                    itemCount: _filteredStores.length,
                    separatorBuilder: (context, index) => Divider(
                      height: 1,
                      indent: 90,
                      endIndent: 20,
                      color: Colors.grey,
                    ),
                    itemBuilder: (context, index) {
                      final store = _filteredStores[index];
                      return StoreListTile(
                        storeName: store['name'],
                        logoPath: store['logo'],
                        color: store['primaryColor'],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CardFormPage(
                                storeName: store['name'],
                                storeColor: store['primaryColor'],
                                logoPath: store['logo'],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

// The StoreListTile class remains the same as in the original code
class StoreListTile extends StatelessWidget {
  final String storeName;
  final String logoPath;
  final Color color;
  final VoidCallback onTap;

  const StoreListTile({
    Key? key,
    required this.storeName,
    required this.logoPath,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      onTap: onTap,
      leading: Container(
        width: 60,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Image.asset(
            logoPath,
            fit: BoxFit.contain,
          ),
        ),
      ),
      title: Text(
        storeName,
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
      ),
    );
  }
}
