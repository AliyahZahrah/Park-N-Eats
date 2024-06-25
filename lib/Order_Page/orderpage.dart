// orderpage.dart
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:myapp/Home_Page/homepage.dart'; // Import HomePage
import 'package:myapp/Order_Page/bundlepackage.dart';
import 'package:myapp/Order_Page/signaturebox.dart';
import 'package:myapp/navbar.dart';
import 'package:myapp/Order_Page/everydayvalue.dart'; // Import EverydayValuePage
import 'package:myapp/Order_Page/emptycart.dart'; // Import CartEmptyPage

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final int _currentIndex = 2;
  int _currentCarouselIndex = 0;

  final List<String> imgList = [
    'assets/img/kfc3.jpg',
    'assets/img/kfc.jpg',
    'assets/img/kfc2.jpg',
  ];

  final List<Map<String, String>> bestSellingItems = [
    {
      'title': 'Crispy Chicken Bucket',
      'imageUrl': 'assets/img/crispychicken.png',
    },
    {
      'title': 'Special Crispy Burger',
      'imageUrl': 'assets/img/burger.png',
    },
    {
      'title': 'Spicy Chicken Wings',
      'imageUrl': 'assets/img/spicywings.png',
    },
    {
      'title': 'Fun Fries',
      'imageUrl': 'assets/img/kfc5.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255), // Background color as per the Figma design
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
        backgroundColor: Colors.white, // White background for AppBar
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Order',
            style: TextStyle(
              color: Colors.black, // Change text color to black
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Center(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0), // Reduced vertical padding
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/img/logokfc.png', // Logo image asset
                      height: 40, // Logo size
                      fit: BoxFit.contain, // Adjust the fit as necessary
                    ),
                    const Text(
                      'X',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Image.asset(
                      'assets/img/logoapp2.png', // Logo image asset
                      height: 60, // Logo size
                      fit: BoxFit.contain, // Adjust the fit as necessary
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 150, // Reduce the height of the Carousel
                  autoPlay: true,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentCarouselIndex = index;
                    });
                  },
                ),
                items: imgList.map((item) => Center(
                  child: Image.asset(item, fit: BoxFit.cover, width: 1000),
                )).toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.map((url) {
                  int index = imgList.indexOf(url);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentCarouselIndex == index
                          ? const Color.fromARGB(255, 97, 94, 252)
                          : const Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                  );
                }).toList(),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Menu Category',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: const Icon(Icons.shopping_cart, color: Color.fromARGB(255, 97, 94, 252), size: 35), // Purple cart icon
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const CartEmptyPage()),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildCategoryCard('Everyday Value', 'assets/img/everydayvalue.png', () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const EverydayValuePage()),
                        );
                      }),
                      _buildCategoryCard('Bundle Package', 'assets/img/bundlepackage.png', () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const BundlePackagePage()),
                        );
                      }),
                      _buildCategoryCard('Signature   Box', 'assets/img/signaturebox.png', () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignatureBoxPage()),
                        );// Add navigation or action for Signature Box
                      }),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Best Selling',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  _buildBestSellingList(),
                ]),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: _currentIndex),
    );
  }

  Widget _buildCategoryCard(String title, String imageUrl, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: const Color.fromARGB(255, 189, 189, 245), // Card color as per the Figma design
        child: SizedBox(
          width: 100,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imageUrl, height: 50, width: 50), // Add logo image
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black), // Text color black
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBestSellingCard(String title, String imageUrl) {
    return Card(
      color: const Color.fromARGB(255, 189, 189, 245), // Card color as per the Figma design
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image.asset(
                    imageUrl,
                    height: 110, // Reduce the height of the image
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black), // Text color black
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBestSellingList() {
    return SizedBox(
      height: 180, // Reduce the height of the best selling items list
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: bestSellingItems.length,
        itemBuilder: (context, index) {
          final item = bestSellingItems[index];
          return _buildBestSellingCard(item['title']!, item['imageUrl']!);
        },
      ),
    );
  }
}
