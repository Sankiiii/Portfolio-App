import 'package:flutter/material.dart';
import 'package:portfolio_assi/widgets/project_card.dart';
import 'package:portfolio_assi/model/project.dart';
import 'package:portfolio_assi/model/bottom_navigation.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Project> projects = [
  Project(
    title: 'Samajik Samasyaon Par Nibandh',
    language: 'HINDI',
    author: 'Ravi Sharma',
    image: 'assets/images/writing_1.jpg',
    grade: 'A',
  ),
  Project(
    title: 'Bharatiya Lok Kathayein',
    language: 'HINDI',
    author: 'Pooja Verma',
    image: 'assets/images/writing_2.jpg',
    grade: 'A-',
  ),
  Project(
    title: 'Swachh Bharat Abhiyan ka Mahatva',
    language: 'HINDI',
    author: 'Aman Gupta',
    image: 'assets/images/writing_3.jpg',
    grade: 'B+',
  ),
  Project(
    title: 'Gandhiji ke Siddhant Aur Jeevan',
    language: 'HINDI',
    author: 'Neha Kulkarni',
    image: 'assets/images/writing_4.jpg',
    grade: 'A',
  ),
  Project(
    title: 'Vikas aur Paryavaran ke Beech Santulan',
    language: 'HINDI',
    author: 'Rajesh Iyer',
    image: 'assets/images/writing_5.jpg',
    grade: 'A-',
  ),
];


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Portfolio', 
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag, color: Colors.deepOrange),
            onPressed: () {},
          ),
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                icon: const Icon(Icons.notifications, color: Colors.deepOrange),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(width: 10),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Project'),
            Tab(text: 'Saved'),
            Tab(text: 'Shared'),
            Tab(text: 'Achievement'),
          ],
          indicatorColor: Colors.deepOrange,
          labelColor: Colors.deepOrange,
          unselectedLabelColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildProjectTab(),
          const Center(child: Text('Saved Content')),
          const Center(child: Text('Shared Content')),
          const Center(child: Text('Achievement Content')),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigation(currentIndex: 1),
    );
  }

  Widget _buildProjectTab() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search a project',
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              suffixIcon: Container(
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: projects.length,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              return ProjectCard(project: projects[index]);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.filter_list),
            label: const Text('Filter'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}