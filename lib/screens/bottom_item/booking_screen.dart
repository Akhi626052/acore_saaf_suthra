import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ✅ TOP PURPLE HEADER
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xff5A3FF6), // Purple color
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 30),
                  const Text(
                    "My Bookings",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.notifications_none,
                        size: 26, color: Colors.white),
                  ),
                ],
              ),
            ),

            // ✅ TAB BAR (Requests / Upcoming / Completed)
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(12),
              child: TabBar(
                controller: tabController,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black54,
                indicator: BoxDecoration(
                  color: Color(0xff5A3FF6),
                  borderRadius: BorderRadius.circular(25),
                ),
                tabs: const [
                  Tab(text: "Requests"),
                  Tab(text: "Upcoming"),
                  Tab(text: "Completed"),
                ],
              ),
            ),

            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  bookingList(),
                  bookingList(),
                  bookingList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ✅ BOOKING CARD LIST
  Widget bookingList() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        bookingCard(
          title: "Bathroom Deep Cleaning",
          address: "123 Main St, Apt 4B",
          date: "May 15, 2024 • 10:00 AM",
          price: "₹75.00",
        ),
        bookingCard(
          title: "Shower Cleaning",
          address: "456 Park Ave, Suite 12",
          date: "May 16, 2024 • 2:30 PM",
          price: "₹45.00",
        ),
      ],
    );
  }

  // ✅ BOOKING CARD DESIGN
  Widget bookingCard({
    required String title,
    required String address,
    required String date,
    required String price,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TITLE + NEW TAG
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600)),
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.purple.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text("New",
                    style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ),
            ],
          ),

          const SizedBox(height: 6),

          // ADDRESS
          Row(
            children: [
              const Icon(Icons.location_on,
                  size: 16, color: Colors.purple),
              const SizedBox(width: 4),
              Text(address,
                  style: const TextStyle(
                      fontSize: 14, color: Colors.black54)),
            ],
          ),

          const SizedBox(height: 15),

          // DATE + PRICE
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Date & Time",
                        style:
                        TextStyle(fontSize: 13, color: Colors.black54)),
                    const SizedBox(height: 4),
                    Text(date,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15)),
                  ]),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text("Payment",
                        style:
                        TextStyle(fontSize: 13, color: Colors.black54)),
                    const SizedBox(height: 4),
                    Text(price,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.purple)),
                  ]),
            ],
          ),

          const SizedBox(height: 20),

          // DECLINE + ACCEPT BUTTONS
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // DECLINE BUTTON
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.red.shade100,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  alignment: Alignment.center,
                  child: const Text("Decline",
                      style: TextStyle(color: Colors.red)),
                ),
              ),

              const SizedBox(width: 16),

              // ACCEPT BUTTON
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: Color(0xff5A3FF6),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  alignment: Alignment.center,
                  child: const Text("Accept",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
