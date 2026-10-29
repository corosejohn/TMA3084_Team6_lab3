import 'package:flutter/material.dart';

void main() {
  runApp(const RestaurantMenuApp());
}

class RestaurantMenuApp extends StatelessWidget {
  const RestaurantMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant Menu',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        useMaterial3: false,
      ),
      home: const RestaurantMenuScreen(),
    );
  }
}

class RestaurantMenuScreen extends StatelessWidget {
  const RestaurantMenuScreen({super.key});

  static const List<Map<String, String>> foods = [
    {
      'name': 'Vegetable Pizza',
      'description': 'Pizza topped with fresh vegetables.',
      'price': 'RM 15.00',
    },
    {
      'name': 'Chicken Pizza',
      'description': 'Pizza topped with chicken and cheese.',
      'price': 'RM 18.00',
    },
    {
      'name': 'Cheese Pizza',
      'description': 'Classic pizza loaded with cheese.',
      'price': 'RM 12.00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9FD),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF5722),
        title: const Text(
          'Restaurant Menu',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: foods.length,
        itemBuilder: (context, index) {
          final food = foods[index];

          return Card(
            color: const Color(0xFFFFA000),
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FoodDetailScreen(food: food),
                  ),
                );
              },
              child: SizedBox(
                height: 88,
                child: Row(
                  children: [
                    Container(
                      width: 76,
                      height: 76,
                      margin: const EdgeInsets.all(6),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFB74D),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        '🍕',
                        style: TextStyle(fontSize: 42),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        food['name']!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class FoodDetailScreen extends StatelessWidget {
  final Map<String, String> food;

  const FoodDetailScreen({
    super.key,
    required this.food,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9FD),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF5722),
        title: Text(food['name']!),
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(24),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  '🍕',
                  style: TextStyle(fontSize: 90),
                ),
                const SizedBox(height: 16),
                Text(
                  food['name']!,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  food['description']!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                Text(
                  food['price']!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}