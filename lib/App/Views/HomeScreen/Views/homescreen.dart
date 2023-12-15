import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  Connectivity connectivity = Connectivity();

  @override
  Widget build(BuildContext context) {
    Stream<ConnectivityResult> connectivity_stream =
        connectivity.onConnectivityChanged;
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomeScreen"),
      ),
      body: StreamBuilder(
        stream: connectivity_stream,
        builder: (BuildContext ctx, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            return (snapshot.data == ConnectivityResult.wifi ||
                    snapshot.data == ConnectivityResult.mobile)
                ? Center(
                    child: Container(
                      height: 400,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "lib/App/Utils/Assets/connected.gif",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: Container(
                      height: 400,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "lib/App/Utils/Assets/not_connected.gif",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
