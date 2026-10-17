import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'item_detail_screen.dart';

class MarketplaceScreen extends StatelessWidget {
  const MarketplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('The Market',
                    style: AppTheme.fraunces(
                        size: 21,
                        weight: FontWeight.w500,
                        spacing: -0.5)),
                Text('128 ITEMS',
                    style: AppTheme.label(size: 9, spacing: 1.8)),
              ],
            ),
            const SizedBox(height: 18),

            // Search
            Container(
              height: 44,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColors.line),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, size: 18, color: AppColors.faint),
                  const SizedBox(width: 10),
                  Text('Search the collection',
                      style: AppTheme.inter(
                          size: 12, color: AppColors.faint)),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: ['All', 'Seating', 'Lighting', 'Textiles', 'Storage']
                    .map((c) {
                  final on = c == 'All';
                  return Padding(
                    padding: const EdgeInsets.only(right: 7),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: on ? AppColors.terracotta : Colors.white,
                        border: Border.all(
                            color:
                            on ? AppColors.terracotta : AppColors.line),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(c,
                          style: AppTheme.inter(
                            size: 11,
                            weight:
                            on ? FontWeight.w600 : FontWeight.w500,
                            color: on ? Colors.white : AppColors.muted,
                          )),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('SORTED BY MATCH',
                    style: AppTheme.label(size: 9, spacing: 1.8)),
                Text('FILTER',
                    style: AppTheme.label(
                        color: AppColors.forest, size: 9, spacing: 1.8)),
              ],
            ),
            const SizedBox(height: 12),

            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.75,
              children: const [
                _ProductCard(
                    name: 'Moss Accent Chair',
                    shop: 'Karachi Woodworks',
                    price: 'PKR 34,500',
                    match: 92,
                    bg: [Color(0xFFEAEBDE), Color(0xFFD3D6BF)]),
                _ProductCard(
                    name: 'Clay Floor Cushion',
                    shop: 'Lahore Textiles',
                    price: 'PKR 6,200',
                    match: 88,
                    bg: [Color(0xFFEFE6DA), Color(0xFFDAC0A8)]),
                _ProductCard(
                    name: 'Brass Pendant Lamp',
                    shop: 'Sialkot Metal',
                    price: 'PKR 18,900',
                    match: 81,
                    bg: [Color(0xFFF3EAD6), Color(0xFFE2D0A9)]),
                _ProductCard(
                    name: 'Walnut Side Table',
                    shop: 'Karachi Woodworks',
                    price: 'PKR 27,000',
                    match: 76,
                    bg: [Color(0xFFE4E2DB), Color(0xFFCBC8BD)]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final String name;
  final String shop;
  final String price;
  final int match;
  final List<Color> bg;

  const _ProductCard({
    required this.name,
    required this.shop,
    required this.price,
    required this.match,
    required this.bg,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (_) => const ItemDetailScreen())),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(17),
          border: Border.all(color: AppColors.line),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: bg,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 9,
                    left: 9,
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.94),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF060D08)
                                .withOpacity(0.14),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('$match',
                              style: AppTheme.fraunces(
                                size: 12,
                                weight: FontWeight.w600,
                                color: AppColors.forest,
                                spacing: -0.3,
                              )),
                          Text('MATCH',
                              style: AppTheme.label(
                                  size: 5.5, spacing: 0.8)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 11, 12, 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: AppTheme.fraunces(
                          size: 12.5,
                          weight: FontWeight.w500,
                          height: 1.25,
                          spacing: -0.1)),
                  const SizedBox(height: 4),
                  Text(shop,
                      style: AppTheme.inter(
                          size: 9, color: AppColors.muted, spacing: 0.3)),
                  const SizedBox(height: 8),
                  Text(price,
                      style: AppTheme.fraunces(
                        size: 13,
                        weight: FontWeight.w600,
                        color: AppColors.clay,
                        spacing: -0.2,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}