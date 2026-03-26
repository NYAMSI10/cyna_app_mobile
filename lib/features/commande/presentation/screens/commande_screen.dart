import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/helpers/responsive.dart';
import 'package:cyna/features/commande/presentation/widgets/t_empty_state.dart';
import 'package:cyna/features/commande/presentation/widgets/t_filters_row.dart';
import 'package:cyna/features/commande/presentation/widgets/t_search_bar.dart';
import 'package:cyna/features/commande/presentation/widgets/t_year_section.dart';
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
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          TSearchBar(
              searchController: _searchController,
              onChanged: (_) => setState(() {})),
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
                ? TEmptyState(
                    hasFilters: _selectedYear != 'Tous' ||
                        _selectedType != 'Tous' ||
                        _selectedStatus != 'Toutes' ||
                        _searchController.text.trim().isNotEmpty,
                    onReset: () {
                      setState(() {
                        _selectedYear = 'Tous';
                        _selectedType = 'Tous';
                        _selectedStatus = 'Toutes';
                        _searchController.clear();
                      });
                    },
                  )
                : ListView.builder(
                    padding: Responsive.pagePadding(context),
                    itemCount: years.length,
                    itemBuilder: (context, index) {
                      final year = years[index];
                      final orders = groupedByYear[year] ?? [];

                      return TYearSection(
                        year: year,
                        orders: orders,
                        formatDate: _formatDate,
                        formatAmount: _formatAmount,
                        statusLabel: _statusLabel,
                        statusColor: _statusColor,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
