import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:badges/badges.dart';
import 'package:greengrocer/src/pages/common_widgets/app_name_widget.dart';
import 'package:greengrocer/src/pages/common_widgets/custom_shimmer.dart';
import 'package:greengrocer/src/pages/home/components/category_tile.dart';
import 'package:greengrocer/src/config/app_data.dart' as app_data;
import 'package:greengrocer/src/pages/home/components/item_tile.dart';
import 'package:greengrocer/src/services/utils_sevices.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = 'Frutas';

  final UtilsServices utilsServices = UtilsServices();

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      setState(() => isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppNameWidget(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              right: 15,
            ),
            child: Badge(
              badgeColor: CustomColors.customContrastColor,
              badgeContent: const Text(
                '2',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              child: GestureDetector(
                child: Icon(
                  Icons.shopping_cart,
                  color: CustomColors.customSwatchColor,
                ),
                onTap: () {},
              ),
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                hintText: 'Pesquise aqui...',
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 14,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: CustomColors.customContrastColor,
                  size: 21,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(60),
                  borderSide:
                      const BorderSide(width: 0, style: BorderStyle.none),
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 25),
            height: 40,
            child: !isLoading
                ? ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: app_data.categories.length,
                    separatorBuilder: (_, index) => const SizedBox(width: 10),
                    itemBuilder: (_, index) => CategoryTile(
                      category: app_data.categories[index],
                      isSelected:
                          app_data.categories[index] == selectedCategory,
                      onPressed: () => setState(() {
                        selectedCategory = app_data.categories[index];
                      }),
                    ),
                  )
                : ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      5,
                      (index) => Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(right: 12),
                        child: CustomShimmer(
                          height: 20,
                          width: 80,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
          ),
          Expanded(
            child: !isLoading
                ? GridView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 9 / 11.5,
                    ),
                    itemCount: app_data.items.length,
                    itemBuilder: (_, index) => ItemTile(
                      item: app_data.items[index],
                    ),
                  )
                : GridView.count(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    physics: const BouncingScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 9 / 11.5,
                    children: List.generate(
                      5,
                      (index) => CustomShimmer(
                        height: double.infinity,
                        width: double.infinity,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
