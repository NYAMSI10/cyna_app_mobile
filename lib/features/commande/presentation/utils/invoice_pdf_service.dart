import 'dart:typed_data';

import 'package:cyna/features/commande/data/model/commande_response.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

/// Génère et propose au téléchargement / partage / impression la facture
/// PDF d'une commande, dans un design inspiré de la maquette fournie.
class InvoicePdfService {
  // --- Informations du vendeur (Bill From). À adapter aux infos réelles de Cyna. ---
  static const String _sellerName = 'Cyna SAS';
  static const String _sellerAddressLine1 = '10 rue de la Cybersécurité';
  static const String _sellerAddressLine2 = '75002 Paris, France';
  static const String _sellerEmail = 'contact@cyna.fr';

  // --- Palette (alignée sur l'app) ---
  static const PdfColor _accent = PdfColor.fromInt(0xFF8000FF); // violet
  static const PdfColor _blue = PdfColor.fromInt(0xFF0078C7);
  static const PdfColor _dark = PdfColor.fromInt(0xFF1A0B2E);
  static const PdfColor _muted = PdfColor.fromInt(0xFF7A7A8C);
  static const PdfColor _line = PdfColor.fromInt(0xFFE3E3EC);

  /// Construit le document PDF en mémoire.
  static Future<Uint8List> build(CommandeResponse commande) async {
    // Police TrueType embarquée : indispensable pour rendre correctement le
    // symbole € (la police PDF par défaut ne le supporte pas).
    final fontRegular = await PdfGoogleFonts.nunitoRegular();
    final fontBold = await PdfGoogleFonts.nunitoBold();

    final doc = pw.Document(
      theme: pw.ThemeData.withFont(base: fontRegular, bold: fontBold),
    );

    final issuedOn = _formatDate(commande.createdAt);
    final items = commande.abonnements;

    doc.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: pw.EdgeInsets.zero,
        build: (context) => [
          _header(commande),
          pw.Padding(
            padding: const pw.EdgeInsets.fromLTRB(32, 24, 32, 32),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                _datesRow(issuedOn),
                pw.SizedBox(height: 24),
                _billRow(commande),
                pw.SizedBox(height: 28),
                _itemsTable(items),
                pw.SizedBox(height: 16),
                _totalRow(commande.totalPrice),
                pw.SizedBox(height: 28),
                _note(),
              ],
            ),
          ),
        ],
      ),
    );

    return doc.save();
  }

  /// Ouvre la boîte de dialogue native (impression / enregistrement PDF / partage).
  static Future<void> download(CommandeResponse commande) async {
    final bytes = await build(commande);
    await Printing.layoutPdf(
      onLayout: (_) async => bytes,
      name: 'facture_${commande.reference}.pdf',
    );
  }

  // ------------------------------------------------------------------ sections

  static pw.Widget _header(CommandeResponse commande) {
    return pw.Container(
      width: double.infinity,
      color: _dark,
      padding: const pw.EdgeInsets.fromLTRB(32, 28, 32, 28),
      child: pw.Row(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Text(
                    'Facture ',
                    style: pw.TextStyle(
                      color: PdfColors.white,
                      fontSize: 22,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.Text(
                    '#${commande.reference}',
                    style: pw.TextStyle(
                      color: _blue,
                      fontSize: 22,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                ],
              ),
              pw.SizedBox(height: 4),
              pw.Text(
                'ABONNEMENT ${commande.periode}'.toUpperCase(),
                style: pw.TextStyle(
                  color: PdfColors.white.shade(0.15),
                  fontSize: 11,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
          pw.Container(
            width: 40,
            height: 40,
            decoration: pw.BoxDecoration(
              color: _accent,
              borderRadius: pw.BorderRadius.circular(10),
            ),
            alignment: pw.Alignment.center,
            child: pw.Text(
              'C',
              style: pw.TextStyle(
                color: PdfColors.white,
                fontSize: 22,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static pw.Widget _datesRow(String issuedOn) {
    return pw.Row(
      children: [
        _labeledBlock('Émise le', issuedOn),
        pw.SizedBox(width: 48),
        _labeledBlock('Statut', 'Payée'),
      ],
    );
  }

  static pw.Widget _billRow(CommandeResponse commande) {
    final adresse = commande.addresseFacturation;
    final user = commande.user;

    final billToName = adresse != null
        ? '${adresse.firstName} ${adresse.lastName}'
        : (user != null
            ? '${user.firstName ?? ''} ${user.lastName ?? ''}'.trim()
            : 'N/A');

    final email = user?.email;

    final billToLines = <String>[
      if (adresse != null) adresse.adresse,
      if (adresse?.complementAdresse != null &&
          adresse!.complementAdresse!.trim().isNotEmpty)
        adresse.complementAdresse!,
      if (adresse != null) '${adresse.codePostal} ${adresse.city}',
      if (adresse != null) adresse.country,
      if (email != null && email.isNotEmpty) email,
    ];

    return pw.Row(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Expanded(
          child: _addressBlock(
            'De',
            _sellerName,
            [
              _sellerAddressLine1,
              _sellerAddressLine2,
              _sellerEmail,
            ],
          ),
        ),
        pw.SizedBox(width: 24),
        pw.Expanded(
          child: _addressBlock('À', billToName, billToLines),
        ),
      ],
    );
  }

  static pw.Widget _itemsTable(List items) {
    const headerStyleColor = _muted;

    pw.Widget cell(String text,
        {pw.TextAlign align = pw.TextAlign.left,
        bool bold = false,
        PdfColor? color}) {
      return pw.Text(
        text,
        textAlign: align,
        style: pw.TextStyle(
          fontSize: 10,
          fontWeight: bold ? pw.FontWeight.bold : pw.FontWeight.normal,
          color: color ?? PdfColors.black,
        ),
      );
    }

    final rows = <pw.TableRow>[
      pw.TableRow(
        decoration: const pw.BoxDecoration(
          border: pw.Border(bottom: pw.BorderSide(color: _line, width: 1)),
        ),
        children: [
          pw.Padding(
            padding: const pw.EdgeInsets.only(bottom: 8),
            child: cell('Description', color: headerStyleColor),
          ),
          cell('Prix', align: pw.TextAlign.right, color: headerStyleColor),
          cell('Qté', align: pw.TextAlign.right, color: headerStyleColor),
          cell('Total', align: pw.TextAlign.right, color: headerStyleColor),
        ],
      ),
    ];

    for (final dynamic abo in items) {
      final int qty = abo.quantity as int;
      final num lineTotal = abo.price as num;
      final num unit = qty > 0 ? lineTotal / qty : lineTotal;
      final String description = (abo.product?.name as String?) ??
          'Abonnement ${abo.periode}';

      rows.add(
        pw.TableRow(
          decoration: const pw.BoxDecoration(
            border: pw.Border(bottom: pw.BorderSide(color: _line, width: 0.5)),
          ),
          children: [
            pw.Padding(
              padding: const pw.EdgeInsets.symmetric(vertical: 10),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  cell(description, bold: true),
                  pw.SizedBox(height: 2),
                  cell('Clé : ${abo.keyLicence}', color: _muted),
                ],
              ),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.symmetric(vertical: 10),
              child: cell(_amount(unit), align: pw.TextAlign.right),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.symmetric(vertical: 10),
              child: cell('$qty', align: pw.TextAlign.right),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.symmetric(vertical: 10),
              child:
                  cell(_amount(lineTotal), align: pw.TextAlign.right, bold: true),
            ),
          ],
        ),
      );
    }

    return pw.Table(
      columnWidths: const {
        0: pw.FlexColumnWidth(5),
        1: pw.FlexColumnWidth(2),
        2: pw.FlexColumnWidth(1),
        3: pw.FlexColumnWidth(2),
      },
      children: rows,
    );
  }

  static pw.Widget _totalRow(double total) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.end,
      children: [
        pw.Text(
          'Montant total  ',
          style: pw.TextStyle(fontSize: 12, color: _muted),
        ),
        pw.Text(
          _amount(total),
          style: pw.TextStyle(
            fontSize: 18,
            fontWeight: pw.FontWeight.bold,
            color: _accent,
          ),
        ),
      ],
    );
  }

  static pw.Widget _note() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Divider(color: _line),
        pw.SizedBox(height: 8),
        pw.Text(
          'Merci pour votre confiance. Pour toute question relative à cette '
          'facture, contactez-nous à $_sellerEmail.',
          style: pw.TextStyle(fontSize: 9, color: _muted),
        ),
      ],
    );
  }

  // ------------------------------------------------------------------ helpers

  static pw.Widget _labeledBlock(String label, String value) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(label, style: pw.TextStyle(fontSize: 9, color: _muted)),
        pw.SizedBox(height: 2),
        pw.Text(
          value,
          style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
        ),
      ],
    );
  }

  static pw.Widget _addressBlock(
      String label, String name, List<String> lines) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(label, style: pw.TextStyle(fontSize: 9, color: _muted)),
        pw.SizedBox(height: 4),
        pw.Text(
          name,
          style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 2),
        ...lines.map(
          (l) => pw.Text(l, style: pw.TextStyle(fontSize: 10, color: _muted)),
        ),
      ],
    );
  }

  static String _formatDate(DateTime date) =>
      DateFormat('dd MMM yyyy', 'fr_FR').format(date);

  static String _amount(num value) =>
      '${value.toStringAsFixed(2).replaceAll('.', ',')} €';
}
