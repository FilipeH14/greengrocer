import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/app_data.dart' as app_data;
import 'package:greengrocer/src/pages/orders/components/order_tile.dart';

class Orderstab extends StatelessWidget {
  const Orderstab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pedidos')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        itemCount: app_data.orders.length,
        separatorBuilder: (_, index) => const SizedBox(height: 10),
        itemBuilder: (_, index) => OrderTile(order: app_data.orders[index]),
        // itemBuilder: (_, index) => Text(app_data.orders[index].id),
      ),
    );
  }
}
