import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/constants/api_endpoint.dart';
import '../../../cart/presentation/viewmodel/cart_view_model.dart';
import '../state/product_state.dart';
import '../viewmodel/menu_view_model.dart';

class MenuPage extends ConsumerStatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  ConsumerState<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends ConsumerState<MenuPage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();

  bool isLoading = false;
  int currentPage = 1;
  bool hasMore = true;
  String selectedCategory = '';

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(menuViewModelProvider.notifier).getProduct(page: 1);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.extentAfter < 500 && !isLoading && hasMore) {
      _loadMoreProducts();
    }
  }

  Future<void> _refreshProducts() async {
    setState(() {
      currentPage = 1;
      hasMore = true;
      selectedCategory = '';
    });
    await ref.read(menuViewModelProvider.notifier).refreshProduct();
  }

  void _loadMoreProducts() async {
    setState(() {
      isLoading = true;
    });
    int nextPage = currentPage + 1;
    final result = await ref
        .read(menuViewModelProvider.notifier)
        .getProduct(page: nextPage);
    if (result) {
      setState(() {
        isLoading = false;
        currentPage = nextPage;
      });
    } else {
      setState(() {
        isLoading = false;
        hasMore = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(menuViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshProducts,
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              SearchBar(),
              CategoryList(
                onCategorySelected: (category) {
                  setState(() {
                    selectedCategory = category;
                    currentPage = 1;
                    hasMore = true;
                  });
                  ref
                      .read(menuViewModelProvider.notifier)
                      .getProductsByCategory(category, page: 1);
                },
              ),
              SortDropdown(),
              FoodGrid(
                foodItems: state.lstproduct,
                isLoading: isLoading,
                hasMore: hasMore,
              ),
              if (isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Icon(Icons.search, color: Colors.grey),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search here',
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 16),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(Icons.tune, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  final Function(String) onCategorySelected;

  CategoryList({required this.onCategorySelected});

  final List<Map<String, String>> categories = [
    {'icon': '🍔', 'label': 'Food'},
    {'icon': '🍓', 'label': 'Fruits'},
    {'icon': '🍹', 'label': 'Drinks'},
    {'icon': '🍰', 'label': 'Desserts'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryChip(
            icon: categories[index]['icon']!,
            label: categories[index]['label']!,
            onTap: () => onCategorySelected(categories[index]['label']!),
          );
        },
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onTap;

  CategoryChip({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(icon, style: TextStyle(fontSize: 20)),
            SizedBox(width: 8),
            Text(label,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}

class SortDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Category', style: TextStyle(fontWeight: FontWeight.bold)),
          DropdownButton<String>(
            value: 'Most Popular',
            items: ['Most Popular', 'Newest', 'Price'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (_) {},
          ),
        ],
      ),
    );
  }
}

class FoodGrid extends ConsumerWidget {
  final List<dynamic> foodItems;
  final bool isLoading;
  final bool hasMore;

  const FoodGrid({
    Key? key,
    required this.foodItems,
    required this.isLoading,
    required this.hasMore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 600 ? 2 : 1;
        final childAspectRatio = constraints.maxWidth > 600 ? 4.5 : 3.0;

        return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: childAspectRatio,
            crossAxisSpacing: 16,
            mainAxisSpacing: 8,
          ),
          itemCount: foodItems.length + (hasMore ? 1 : 0),
          itemBuilder: (context, index) {
            if (index < foodItems.length) {
              final item = foodItems[index];
              return FoodItem(
                product: item,
                ref: ref,
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        );
      },
    );
  }
}

class FoodItem extends StatelessWidget {
  final dynamic product;
  final WidgetRef ref;

  FoodItem({
    required this.product,
    required this.ref,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network('${ApiEndpoints.imageUrl}${product.productImage}',
                width: 70, height: 70, fit: BoxFit.cover),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(product.productName,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  SizedBox(height: 2),
                  Text(product.productDescription,
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                  SizedBox(height: 2),
                  Text('\$${product.productPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                          fontSize: 12)),
                ],
              ),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Product is already in favorites')),
                );
                final cartViewModel = ref.read(cartViewModelProvider.notifier);
                cartViewModel.addProductToCart(product.productId);
                cartViewModel.openCartView();
              },
              child: Text('Add', style: TextStyle(fontSize: 12)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                minimumSize: Size(60, 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
