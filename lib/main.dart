import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    HomeScreen(),
    FoodListScreen(),
    FoodLogScreen(), // New screen for food logging
    NewsScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health App'),
        backgroundColor: Colors.green[400],
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.green[400],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey[300],
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.green[800],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Rafael P.',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                  _onItemTapped(0);
                },
              ),
              ListTile(
                leading: Icon(Icons.food_bank),
                title: Text('Food List'),
                onTap: () {
                  Navigator.pop(context);
                  _onItemTapped(1);
                },
              ),
              ListTile(
                leading: Icon(Icons.calculate), // New icon for food log
                title: Text('Food Log'),
                onTap: () {
                  Navigator.pop(context);
                  _onItemTapped(2); // Pindah ke halaman Food Log
                },
              ),
              ListTile(
                leading: Icon(Icons.article),
                title: Text('News'),
                onTap: () {
                  Navigator.pop(context);
                  _onItemTapped(3);
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
                onTap: () {
                  Navigator.pop(context);
                  _onItemTapped(4); // Pindah ke halaman Profile
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                  // Aksi untuk pindah ke halaman Settings
                },
              ),
            ],
          ),
        ),
      ),
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'Food List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate), // New icon for food log
            label: 'Food Log',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.green[50],
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 30),
            Text(
              'Welcome to Your Health App!',
              style: TextStyle(
                color: Colors.green[800],
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // Menghapus padding untuk full width
            Card(
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.white,
              shadowColor: Colors.black54,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Steps Today',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '5000',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Icon(Icons.directions_walk, size: 40, color: Colors.green),
                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.white,
              shadowColor: Colors.black54,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Calories Burned',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '350 kcal',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Icon(Icons.local_fire_department, size: 40, color: Colors.red),
                  ],
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.white,
              shadowColor: Colors.black54,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Water Intake',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '2.5 L',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Icon(Icons.water_drop, size: 40, color: Colors.blue),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodListScreen extends StatelessWidget {
  final List<FoodItem> foods = [
    FoodItem('Apple', '52 kcal', '0.2 g', '14 g', '0.3 g'),
    FoodItem('Banana', '89 kcal', '1.1 g', '23 g', '0.3 g'),
    FoodItem('Orange', '47 kcal', '0.1 g', '12 g', '0.1 g'),
    FoodItem('Salad', '15 kcal', '0.2 g', '3 g', '0.3 g'),
    FoodItem('Chicken Breast', '165 kcal', '31 g', '0 g', '3.6 g'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: foods.length,
      itemBuilder: (context, index) {
        return ExpansionTile(
          title: Text(foods[index].name),
          leading: Icon(Icons.food_bank),
          children: <Widget>[
            ListTile(
              title: Text('Nutritional Information:'),
              subtitle: Text(
                'Calories: ${foods[index].calories}\n'
                    'Protein: ${foods[index].protein}\n'
                    'Carbohydrates: ${foods[index].carbohydrates}\n'
                    'Fat: ${foods[index].fat}',
              ),
            ),
          ],
        );
      },
    );
  }
}

class FoodLogScreen extends StatefulWidget {
  @override
  _FoodLogScreenState createState() => _FoodLogScreenState();
}

class _FoodLogScreenState extends State<FoodLogScreen> {
  final List<FoodItem> foods = [
    FoodItem('Apple', '52 kcal', '0.2 g', '14 g', '0.3 g'),
    FoodItem('Banana', '89 kcal', '1.1 g', '23 g', '0.3 g'),
    FoodItem('Orange', '47 kcal', '0.1 g', '12 g', '0.1 g'),
    FoodItem('Salad', '15 kcal', '0.2 g', '3 g', '0.3 g'),
    FoodItem('Chicken Breast', '165 kcal', '31 g', '0 g', '3.6 g'),
  ];

  final Map<FoodItem, int> _foodLog = {};

  void _addFood(FoodItem food, int quantity) {
    setState(() {
      _foodLog[food] = (_foodLog[food] ?? 0) + quantity;
    });
  }

  int _getTotalCalories() {
    int totalCalories = 0;
    _foodLog.forEach((food, quantity) {
      totalCalories += int.parse(food.calories.split(' ')[0]) * quantity;
    });
    return totalCalories;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: foods.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(foods[index].name),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          if (_foodLog.containsKey(foods[index]) &&
                              _foodLog[foods[index]]! > 0) {
                            setState(() {
                              _foodLog[foods[index]] =
                              (_foodLog[foods[index]]! - 1);
                            });
                          }
                        },
                      ),
                      Expanded(  // Tambahkan Expanded di sini
                        child: Text(
                          '${_foodLog[foods[index]] ?? 0}',
                          textAlign: TextAlign.center, // Sesuaikan posisi teks
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          _addFood(foods[index], 1);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Total Calories: ${_getTotalCalories()} kcal',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}


class FoodItem {
  final String name;
  final String calories;
  final String protein;
  final String carbohydrates;
  final String fat;

  FoodItem(this.name, this.calories, this.protein, this.carbohydrates, this.fat);
}

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.article, size: 100, color: Colors.green),
          SizedBox(height: 20),
          Text(
            'Latest Health News',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'Stay tuned for the latest updates on health and wellness!',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green[100]!, Colors.green[200]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 30),
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300], // Warna latar belakang
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.green[800],
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Rafael P.',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Age: 20',
                style: TextStyle(fontSize: 18, color: Colors.green[650]),
              ),
              Text(
                'Height: 180 cm',
                style: TextStyle(fontSize: 18, color: Colors.green[650]),
              ),
              Text(
                'Weight: 70 kg',
                style: TextStyle(fontSize: 18, color: Colors.green[650]),
              ),
              SizedBox(height: 20),
              Divider(color: Colors.green[400]), // Garis pemisah
              SizedBox(height: 20),
              Text(
                'Favorite Foods',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                ),
              ),
              SizedBox(height: 10),
              _buildFavoriteFoodCard('Apple', '52 kcal'),
              _buildFavoriteFoodCard('Banana', '89 kcal'),
              _buildFavoriteFoodCard('Chicken Breast', '165 kcal'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFavoriteFoodCard(String foodName, String calories) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              foodName,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            Text(
              calories,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}