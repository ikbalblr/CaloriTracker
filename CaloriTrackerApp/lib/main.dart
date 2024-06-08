import 'package:flutter/material.dart';

void main() {
  runApp(const CalorieTrackerApp());
}

class CalorieTrackerApp extends StatelessWidget {
  const CalorieTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calorie Tracker',
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.red,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
        colorScheme: const ColorScheme(
          primary: Colors.blue,
          secondary: Colors.green,
          surface: Colors.white,
          background: Colors.red,
          error: Colors.redAccent,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: Colors.black,
          onBackground: Colors.white,
          onError: Colors.white,
          brightness: Brightness.light,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.forward();

    // Wait for 4 seconds then navigate to HomeScreen
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: const Text(
            'Calorie Tracker',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _totalCalories = 0;

  void _updateTotalCalories(int calories) {
    setState(() {
      _totalCalories += calories;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calorie Tracker'),
      ),
      body: ListView(
        children: <Widget>[
          _buildMealButton(
              context,
              'Kahvaltı',
              'lib/assets/images/breakfast.jpg',
              const [
                FoodItem(
                    name: 'Yumurta',
                    calories: 80,
                    imagePath: 'lib/assets/images/egg.jpg'),
                FoodItem(
                    name: 'Ekmek',
                    calories: 60,
                    imagePath: 'lib/assets/images/bread.jpg'),
                FoodItem(
                    name: 'Bal',
                    calories: 50,
                    imagePath: 'lib/assets/images/bal.jpg'),
                FoodItem(
                    name: 'Zeytin',
                    calories: 40,
                    imagePath: 'lib/assets/images/zeytin.jpg'),
                FoodItem(
                    name: 'Çay',
                    calories: 40,
                    imagePath: 'lib/assets/images/cay.jpg'),
                FoodItem(
                    name: 'Domates',
                    calories: 40,
                    imagePath: 'lib/assets/images/domates.jpg'),
                FoodItem(
                    name: 'Salam',
                    calories: 90,
                    imagePath: 'lib/assets/images/salam.jpg'),
              ],
              _updateTotalCalories),
          _buildMealButton(
              context,
              '1. Ara Öğün',
              'lib/assets/images/snack1.jpg',
              const [
                FoodItem(
                    name: 'Meyve',
                    calories: 50,
                    imagePath: 'lib/assets/images/fruit.jpg'),
                FoodItem(
                    name: 'Kuru üzüm',
                    calories: 100,
                    imagePath: 'lib/assets/images/kuru üzüm.jpg'),
                FoodItem(
                    name: 'Elma',
                    calories: 30,
                    imagePath: 'lib/assets/images/elma.jpg'),
                FoodItem(
                    name: 'Kahve',
                    calories: 60,
                    imagePath: 'lib/assets/images/kahve.jpg'),
                FoodItem(
                    name: 'Havuç',
                    calories: 45,
                    imagePath: 'lib/assets/images/havuc.jpg'),
              ],
              _updateTotalCalories),
          _buildMealButton(
              context,
              'Öğle Yemeği',
              'lib/assets/images/lunch.jpg',
              const [
                FoodItem(
                    name: 'Pilav',
                    calories: 150,
                    imagePath: 'lib/assets/images/rice.jpg'),
                FoodItem(
                    name: 'Tavuk',
                    calories: 200,
                    imagePath: 'lib/assets/images/chicken.jpg'),
                FoodItem(
                    name: 'Pizza',
                    calories: 220,
                    imagePath: 'lib/assets/images/pizza.jpg'),
                FoodItem(
                    name: 'Hamburger',
                    calories: 230,
                    imagePath: 'lib/assets/images/hamburger.jpg'),
              ],
              _updateTotalCalories),
          _buildMealButton(
              context,
              '2. Ara Öğün',
              'lib/assets/images/snack2.jpg',
              const [
                FoodItem(
                    name: 'Yoğurt',
                    calories: 60,
                    imagePath: 'lib/assets/images/yoghurt.jpg'),
                FoodItem(
                    name: 'Bisküvi',
                    calories: 70,
                    imagePath: 'lib/assets/images/biscuit.jpg'),
              ],
              _updateTotalCalories),
          _buildMealButton(
              context,
              'Akşam Yemeği',
              'lib/assets/images/dinner.jpg',
              const [
                FoodItem(
                    name: 'Salata',
                    calories: 50,
                    imagePath: 'lib/assets/images/salad.jpg'),
                FoodItem(
                    name: 'Balık',
                    calories: 150,
                    imagePath: 'lib/assets/images/fish.jpg'),
                FoodItem(
                    name: 'Tavuk Izgara',
                    calories: 200,
                    imagePath: 'lib/assets/images/tavk.jpg'),
                FoodItem(
                    name: 'Adana Kebap',
                    calories: 260,
                    imagePath: 'lib/assets/images/adanakebab.jpg'),
                FoodItem(
                    name: 'Sushi',
                    calories: 250,
                    imagePath: 'lib/assets/images/sushi.jpg'),
              ],
              _updateTotalCalories),
          ListTile(
            leading: null,
            title: const Text('Günlük Kalori Özeti'),
            subtitle: Text('Toplam Kalori: $_totalCalories kcal'),
          ),
        ],
      ),
    );
  }

  Widget _buildMealButton(BuildContext context, String title, String imagePath,
      List<FoodItem> foodItems, Function(int) updateTotalCalories) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: ListTile(
        leading: imagePath.isNotEmpty
            ? Image.asset(imagePath, width: 50, height: 50)
            : null,
        title: Center(child: Text(title)),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MealScreen(
                    title: title,
                    foodItems: foodItems,
                    updateTotalCalories: updateTotalCalories)),
          );
        },
      ),
    );
  }
}

class MealScreen extends StatefulWidget {
  final String title;
  final List<FoodItem> foodItems;
  final Function(int) updateTotalCalories;

  const MealScreen(
      {super.key,
      required this.title,
      required this.foodItems,
      required this.updateTotalCalories});

  @override
  // ignore: library_private_types_in_public_api
  _MealScreenState createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  late List<bool> _selectedItems;

  @override
  void initState() {
    super.initState();
    _selectedItems = List<bool>.filled(widget.foodItems.length, false);
  }

  int calculateTotalCalories() {
    int totalCalories = 0;
    for (int i = 0; i < _selectedItems.length; i++) {
      if (_selectedItems[i]) {
        totalCalories += widget.foodItems[i].calories;
      }
    }
    return totalCalories;
  }

  void _submitSelection() {
    widget.updateTotalCalories(calculateTotalCalories());
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: widget.foodItems.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: CheckboxListTile(
                    title: Center(child: Text(widget.foodItems[index].name)),
                    subtitle: Center(
                        child:
                            Text('${widget.foodItems[index].calories} kcal')),
                    secondary: Image.asset(widget.foodItems[index].imagePath,
                        width: 50, height: 50),
                    value: _selectedItems[index],
                    onChanged: (bool? value) {
                      setState(() {
                        _selectedItems[index] = value!;
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('Toplam Kalori: ${calculateTotalCalories()}'),
                ElevatedButton(
                  onPressed: _submitSelection,
                  child: const Text('Güncellemeleri Kaydet'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FoodItem {
  final String name;
  final int calories;
  final String imagePath;

  const FoodItem(
      {required this.name, required this.calories, required this.imagePath});
}
