import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_assi/utils/app_colors.dart';
import 'package:portfolio_assi/model/project.dart';
import 'package:portfolio_assi/widgets/project_card.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late TextEditingController _searchController;
  List<Project> _filteredProjects = [];
  
  final List<Project> _allProjects = [
    Project(
      title: 'Kemampuan Merangkum Tulisan',
      language: 'BAHASA SUNDA',
      author: 'Al-Bajaj Samaan',
      image: 'assets/images/writing_1.jpg',
      grade: 'A',
    ),
    Project(
      title: 'Kemampuan Merangkum Tulisan',
      language: 'BAHASA SUNDA',
      author: 'Al-Bajaj Samaan',
      image: 'assets/images/writing_2.jpg',
      grade: 'A',
    ),
    Project(
      title: 'Kemampuan Merangkum Tulisan',
      language: 'BAHASA SUNDA',
      author: 'Al-Bajaj Samaan',
      image: 'assets/images/writing_3.jpg',
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
      image: 'assets/images/writing_5.jpg',
      grade: 'A',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _searchController = TextEditingController();
    _filteredProjects = List.from(_allProjects);
    
    _searchController.addListener(_filterProjects);
  }

  void _filterProjects() {
    setState(() {
      if (_searchController.text.isEmpty) {
        _filteredProjects = List.from(_allProjects);
      } else {
        _filteredProjects = _allProjects
            .where((project) => project.title
                .toLowerCase()
                .contains(_searchController.text.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Portfolio', 
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          SizedBox(width: 5.w),
          SvgPicture.asset(
            'assets/icons/bag.svg',
            width: 24.w,
            height: 24.h,
            colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
          ),
          SizedBox(width: 12.w),
          Stack(
            alignment: Alignment.topRight,
            children: [
              SvgPicture.asset(
                'assets/icons/user.svg',
                width: 24.w,
                height: 24.h,
                colorFilter: const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: EdgeInsets.all(4.r),
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    'A',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 16.w),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Project'),
            Tab(text: 'Saved'),
            Tab(text: 'Shared'),
            Tab(text: 'Achievement'),
          ],
          indicatorColor: AppColors.primary,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.textPrimary,
          indicatorSize: TabBarIndicatorSize.tab,
          labelPadding: EdgeInsets.symmetric(vertical: 8.h),
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
    );
  }

  Widget _buildProjectTab() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16.r),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search a project',
              hintStyle: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14.sp,
              ),
              filled: true,
              fillColor: AppColors.searchBackground,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              suffixIcon: Container(
                margin: EdgeInsets.all(4.r),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 20.sp,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: _filteredProjects.isEmpty
              ? Center(
                  child: Text(
                    'No projects found',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.textSecondary,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: _filteredProjects.length,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  itemBuilder: (context, index) {
                    return ProjectCard(project: _filteredProjects[index]);
                  },
                ),
        ),
        Padding(
          padding: EdgeInsets.all(16.r),
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/filter.svg',
              width: 20.w,
              height: 20.h,
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
            label: Text(
              'Filter',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.r),
              ),
              elevation: 0,
            ),
          ),
        ),
      ],
    );
  }
}