import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/features/abonnement/presentation/widgets/t_abonnement_title.dart';
import 'package:cyna/features/commande/presentation/widgets/t_filters_row.dart';
import 'package:cyna/features/commande/presentation/widgets/t_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum OrderStatus { active, terminated, renewed, cancelled }

class Order {
  final String id;
  final String serviceName;
  final DateTime orderDate;
  final String subscriptionDuration; // "Mensuel", "Annuel", etc.
  final double amount;
  final OrderStatus status;
  final String paymentMethod; // "Visa", "Mastercard", "Stripe", etc.
  final String last4Digits;
  final String billingAddress;
  final int year;

  Order({
    required this.id,
    required this.serviceName,
    required this.orderDate,
    required this.subscriptionDuration,
    required this.amount,
    required this.status,
    required this.paymentMethod,
    required this.last4Digits,
    required this.billingAddress,
  }) : year = orderDate.year;
}

class CommandeScreen extends ConsumerStatefulWidget {
  const CommandeScreen({super.key});

  @override
  ConsumerState<CommandeScreen> createState() => CommandeScreenState();
}

class CommandeScreenState extends ConsumerState<CommandeScreen> {
  final TextEditingController _searchController = TextEditingController();

  // Mock data pour l’UI
  final List<Order> _orders = [
    Order(
      id: '1',
      serviceName: 'SOC Advanced Plan',
      orderDate: DateTime(2026, 3, 12),
      subscriptionDuration: 'Annuel',
      amount: 149.0,
      status: OrderStatus.active,
      paymentMethod: 'Visa',
      last4Digits: '1234',
      billingAddress: 'WoodPartners\n10 Rue de Paris\n75010 Paris\nFrance',
    ),
    Order(
      id: '2',
      serviceName: 'EDR Basic',
      orderDate: DateTime(2025, 11, 5),
      subscriptionDuration: 'Mensuel',
      amount: 29.9,
      status: OrderStatus.renewed,
      paymentMethod: 'Mastercard',
      last4Digits: '5678',
      billingAddress: 'WoodPartners\n10 Rue de Paris\n75010 Paris\nFrance',
    ),
    Order(
      id: '3',
      serviceName: 'XDR Pro',
      orderDate: DateTime(2024, 6, 20),
      subscriptionDuration: 'Annuel',
      amount: 199.0,
      status: OrderStatus.terminated,
      paymentMethod: 'Visa',
      last4Digits: '4321',
      billingAddress: 'WoodPartners\n10 Rue de Paris\n75010 Paris\nFrance',
    ),
    Order(
      id: '4',
      serviceName: 'SOC Starter',
      orderDate: DateTime(2026, 1, 10),
      subscriptionDuration: 'Mensuel',
      amount: 19.9,
      status: OrderStatus.cancelled,
      paymentMethod: 'Visa',
      last4Digits: '9999',
      billingAddress: 'WoodPartners\n10 Rue de Paris\n75010 Paris\nFrance',
    ),
  ];

  String? _selectedYear; // "Tous" ou année
  String? _selectedType; // "Tous", "SOC", "EDR", "XDR"
  String? _selectedStatus; // "Toutes", "Actives", "Résiliées"

  @override
  void initState() {
    super.initState();
    _selectedYear = 'Tous';
    _selectedType = 'Tous';
    _selectedStatus = 'Toutes';
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<int> get _years {
    final years = _orders.map((o) => o.year).toSet().toList();
    years.sort((a, b) => b.compareTo(a)); // plus récent d’abord
    return years;
  }

  List<Order> _applyFilters() {
    String query = _searchController.text.trim().toLowerCase();

    return _orders.where((order) {
      // Filtre année
      if (_selectedYear != 'Tous') {
        final intYear = int.tryParse(_selectedYear!);
        if (intYear != null && order.year != intYear) return false;
      }

      // Filtre type de service (SOC, EDR, XDR… basé sur le nom du service)
      if (_selectedType != 'Tous') {
        if (!order.serviceName
            .toLowerCase()
            .contains(_selectedType!.toLowerCase())) {
          return false;
        }
      }

      // Filtre statut
      if (_selectedStatus == 'Actives') {
        if (order.status != OrderStatus.active &&
            order.status != OrderStatus.renewed) {
          return false;
        }
      } else if (_selectedStatus == 'Résiliées') {
        if (order.status != OrderStatus.terminated &&
            order.status != OrderStatus.cancelled) {
          return false;
        }
      }

      // Recherche texte (service + date)
      if (query.isNotEmpty) {
        final dateString =
            '${order.orderDate.day.toString().padLeft(2, '0')}/${order.orderDate.month.toString().padLeft(2, '0')}/${order.orderDate.year}';
        if (!order.serviceName.toLowerCase().contains(query) &&
            !dateString.toLowerCase().contains(query)) {
          return false;
        }
      }

      return true;
    }).toList();
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

  String _formatAmount(double amount) {
    return '${amount.toStringAsFixed(2)} €';
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')} '
        '${_monthName(date.month)} '
        '${date.year}';
  }

  String _monthName(int month) {
    const months = [
      '',
      'janvier',
      'février',
      'mars',
      'avril',
      'mai',
      'juin',
      'juillet',
      'août',
      'septembre',
      'octobre',
      'novembre',
      'décembre',
    ];
    return months[month];
  }

  @override
  Widget build(BuildContext context) {
    final filteredOrders = _applyFilters();

    // Regrouper par année
    final Map<int, List<Order>> groupedByYear = {};
    for (final order in filteredOrders) {
      groupedByYear.putIfAbsent(order.year, () => []).add(order);
    }

    final List<int> years = groupedByYear.keys.toList()
      ..sort((a, b) => b.compareTo(a)); // année récente d’abord

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const BackButton(color: Colors.white),
        backgroundColor: TColors.primaryColor,
        title: const Text(
          "Mes Commandes",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          TSearchBar(
              searchController: _searchController,
              onChanged: (_) => setState(() {})),
          // _buildFiltersRow(),
          TFiltersRow(
            years: years,
            selectedYear: _selectedYear!,
            selectedType: _selectedType!,
            selectedStatus: _selectedStatus!,
            onYearChanged: (value) {
              setState(() {
                _selectedYear = value ?? 'Tous';
              });
            },
            onTypeChanged: (value) {
              setState(() {
                _selectedType = value ?? 'Tous';
              });
            },
            onStatusChanged: (value) {
              setState(() {
                _selectedStatus = value ?? 'Toutes';
              });
            },
            onResetFilters: () {
              setState(() {
                _selectedYear = 'Tous';
                _selectedType = 'Tous';
                _selectedStatus = 'Toutes';
              });
            },
          ),
          const Divider(height: 1),
          Expanded(
            child: filteredOrders.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: years.length,
                    itemBuilder: (context, index) {
                      final year = years[index];
                      final orders = groupedByYear[year]!
                        ..sort(
                          (a, b) => b.orderDate.compareTo(a.orderDate),
                        );
                      return _buildYearSection(year, orders!);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildYearSection(int year, List<Order> orders) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // En-tête d’année
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
                '${orders.length} commande${orders.length > 1 ? 's' : ''}',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Liste des commandes
          Column(
            children: orders
                .map(
                  (order) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: _buildOrderCard(order),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderCard(Order order) {
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
              builder: (_) => OrderDetailPage(order: order),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
          child: Row(
            children: [
              // Contenu principal
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Nom du service
                    Text(
                      order.serviceName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Date + durée
                    Text(
                      'Commandé le ${_formatDate(order.orderDate)} • Abonnement ${order.subscriptionDuration.toLowerCase()}',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Montant + statut
                    Row(
                      children: [
                        Text(
                          _formatAmount(order.amount),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '• ${_statusLabel(order.status)}',
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
              // Pastille statut + chevron
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: _statusColor(order.status),
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

  Widget _buildEmptyState() {
    final hasFilters = _selectedYear != 'Tous' ||
        _selectedType != 'Tous' ||
        _selectedStatus != 'Toutes' ||
        _searchController.text.trim().isNotEmpty;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.receipt_long,
              size: 48,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 16),
            Text(
              hasFilters
                  ? 'Aucune commande ne correspond à vos critères.'
                  : 'Vous n’avez pas encore de commande.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            if (hasFilters) ...[
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectedYear = 'Tous';
                    _selectedType = 'Tous';
                    _selectedStatus = 'Toutes';
                    _searchController.clear();
                  });
                },
                child: const Text('Réinitialiser les filtres'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// pages/order_detail_page.dart (toujours dans le même fichier pour l’exemple)

class OrderDetailPage extends StatelessWidget {
  final Order order;

  const OrderDetailPage({super.key, required this.order});

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
        title: const Text('Détail de la commande'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
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
                onPressed: () {
                  // TODO: brancher le téléchargement PDF
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Téléchargement de la facture (mock). À connecter au backend.',
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.picture_as_pdf),
                label: const Text('Télécharger la facture (PDF)'),
              ),
            ),
            const SizedBox(height: 32),

            // Optionnel: bouton support
            OutlinedButton.icon(
              onPressed: () {
                // TODO: action support
              },
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
