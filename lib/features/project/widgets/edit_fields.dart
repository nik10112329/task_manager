import 'package:flutter/material.dart';
import 'package:task_manager/features/project/widgets/date_row.dart';
import 'package:task_manager/features/project/widgets/owner_row.dart';
import 'package:task_manager/features/project/widgets/participants_row.dart';

class TMEditFields extends StatelessWidget {
  const TMEditFields({
    required this.participants,
    required this.ownerImage,
    required this.startDate,
    required this.endDate,
    required this.onSelectParticipants,
    required this.onSelectOwner,
    required this.onSelectStartDate,
    required this.onSelectEndDate,
    super.key,
  });

  final Map<String, String?> participants;
  final String ownerImage;
  final DateTime? startDate;
  final DateTime? endDate;

  final VoidCallback onSelectParticipants;
  final VoidCallback onSelectOwner;
  final VoidCallback onSelectStartDate;
  final VoidCallback onSelectEndDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TMOwnerRow(
            ownerImage: ownerImage,
            onTap: onSelectOwner,
          ),
          const SizedBox(height: 10),
          TMParticipantsRow(
            participants: participants,
            onTap: onSelectParticipants,
          ),
          const SizedBox(height: 10),
          TMDateRow(
            startDate: startDate,
            endDate: endDate,
            onStartTap: onSelectStartDate,
            onEndTap: onSelectEndDate,
          ),
        ],
      ),
    );
  }
}
