import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedFilter = 'All';

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Category'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildFilterOption('Food'),
              _buildFilterOption('Drinks'),
              _buildFilterOption('Desserts'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFilterOption(String category) {
    return ListTile(
      title: Text(category),
      onTap: () {
        setState(() {
          _selectedFilter = category;
        });
        Navigator.of(context).pop();
      },
    );
  }

  Widget _buildContentBasedOnFilter() {
    switch (_selectedFilter) {
      case 'Food':
        return Center(child: Text('Food Items'));
      case 'Drinks':
        return Center(child: Text('Drinks Items'));
      case 'Desserts':
        return Center(child: Text('Dessert Items'));
      default:
        return Center(child: Text('Select a Category'));
    }
  }

  // Helper method to build each category card with image
  Widget _buildCategoryCard(String category, String imagePath) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 100,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              category,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Ordering App'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt),
            onPressed: _showFilterDialog,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search food...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            Container(
              height: 200,
              child: PageView(
                children: [
                  Image.asset('assets/images/burger.jpg', fit: BoxFit.cover),
                  Image.asset('assets/images/pizza.jpg', fit: BoxFit.cover),
                  Image.asset('assets/images/sushi.jpg', fit: BoxFit.cover),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 100,
                color: Colors.orangeAccent,
                child: Center(
                  child: Text(
                    'Special Offer: Get 20% Off on All Orders!',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            // Add the new section for food categories in 4 columns and 2 rows
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 250,  // Adjust the height based on how you want to fit the grid
                child: GridView.count(
                  crossAxisCount: 4, // 4 columns
                  crossAxisSpacing: 8.0, // Horizontal space between items
                  mainAxisSpacing: 8.0, // Vertical space between items
                  shrinkWrap: true, // Ensures the GridView doesn't take extra space
                  children: [
                    _buildCategoryCard('Cake', 'assets/images/cake.jpg'),
                    _buildCategoryCard('Sushi', 'assets/images/sushi.jpg'),
                    _buildCategoryCard('Pizza', 'assets/images/pizza.jpg'),
                    _buildCategoryCard('Burger', 'assets/images/burger.jpg'),
                    _buildCategoryCard('Juice', 'assets/images/juice.jpg'), // Replaced Ice Cream with Juice
                    _buildCategoryCard('Pasta', 'assets/images/pasta.jpg'),
                    _buildCategoryCard('Salad', 'assets/images/salad.jpg'),
                    _buildCategoryCard('Snacks', 'assets/images/snacks.jpg'),
                  ],
                ),
              ),
            ),
            _buildContentBasedOnFilter(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/menu');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/profile');
          }
        },
      ),
    );
  }
}
