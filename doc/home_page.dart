/*
30
body: StreamBuilderWidget(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final messages = (snapshot.data!.docs).map(
              (e) => NewPlanModel.fromJson(json: e.data(), taskID: e.id),
            );
            return ListView(
              children: messages
                  .map(
                    (e) => NewPlanCard(
                      data: e,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeDetailPage(e),
                          ),
                        );
                      },
                    ),
                  )
                  .toList(),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
 */