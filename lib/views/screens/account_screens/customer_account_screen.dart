import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/providers/auth.dart';
import '../../../cubits/auth_cubit.dart';

class CustomerAccountScreen extends StatelessWidget {
  static const routeName = '/customer-account';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('My Account'),
      ),
      body: BlocBuilder<AuthCubit,Auth >(
        builder: (context, auth) {
          if (auth.customer.name == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Column(children: [
                        Text(
                          'Profile',
                          style: TextStyle(fontSize: 30),
                        ),
                        SizedBox(
                          height: 115,
                          width: 115,
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                              'assets/images/profile.png',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ]),
                    ),
                    _buildAccountInfo('Name:', auth.customer.name),
                    _buildAccountInfo(
                        'Phone Number:', auth.customer.phoneNumber),
                    _buildAccountInfo('Gender:', auth.customer.gender),
                    _buildAccountInfo(
                        'Country:', auth.customer.address?.country),
                    _buildAccountInfo(
                        'City:', auth.customer.address?.city),
                    _buildAccountInfo(
                        'City:', auth.customer.address?.street),
                    _buildAccountInfo('ZIP:', auth.customer.address?.zip),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildAccountInfo(String label, String? value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          margin: EdgeInsets.only(bottom: 8.0),
          child: value == null
              ? Text('none')
              : Text(
                  value,
                  style: TextStyle(fontSize: 16),
                ),
        ),
      ],
    );
  }
}
