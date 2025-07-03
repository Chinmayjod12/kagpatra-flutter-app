import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class UploadScreen extends StatefulWidget {
  final String? kioskUrl;
  const UploadScreen({Key? key, this.kioskUrl}) : super(key: key);

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  int selectedSource = 0; // 0: Device, 1: Google Drive
  String? pickedFileName;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );
    if (result != null) {
      setState(() {
        pickedFileName = result.files.single.name;
      });
      // Move to print preference screen after file selection
      Navigator.pushReplacementNamed(context, '/print-preference');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Upload Your Document'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),
            Text(
              'Choose a source to upload your document for printing.',
              style: TextStyle(fontSize: 15, color: Colors.black87),
            ),
            SizedBox(height: 24),
            _optionCard(
              icon: Icons.cloud_upload_outlined,
              title: 'Upload from Device',
              subtitle: 'Select a document directly from your phone or tablet.',
              selected: selectedSource == 0,
              onTap: () => setState(() => selectedSource = 0),
            ),
            SizedBox(height: 16),
            _optionCard(
              icon: Icons.drive_folder_upload_outlined,
              title: 'Import from Google Drive',
              subtitle: 'Access your documents stored in Google Drive',
              selected: selectedSource == 1,
              onTap: () => setState(() => selectedSource = 1),
            ),
            if (pickedFileName != null && selectedSource == 0) ...[
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.insert_drive_file, color: Color(0xFF2346E6)),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      pickedFileName!,
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedSource == 0
                    ? pickFile
                    : null, // Only device upload for now
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2346E6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text('Continue', style: TextStyle(fontSize: 16)),
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _optionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: selected ? Color(0xFF2346E6) : Color(0xFFE8EDFF),
            width: selected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFE8EDFF),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(10),
              child: Icon(icon, color: Color(0xFF2346E6), size: 28),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                  SizedBox(height: 4),
                  Text(subtitle,
                      style: TextStyle(color: Colors.grey[700], fontSize: 13)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
