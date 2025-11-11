import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'booking_details.dart';
import 'bottom_item/booking_screen.dart';
import 'bottom_item/earning_screen.dart';
import 'bottom_item/profile_screen.dart';
import 'home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final home = Provider.of<HomeProvider>(context);

    final screens = [
       Container(),
      BookingScreen(),
      EarningScreen(),
      ProfileScreen(),
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: _bottomNavBar(),
        body: selectedIndex == 0
            ? Column(
          children: [
            _topHeader(home),   // Ab sirf Home me dikhenga
            Expanded(child: _homeBody()),
          ],
        )
            : screens[selectedIndex],   // Booking/Earning/Profile me header nahi aayega

      ),
    );
  }



  Widget _todayBookings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Today's Bookings",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "View All",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        const SizedBox(height: 15),

        _bookingCard(
          title: "Apartment 4B",
          subtitle: "Standard Bathroom Cleaning",
          time: "10:30 AM",
          distance: "2.5 km away",
        ),

        const SizedBox(height: 12),

        _bookingCard(
          title: "Villa Serena",
          subtitle: "Deep Bathroom Cleaning",
          time: "2:00 PM",
          distance: "4.2 km away",
        ),
      ],
    );
  }

  Widget _bookingCard({
    required String title,
    required String subtitle,
    required String time,
    required String distance,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Color(0xFFF1F4F9),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),

              Text(
                time,
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.location_on,
                      size: 18, color: Colors.green),
                  const SizedBox(width: 5),
                  Text(
                    distance,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),

              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff6737F7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10),
                ),
                child: GestureDetector(
                  onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> BookingDetailsScreen()));
                    
                  },
                  child: Text(
                    "Start Job",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }






  // HOME TAB BODY
  Widget _homeBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          _todayBookings(),
          Container(
            margin: EdgeInsets.only(left: 10,right: 10,bottom: 10,top: 10),
            child: const Text(
              "Earnings Summary",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          _earningsSummary(),
          const SizedBox(height: 20),

          const Text(
            "Recent Activity",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),

          _activityItem(
            icon: Icons.check_circle,
            color: Colors.blue,
            title: "Completed Job",
            subtitle: "Riverside Apartments - ₹35",
            time: "2h ago",
          ),
          const SizedBox(height: 10),

          _activityItem(
            icon: Icons.payment,
            color: Colors.amber,
            title: "Payment Received",
            subtitle: "Job #1082 - ₹50",
            time: "4h ago",
          ),
          const SizedBox(height: 10),

          _activityItem(
            icon: Icons.assignment,
            color: Colors.green,
            title: "New Job Assigned",
            subtitle: "Villa Serena - 2:00 PM",
            time: "5h ago",
          ),
        ],
      ),
    );
  }

  // BOTTOM NAVIGATION
  Widget _bottomNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,

      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.book_online), label: "Booking"),
        BottomNavigationBarItem(icon: Icon(Icons.wallet), label: "Earning"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      currentIndex: selectedIndex,

      onTap: (index) {
        setState(() {
          selectedIndex = index;
        });
      },
    );
  }

  // TOP HEADER WIDGET
  Widget _topHeader(HomeProvider home) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xff6737F7),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Hello, John",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.wallet, color: Colors.white),
                    SizedBox(width: 10,),
                    Container(
                        width: 30,
                        height: 30,
                   child: Image.asset(
                      "assets/Icons/bellic.png",
                      color: Colors.white,
                    ),)
                  ]
                )


              ],
            ),
            const SizedBox(height: 5),
            const Text(
              "Professional Bathroom Cleaner",
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Available for Jobs\nToggle to change status",
                    style: TextStyle(color: Colors.white),
                  ),
                  Switch(
                    value: home.isAvailable,
                    onChanged: home.toggleAvailable,
                    activeColor: Colors.greenAccent,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // EARNINGS SUMMARY BOX
  Widget _earningsSummary() {
    return Container(

      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Color(0xFFF1F4F9),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
          ),
        ],
      ),



      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Today", style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 5),
                  Text("₹85.00",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text("This Week", style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 5),
                  const Text("₹420.00",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),






                ],
              ),
            ],
          ),




          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  const Text("Jobs Completed", style: TextStyle(color: Colors.grey)),
                  const Text("3 Today",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                ],
              ),

              OutlinedButton(
                onPressed: () {},
                child: const Text("View Details"),
              ),


            ],
          ),





        ],
      ),
    );








  }

  // ACTIVITY ITEM WIDGET
  Widget _activityItem({
    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
    required String time,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2))
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(.2),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(subtitle,
                    style: const TextStyle(color: Colors.grey, fontSize: 13)),
              ],
            ),
          ),

          Text(time, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
