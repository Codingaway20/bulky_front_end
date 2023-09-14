import 'package:bulky_front_end/Utilities/AppConstants.dart';
import 'package:flutter/material.dart';

class ProductTable extends StatelessWidget {
  ProductTable({super.key, required this.allProducts});

  List<DataRow> allProducts;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      dividerThickness: 2,
      showBottomBorder: true,
      columnSpacing: 20,
      decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(color: AppConstants.AppPrimaryColor)),
      columns: const <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              'Title',
              style: TextStyle(fontStyle: FontStyle.italic,color: Colors.purple,fontSize: 20),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Description',
              style: TextStyle(fontStyle: FontStyle.italic,color: Colors.purple,fontSize: 20),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'ISBN',
              style: TextStyle(fontStyle: FontStyle.italic,color: Colors.purple,fontSize: 20),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Author',
              style: TextStyle(fontStyle: FontStyle.italic,color: Colors.purple,fontSize: 20),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'List Price',
              style: TextStyle(fontStyle: FontStyle.italic,color: Colors.purple,fontSize: 20),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              '     ',
           
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              '     ',
           
            ),
          ),
        ),
      ],
      //==================Rows==================//
      rows: allProducts,
    );
  }
}
