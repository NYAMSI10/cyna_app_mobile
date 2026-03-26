import 'package:cyna/features/commande/presentation/screens/commande_detail_screen.dart';
import 'package:cyna/features/commande/presentation/screens/commande_screen.dart';
import 'package:flutter/material.dart';

class TOrderCard extends StatelessWidget {
  final Order order;
  final String Function(DateTime) formatDate;
  final String Function(double) formatAmount;
  final String Function(OrderStatus) statusLabel;
  final Color Function(OrderStatus) statusColor;

  const TOrderCard({
    super.key,
    required this.order,
    required this.formatDate,
    required this.formatAmount,
    required this.statusLabel,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => CommandeDetailScreen(order: order),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.serviceName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Commandé le ${formatDate(order.orderDate)} • Abonnement ${order.subscriptionDuration.toLowerCase()}',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          formatAmount(order.amount),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '• ${statusLabel(order.status)}',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: statusColor(order.status),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Icon(
                    Icons.chevron_right,
                    size: 22,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
