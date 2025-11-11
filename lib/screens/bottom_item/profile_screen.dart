import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color(0xFF6246EA),
        leading: Icon(Icons.arrow_back_sharp, color: Colors.white,),
        title: const Text(
          "My Profile",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.settings, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Profile Header
            Column(
              children: const [
                CircleAvatar(
                  radius: 45,
                  backgroundImage:
                  AssetImage('assets/Images/profile.png'), // Replace with your image
                ),
                SizedBox(height: 10),
                Text(
                  "John Smith",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Provider Information Section
            const _InfoCard(),

            const SizedBox(height: 15),

            // Wallet Section
            const _WalletCard(),

            const SizedBox(height: 15),

            // Payment Methods Section
            const _PaymentMethod(),

            const SizedBox(height: 15),

            // Performance Stats Section
            const _PerformanceStats(),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

// ================== Provider Info Card ==================
class _InfoCard extends StatelessWidget {
  const _InfoCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // ✅ full width
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("Provider Information",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: 8),
          _ProfileItem(label: "Phone Number", value: "+1 (555) 123-4567"),
          _ProfileItem(label: "Email Address", value: "johnsmith@cleanpro.com"),
          _ProfileItem(label: "Specialization", value: "Bathroom Deep Cleaning"),
          _ProfileItem(label: "Experience", value: "5 years"),
          _ProfileItem(
              label: "Service Area", value: "Downtown, Westside, North Hills"),
        ],
      ),
    );
  }
}

// ================== Wallet Section ==================
class _WalletCard extends StatelessWidget {
  const _WalletCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // ✅ full width
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 2),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Wallet",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF2196F3), Color(0xFF00BCD4)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Available Balance",
                        style: TextStyle(color: Colors.white70)),
                    SizedBox(height: 5),
                    Text("₹1,245.80",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 22)),
                  ],
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.arrow_forward_ios,
                      size: 18, color: Color(0xFF2196F3)),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6246EA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Withdraw",style: TextStyle(color: Colors.white),),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {},
                  child: const Text("History"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// ================== Payment Method ==================
class _PaymentMethod extends StatelessWidget {
  const _PaymentMethod();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // ✅ full width
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 2),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Add Payment Methods",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              CircleAvatar(
                radius: 14,
                backgroundColor: Color(0xFF6246EA),
                child: Icon(Icons.add, color: Colors.white, size: 18),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const _PaymentItem(
              icon: Icons.account_balance_wallet_outlined, title: "UPI ID"),
          const SizedBox(height: 10),
          const _PaymentItem(icon: Icons.account_balance, title: "Bank Account"),
        ],
      ),
    );
  }
}

// ================== Performance Stats ==================
class _PerformanceStats extends StatelessWidget {
  const _PerformanceStats();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // ✅ full width
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 2),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Performance Stats",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Icon(Icons.info_outline, size: 20),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _StatItem(value: "4.8", label: "Rating", color: Colors.green),
              _StatItem(value: "98%", label: "Completion", color: Colors.blue),
              _StatItem(value: "96%", label: "On-time", color: Colors.red),
            ],
          ),
        ],
      ),
    );
  }
}

// ================== Reusable Widgets ==================
class _ProfileItem extends StatelessWidget {
  final String label;
  final String value;
  const _ProfileItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.black54)),
          Text(value,
              style:
              const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
        ],
      ),
    );
  }
}

class _PaymentItem extends StatelessWidget {
  final IconData icon;
  final String title;
  const _PaymentItem({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: 28),
          const SizedBox(width: 12),
          Text(title,
              style:
              const TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  final Color color;
  const _StatItem(
      {required this.value, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: color.withOpacity(0.1),
          child: Icon(Icons.star, color: color),
        ),
        const SizedBox(height: 6),
        Text(value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Colors.black54)),
      ],
    );
  }
}
