import 'package:flutter/material.dart';
import 'checkoutfood.dart';

class CartFoodPage extends StatelessWidget {
  const CartFoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Cart"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          FoodItemCard(
            name: "2 Meal Deal Box + 2 Ticket Jatim Park Fast Track",
            description: "2 Meal Deal Box with 2 Ticket Fast Track to Jatim Park 1 2 3",
            price: 150000,
            imageUrl: 'assets/img/mealdeal1.jpeg',
            quantity: 1,
          ),
          FoodItemCard(
            name: "Special Crispy Burger",
            description: "Crispy chicken burger with spicy mayo",
            price: 30000,
            imageUrl: 'assets/img/burger.png',
            quantity: 1,
          ),
          FoodItemCard(
            name: "Signature Box 3",
            description: "1 Giant Taco + 1 Hot or Crispy Fried Chicken + 1 Cola",
            price: 50000,
            imageUrl: 'assets/img/signaturebox3.jpg',
            quantity: 1,
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total:  Rp. 230.000",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CheckoutFoodPage()),
                  );
                },
                child: const Text(
                  "Checkout",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 97, 94, 252),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FoodItemCard extends StatelessWidget {
  final String name;
  final String description;
  final int price;
  final String imageUrl;
  final int quantity;

  const FoodItemCard({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.asset(
              imageUrl,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        "Rp. ${price.toString()}   ",
                        style: const TextStyle(fontSize: 18, color: Colors.black54, fontWeight: FontWeight.bold),
                        ),
                      const SizedBox(width: 16),
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          // Decrement quantity
                        },
                      ),
                      Text(quantity.toString()),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          // Increment quantity
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
