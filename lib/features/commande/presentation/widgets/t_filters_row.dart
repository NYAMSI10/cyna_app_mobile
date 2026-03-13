// t_filters_row.dart

import 'package:flutter/material.dart';

class TFiltersRow extends StatelessWidget {
  const TFiltersRow({
    super.key,
    required this.years,
    required this.selectedYear,
    required this.selectedType,
    required this.selectedStatus,
    required this.onYearChanged,
    required this.onTypeChanged,
    required this.onStatusChanged,
    required this.onResetFilters,
  });

  final List<int> years;
  final String selectedYear; // "Tous" ou année
  final String selectedType; // "Tous", "SOC", "EDR", "XDR"
  final String selectedStatus; // "Toutes", "Actives", "Résiliées"

  final ValueChanged<String?> onYearChanged;
  final ValueChanged<String?> onTypeChanged;
  final ValueChanged<String?> onStatusChanged;
  final VoidCallback onResetFilters;

  @override
  Widget build(BuildContext context) {
    final hasFilters = selectedYear != 'Tous' ||
        selectedType != 'Tous' ||
        selectedStatus != 'Toutes';

    final yearItems = <String>['Tous', ...years.map((e) => e.toString())];

    const types = ['Tous', 'SOC', 'EDR', 'XDR'];
    const statuses = ['Toutes', 'Actives', 'Résiliées'];

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            // Year dropdown
            DropdownButton<String>(
              value: selectedYear,
              onChanged: onYearChanged,
              items: yearItems
                  .map(
                    (year) => DropdownMenuItem<String>(
                      value: year,
                      child: Text('Année: $year'),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(width: 8),

            // Type dropdown
            DropdownButton<String>(
              value: selectedType,
              onChanged: onTypeChanged,
              items: types
                  .map(
                    (type) => DropdownMenuItem<String>(
                      value: type,
                      child: Text('Type: $type'),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(width: 8),

            // Status dropdown
            DropdownButton<String>(
              value: selectedStatus,
              onChanged: onStatusChanged,
              items: statuses
                  .map(
                    (status) => DropdownMenuItem<String>(
                      value: status,
                      child: Text('Statut: $status'),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(width: 8),

            if (hasFilters)
              TextButton.icon(
                onPressed: onResetFilters,
                icon: const Icon(Icons.filter_alt_off),
                label: const Text('Réinitialiser'),
              ),
          ],
        ),
      ),
    );
  }
}
