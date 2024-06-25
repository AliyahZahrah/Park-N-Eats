import 'package:flutter/material.dart';
import 'package:myapp/Order_Page/paymentsuccess.dart'; // Import PaymentSuccessPage

class CheckoutFoodPage extends StatelessWidget {
  const CheckoutFoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Checkout"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            "Order List:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const FoodItemCard(
            name: "2 Meal Deal Box + 2 Ticket Jatim Park Fast Track",
            price: 150000,
            imageUrl: 'assets/img/mealdeal1.jpeg',
            quantity: 1,
          ),
          const FoodItemCard(
            name: "Special Crispy Burger",
            price: 30000,
            imageUrl: 'assets/img/burger.png',
            quantity: 1,
          ),
          const FoodItemCard(
            name: "Signature Box 3",
            price: 50000,
            imageUrl: 'assets/img/signaturebox3.jpg',
            quantity: 1,
          ),
          const SizedBox(height: 16),
          const Text(
            "Payment Method:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromARGB(255, 240, 240, 240),
            ),
            child: Row(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "My Balance",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.account_balance_wallet,
                          color: Colors.black54,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Rp. 500.000,00",
                          style: TextStyle(fontSize: 16, color: Colors.black54, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(8),
                    color: const Color.fromARGB(255, 240, 240, 240),
                  ),
                  child: const Icon(
                    Icons.swap_horiz,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Order Summary:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Items:                                               Rp. 230.000",
            style: TextStyle(fontSize: 16),
          ),
          const Text(
            "Tax:                                                   Rp.     5.000",
            style: TextStyle(fontSize: 16),
          ),
          const Text(
            "Total:                                                Rp. 235.000",
            style: TextStyle(fontSize: 16),
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
                "Total:   Rp.235.000",
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
                    MaterialPageRoute(builder: (context) => const PaymentSuccessPage()),
                  );
                },
                child: const Text(
                  "Pay",
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
  final int price;
  final String imageUrl;
  final int quantity;

  const FoodItemCard({
    super.key,
    required this.name,
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
                    "Rp. ${price.toString()}",
                    style: const TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                ],
              ),
            ),
            Text("x$quantity"),
          ],
        ),
      ),
    );
  }
}
