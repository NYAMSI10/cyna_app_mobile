import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/helpers/responsive.dart';
import 'package:cyna/features/commande/presentation/screens/commande_screen.dart';
import 'package:flutter/material.dart';

class CommandeDetailScreen extends StatelessWidget {
  final Order order;

  const CommandeDetailScreen({super.key, required this.order});

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  String _statusLabel(OrderStatus status) {
    switch (status) {
      case OrderStatus.active:
        return 'Active';
      case OrderStatus.renewed:
        return 'Renouvelée';
      case OrderStatus.terminated:
        return 'Terminée';
      case OrderStatus.cancelled:
        return 'Résiliée';
    }
  }

  Color _statusColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.active:
        return Colors.green;
      case OrderStatus.renewed:
        return Colors.orange;
      case OrderStatus.terminated:
        return Colors.grey;
      case OrderStatus.cancelled:
        return Colors.red;
    }
  }

  String _formatAmount(double amount) {
    return '${amount.toStringAsFixed(2)} €';
  }

  @override
  Widget build(BuildContext context) {
    final startDate = order.orderDate;
    final endDate = order.subscriptionDuration.toLowerCase() == 'annuel'
        ? DateTime(startDate.year + 1, startDate.month, startDate.day)
        : (order.subscriptionDuration.toLowerCase() == 'mensuel'
            ? DateTime(startDate.year, startDate.month + 1, startDate.day)
            : null);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const BackButton(color: Colors.white),
        backgroundColor: TColors.primaryColor,
        title: const Text(
          "Détails de la Commande",
          style: TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: Responsive.pagePadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Titre + statut
            Text(
              order.serviceName,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Commandé le ${_formatDate(order.orderDate)} • Abonnement ${order.subscriptionDuration.toLowerCase()}',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: _statusColor(order.status),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  _statusLabel(order.status),
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Section Résumé
            Text(
              'Résumé',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade900,
              ),
            ),
            const SizedBox(height: 8),
            _buildInfoRow('Montant total payé', _formatAmount(order.amount)),
            _buildInfoRow('Durée de l’abonnement', order.subscriptionDuration),
            _buildInfoRow('Date de début', _formatDate(startDate)),
            if (endDate != null)
              _buildInfoRow('Date de fin', _formatDate(endDate)),
            const SizedBox(height: 24),

            // Section Paiement
            Text(
              'Paiement',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade900,
              ),
            ),
            const SizedBox(height: 8),
            _buildInfoRow('Mode de paiement', order.paymentMethod),
            _buildInfoRow('Carte', '•••• •••• •••• ${order.last4Digits}'),
            const SizedBox(height: 24),

            // Section Adresse de facturation
            Text(
              'Adresse de facturation',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade900,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Text(
                order.billingAddress,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            const SizedBox(height: 24),

            // Section Facture
            Text(
              'Facture',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade900,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: TColors.secondColor,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Téléchargement de la facture (mock). À connecter au backend.',
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.picture_as_pdf),
                label: const Text('Télécharger la facture (PDF)',
                    style: TextStyle(fontSize: 14)),
              ),
            ),
            const SizedBox(height: 32),

            // Optionnel: bouton support
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.support_agent),
              label:
                  const Text('Contacter le support à propos de cette commande'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 4,
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
