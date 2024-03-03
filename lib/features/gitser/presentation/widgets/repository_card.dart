import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gitser/features/gitser/data/models/response/detail/repository_response.dart';

class AvailableRepositoryContent extends StatelessWidget {
  final List<RepositoryResponse> repos;

  const AvailableRepositoryContent({
    Key? key,
    required this.repos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: repos.length,
      separatorBuilder: (context, index) => const SizedBox(
        height: 16.0,
      ),
      itemBuilder: (context, index) {
        RepositoryResponse repository = repos[index];
        return RepositoryCard(repository: repository);
      },
    );
  }
}

class RepositoryCard extends StatelessWidget {
  final RepositoryResponse repository;

  const RepositoryCard({
    Key? key,
    required this.repository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: null,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Text(repository.name!),
            ],
          ),
        ),
      ),
    );
  }
}
