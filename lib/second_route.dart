import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SecondRoute extends StatefulWidget {
  const SecondRoute({super.key});

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  bool isSearchVisible = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return SafeArea(
                  child: SizedBox(
                    height: MediaQuery.of(context)
                        .size
                        .height, // Set height to screen height
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(100.0)),
                              border: Border.all()),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Public Channel",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w600),
                        ),
                        const Text(
                          "328 followers",
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.w300),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Divider(
                            height: 2,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Estd since 2016Estd since 2016Estd since 2016Estd since 2016Estd since 2016Estd since 2016Estd since 2016Estd since 2016Estd since 2016Estd since 2016Estd since 2016"),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Divider(
                            height: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                "Members",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.3),
                                    fontSize: 15.0),
                              ),
                            ],
                          ),
                        ),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.withOpacity(0.5),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(100.0)),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Alpha Beta",
                                              style: TextStyle(
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            Text(
                                              "Alpha Beta",
                                              style: TextStyle(
                                                fontSize: 12.0,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            })
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isSearchVisible
                  ? const SizedBox.shrink()
                  : const Text("Public Channel"),
              isSearchVisible
                  ? const SizedBox.shrink()
                  : const Text(
                      "328 followers",
                      style: TextStyle(fontSize: 15.0),
                    ),
              isSearchVisible
                  ? TextField(
                      decoration: InputDecoration(
                          suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  if (isSearchVisible) {
                                    isSearchVisible = false;
                                  } else {
                                    isSearchVisible = true;
                                  }
                                });
                              },
                              child: const Icon(Icons.close)),
                          hintText: "Enter a text",
                          border: const OutlineInputBorder()),
                    )
                  : const SizedBox.shrink()
            ],
          ),
        ),
        actions: [
          isSearchVisible
              ? const SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          if (isSearchVisible) {
                            isSearchVisible = false;
                          } else {
                            isSearchVisible = true;
                          }
                        });
                      },
                      child: const Icon(Icons.search)),
                )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0))),
                      child: Image.asset("assets/image.png")),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "14:43",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.w700),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width - 10,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius:
                        const BorderRadius.all(Radius.circular(10.0))),
                child: const AutoSizeText(
                  'This text will automatically fffffffffffffffffffffffresize to fit the container.',
                  style: TextStyle(fontSize: 16), // Initial font size
                  maxLines: 2, // Optional: Limit text to 2 lines
                  overflow: TextOverflow
                      .ellipsis, // Optional: Show ellipsis (...) if text overflows
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
