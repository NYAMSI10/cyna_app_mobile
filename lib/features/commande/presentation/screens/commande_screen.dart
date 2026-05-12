import 'package:cyna/common/constant/colors.dart';
import 'package:cyna/common/helpers/responsive.dart';
import 'package:cyna/features/commande/data/model/commande_response.dart';
import 'package:cyna/features/commande/presentation/provider/commande_controller.dart';
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
  final String subscriptionDuration;
  final double amount;
  final OrderStatus status;
  final String reference;
  final int nbreProducts;
  final int year;

  Order({
    required this.id,
    required this.serviceName,
    required this.orderDate,
    required this.subscriptionDuration,
    required this.amount,
    required this.status,
    required this.reference,
    required this.nbreProducts,
  }) : year = orderDate.year;

  factory Order.fromCommande(CommandeResponse commande) {
    return Order(
      id: commande.id,
      serviceName: commande.reference,
      orderDate: commande.createdAt,
      subscriptionDuration: commande.periode,
      amount: commande.totalPrice,
      status: _mapStatutToStatus(commande.statut),
      reference: commande.reference,
      nbreProducts: commande.nbreProducts,
    );
  }

  static OrderStatus _mapStatutToStatus(String statut) {
    switch (statut.toUpperCase()) {
      case 'PAID':
        return OrderStatus.active;
      case 'PENDING':
        return OrderStatus.renewed;
      case 'CANCELLED':
        return OrderStatus.cancelled;
      default:
        return OrderStatus.terminated;
    }
  }
}

class CommandeScreen extends ConsumerStatefulWidget {
  const CommandeScreen({super.key});

  @override
  ConsumerState<CommandeScreen> createState() => CommandeScreenState();
}

class CommandeScreenState extends ConsumerState<CommandeScreen> {
  final TextEditingController _searchController = TextEditingController();

  String? _selectedYear;
  String? _selectedType;
  String? _selectedStatus;

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

  List<Order> _applyFilters(List<Order> orders) {
    String query = _searchController.text.trim().toLowerCase();

    return orders.where((order) {
      if (_selectedYear != 'Tous') {
        final intYear = int.tryParse(_selectedYear!);
        if (intYear != null && order.year != intYear) return false;
      }

      if (_selectedType != 'Tous') {
        if (!order.serviceName
            .toLowerCase()
            .contains(_selectedType!.toLowerCase())) {
          return false;
        }
      }

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

      if (query.isNotEmpty) {
        final dateString =
            '${order.orderDate.day.toString().padLeft(2, '0')}/${order.orderDate.month.toString().padLeft(2, '0')}/${order.orderDate.year}';
        if (!order.reference.toLowerCase().contains(query) &&
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
        return 'Payée';
      case OrderStatus.renewed:
        return 'En attente';
      case OrderStatus.terminated:
        return 'Terminée';
      case OrderStatus.cancelled:
        return 'Annulée';
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
    final commandesAsync = ref.watch(commandeControllerProvider);

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
      body: commandesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text('Erreur: $error'),
        ),
        data: (commandes) {
          final orders = commandes.map((c) => Order.fromCommande(c)).toList();

          final filteredOrders = _applyFilters(orders);

          final Map<int, List<Order>> groupedByYear = {};
          for (final order in filteredOrders) {
            groupedByYear.putIfAbsent(order.year, () => []).add(order);
          }

          final List<int> years = groupedByYear.keys.toList()
            ..sort((a, b) => b.compareTo(a));

          return Column(
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
          );
        },
      ),
    );
  }
}
