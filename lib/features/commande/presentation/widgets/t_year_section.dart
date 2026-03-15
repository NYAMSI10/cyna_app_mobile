import 'package:cyna/features/commande/presentation/screens/commande_screen.dart';
import 'package:cyna/features/commande/presentation/widgets/t_order_card.dart';
import 'package:flutter/material.dart';

class TYearSection extends StatelessWidget {
  final int year;
  final List<Order> orders;
  final String Function(DateTime) formatDate;
  final String Function(double) formatAmount;
  final String Function(OrderStatus) statusLabel;
  final Color Function(OrderStatus) statusColor;

  const TYearSection({
    super.key,
    required this.year,
    required this.orders,
    required this.formatDate,
    required this.formatAmount,
    required this.statusLabel,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    // On trie les commandes ici (comme dans ton code)
    final sortedOrders = [...orders]
      ..sort((a, b) => b.orderDate.compareTo(a.orderDate));

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                year.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${sortedOrders.length} commande${sortedOrders.length > 1 ? 's' : ''}',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Column(
            children: sortedOrders
                .map(
                  (order) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: TOrderCard(
                      order: order,
                      formatDate: formatDate,
                      formatAmount: formatAmount,
                      statusLabel: statusLabel,
                      statusColor: statusColor,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
