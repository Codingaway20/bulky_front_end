import 'package:bulky_front_end/Bulky.Utilities/AppConstants.dart';
import 'package:flutter/material.dart';

class ProductTable extends StatelessWidget {
  ProductTable({super.key, required this.allProducts});

  List<DataRow> allProducts;

  @override
  Widget build(BuildContext context) {
   
    return DataTable(
      columnSpacing: 20,
      decoration: BoxDecoration(color: AppConstants.AppPrimaryColor),
      columns: const <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              'Ttile',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Description',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'ISBN',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Author',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'List Price',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ],
      //==================Rows==================//
      rows: allProducts,
    );
  }
}
