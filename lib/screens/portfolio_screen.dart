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
      title: 'Kemampuan Merangkum Tulisan',
      language: 'BAHASA SUNDA',
      author: 'Al-Bajaj Samaan',
      image: 'assets/images/writing_4.jpg',
      grade: 'A',
    ),
    Project(
      title: 'Kemampuan Merangkum Tulisan',
      language: 'BAHASA SUNDA',
      author: 'Al-Bajaj Samaan',
      image: 'assets/images/writing_4.jpg',
      grade: 'A',
    ),
    Project(
      title: 'Kemampuan Merangkum Tulisan',
      language: 'BAHASA SUNDA',
      author: 'Al-Bajaj Samaan',
      image: 'assets/images/writing_4.jpg',
      grade: 'A',
    ),
    Project(
      title: 'Kemampuan Merangkum Tulisan',
      language: 'BAHASA SUNDA',
      author: 'Al-Bajaj Samaan',
      image: 'assets/images/writing_4.jpg',
      grade: 'A',
    ),
    Project(
      title: 'Kemampuan Merangkum Tulisan',
      language: 'BAHASA SUNDA',
      author: 'Al-Bajaj Samaan',
      image: 'assets/images/writing_4.jpg',
      grade: 'A',
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
            icon: const Icon(Icons.shopping_bag_outlined, color: Colors.deepOrange),
            onPressed: () {},
          ),
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                icon: const Icon(Icons.person_outline, color: Colors.deepOrange),
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.deepOrange,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    'A',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
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
      bottomNavigationBar: const CustomBottomNavigation(currentIndex: 2),
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